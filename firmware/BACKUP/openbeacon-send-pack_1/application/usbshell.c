/* usbshell.c - command line interface for configuration and status inquiry
 *
 * Copyright (c) 2008  The Blinkenlights Crew
 *                          Daniel Mack <daniel@caiaq.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */


/* Standard includes. */
#include <stdio.h>
#include <string.h>

/* Scheduler includes. */
#include <FreeRTOS.h>
#include <board.h>
#include <task.h>
#include <semphr.h>
#include <beacontypes.h>
#include "openbeacon.h"
#include "env.h"
#include "USB-CDC.h"
#include "usbshell.h"
#include "main.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_API.h"
#include "led.h"

unsigned char packet[1500];
unsigned char msg_pack[1500];

void printDebug(char* msg) {
	struct packet_header *ph = (struct packet_header *) &msg_pack;
        ph->type    = DEBUG_PRINT;
        ph->high_length = 0;

        sprintf((portCHAR*)(msg_pack+sizeof(struct packet_header) + 3), msg);
        ph->low_length = strlen( (portCHAR*)(msg_pack+sizeof(struct packet_header) + 3) ) + 3 + 1;
        
	usb_send_buffer_zero_copy(msg_pack, ph->low_length+sizeof(struct packet_header), NULL, NULL, portMAX_DELAY);
}

struct openbeacon {
	unsigned char mac[5];
	unsigned char packet_control_field[2];
	unsigned char payload[32];
	unsigned int crc;
};


#define DEFAULT_JAM_DENSITY 10
#define TX_COMMAND_RETRIES 3

#define DEFAULT_CHANNEL 81
static BRFPacket rfpkg;
unsigned int rf_sent_broadcast, rf_sent_unicast, rf_rec;
static unsigned char nrf_powerlevel_current, nrf_powerlevel_last;
static unsigned int jam_density_ms;
static const unsigned char broadcast_mac[NRF_MAX_MAC_SIZE] =
  { 'D', 'E', 'C', 'A', 'D' };
//static unsigned char jam_mac[NRF_MAX_MAC_SIZE] =  { 'J', 'A', 'M', 'M', 0 };
static unsigned char wmcu_mac[NRF_MAX_MAC_SIZE] =
  { 'W', 'M', 'C', 'U', 0 };
#define NRF_POWERLEVEL_MAX 3

void
PtSetRfPowerLevel (unsigned char Level)
{
  nrf_powerlevel_current =
    (Level >= NRF_POWERLEVEL_MAX) ? NRF_POWERLEVEL_MAX : Level;
}

unsigned char
PtGetRfPowerLevel (void)
{
  return nrf_powerlevel_last;
}

static inline s_int8_t
PtInitNRF (void)
{

  if (!nRFAPI_Init (DEFAULT_CHANNEL, broadcast_mac,
                    sizeof (broadcast_mac), ENABLED_NRF_FEATURES))
    return 0;

  jam_density_ms = DEFAULT_JAM_DENSITY;

  nrf_powerlevel_last = nrf_powerlevel_current = -1;
  PtSetRfPowerLevel (NRF_POWERLEVEL_MAX);

  nRFAPI_SetSizeMac (sizeof (wmcu_mac));
  nRFAPI_SetPipeSizeRX (0, sizeof (rfpkg));
  nRFAPI_SetPipeSizeRX (1, sizeof (rfpkg));
  nRFAPI_PipesEnable (ERX_P0 | ERX_P1);
  //PtUpdateWmcuId (env.e.mcu_id == 0);

  nRFAPI_SetRxMode (0);
  nRFCMD_CE (0);

  return 1;
}


static void
usbshell_task (void *pvParameters)
{
	char c, ispacket=0;
	// Antenne
        unsigned int len, lowlen, index;
        memset(packet,0,1500);
  
        len = 0;
        lowlen = 0;
        index = 0;

	// initial sleep
	unsigned int i;
	for (i=0; i<20000; i++) {
		if(!vUSBRecvByte (&c, sizeof (c), 100) ) continue; 
		else {
			ispacket = 1;
			break;
		}
	}

	if (!PtInitNRF ()) {
	    printDebug("PtInitNRF() fail\n");
	    return;
	}
	printDebug("PtInitNRF() OK\n");

	// workloop
	for (;;)
	{	
		
		// recive packet?
		if(vUSBRecvByte (&c, sizeof (c), 100) ) ispacket = 1;

		// read packet
		if(ispacket == 1) {
			// Read Packet
			for (;;) if(vUSBRecvByte (&c, sizeof (c), 100) ) continue; else break;
		}
			
		// Sende von Packete über Antenne
	        vLedSetGreen(1);
			/* disable receive mode */
	 	  	nRFCMD_CE(0);	
//			printDebug("nRFCMD_CE(0)  OK\n");

			/* wait in case a packet is currently received */
			vTaskDelay (3 / portTICK_RATE_MS);
//			printDebug("vTaskDelay(... )  OK\n");

			/* set TX mode */
  			nRFAPI_SetRxMode (0);
//			printDebug("nRFAPI_SetRxMode(0)  OK\n");

			struct openbeacon *openb_pack = (struct openbeacon *)	packet;
			
			openb_pack->mac[0] = broadcast_mac[0];
			openb_pack->mac[1] = broadcast_mac[1];
			openb_pack->mac[2] = broadcast_mac[2];
			openb_pack->mac[3] = broadcast_mac[3];
			openb_pack->mac[4] = broadcast_mac[4];

			openb_pack->payload[0] = 'H';
			openb_pack->payload[1] = 'i';
			openb_pack->payload[2] = '\n';
			openb_pack->payload[3] = 0;
	
//			printDebug("RFAPI_TX ?\n");

			/* upload data to nRF24L01 */
  			nRFAPI_TX ((unsigned char *) openb_pack, sizeof(struct openbeacon) );
//			printDebug("nRFAPI_TX ((unsigned char *) openb_pack, sizeof(struct openbeacon) )   OK\n");			

			/* transmit data */
			nRFCMD_CE (1);
//			printDebug("nRFCMD_CE(1)  OK\n");

  			/* wait till packet is transmitted */
  			vTaskDelay (3 / portTICK_RATE_MS);
//			printDebug("vTaskDelay (3 / portTICK_RATE_MS)  OK\n");

  			/* switch to RX mode again */
  			nRFAPI_SetRxMode (1);
//			printDebug("nRFAPI_SetRxMode (1)  OK\n");

		vLedSetGreen(0);

		printDebug("Packet ist raus.");
		ispacket = 0;
	}      
}

void
vUSBShellInit (void) {
	xTaskCreate (usbshell_task, (signed portCHAR *) "USBSHELL", TASK_USBSHELL_STACK, NULL, TASK_USBSHELL_PRIORITY, NULL);
}

