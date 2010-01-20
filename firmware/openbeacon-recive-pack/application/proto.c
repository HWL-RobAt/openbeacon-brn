/***************************************************************
 *
 * OpenBeacon.org - OpenBeacon link layer protocol
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 ***************************************************************

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; version 2.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

*/
#include <FreeRTOS.h>
#include <semphr.h>
#include <task.h>
#include <string.h>
#include <stdio.h>
#include <board.h>
#include <beacontypes.h>
#include <crc32.h>
#include "led.h"
#include "xxtea.h"
#include "openbeacon.h"
#include "bprotocol.h"
#include "proto.h"
#include "usbshell.h"
#include "USB-CDC.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_API.h"
#include "env.h"
#include "rnd.h"

#define DEFAULT_JAM_DENSITY 10
#define TX_COMMAND_RETRIES 3

static BRFPacket rfpkg;
unsigned int rf_sent_broadcast, rf_sent_unicast, rf_rec;
static unsigned char nrf_powerlevel_current, nrf_powerlevel_last;
static unsigned int jam_density_ms;
static const unsigned char broadcast_mac[NRF_MAX_MAC_SIZE] =
  { 'D', 'E', 'C', 'A', 'D' };
static unsigned char jam_mac[NRF_MAX_MAC_SIZE] =
  { 'J', 'A', 'M', 'M', 0 };
static unsigned char wmcu_mac[NRF_MAX_MAC_SIZE] =
  { 'W', 'M', 'C', 'U', 0 };

unsigned char packet[100]; 
  
static void
PtUpdateWmcuId (unsigned char broadcast)
{
  /* update jamming data channel id */
  if (broadcast)
    nRFAPI_SetTxMAC (broadcast_mac, sizeof (broadcast_mac));
  else
    {
      jam_mac[sizeof (jam_mac) - 1] = env.e.mcu_id;
      nRFAPI_SetTxMAC (jam_mac, sizeof (jam_mac));
    }

  /* update WMCU id for response channel */
  wmcu_mac[sizeof (wmcu_mac) - 1] = env.e.mcu_id;
  nRFAPI_SetRxMAC (wmcu_mac, sizeof (wmcu_mac), 1);
}

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
  PtUpdateWmcuId (env.e.mcu_id == 0);

  nRFAPI_SetRxMode (0);
  nRFCMD_CE (0);

  return 1;
}

static void
shuffle_tx_byteorder (unsigned long *v, int len)
{
  while (len--)
    {
      *v = PtSwapLong (*v);
      v++;
    }
}

void
PtSetRfJamDensity (unsigned char milliseconds)
{
  jam_density_ms = milliseconds;
}

unsigned char
PtGetRfJamDensity (void)
{
  return jam_density_ms;
}

static void
vnRFtaskRxTx (void *parameter)
{
  u_int32_t crc; //, t;
  u_int8_t status;
//  portTickType last_ticks = 0, jam_ticks = 0;

  if (!PtInitNRF ())
    return;

  for (;;)
    {
      /* check if TX strength changed */
      if (nrf_powerlevel_current != nrf_powerlevel_last)
	{
	  nRFAPI_SetTxPower (nrf_powerlevel_current);
	  nrf_powerlevel_last = nrf_powerlevel_current;
	}

      status = nRFAPI_GetFifoStatus ();
      /* living in a paranoid world ;-) */
      if (status & FIFO_TX_FULL)
	nRFAPI_FlushTX ();

      /* check for received packets */
      if ((status & FIFO_RX_FULL) || nRFCMD_WaitRx (0))
	{
	  vLedSetGreen (0);

	  do
	    {
	      /* read packet from nRF chip */
	      nRFCMD_RegReadBuf (RD_RX_PLOAD, (unsigned char *) &rfpkg,
				 sizeof (rfpkg));

	      /* adjust byte order and decode */
	      shuffle_tx_byteorder ((unsigned long *) &rfpkg,
				    sizeof (rfpkg) / sizeof (long));
	      xxtea_decode ((long *) &rfpkg, sizeof (rfpkg) / sizeof (long));
	      shuffle_tx_byteorder ((unsigned long *) &rfpkg,
				    sizeof (rfpkg) / sizeof (long));

	      /* verify the crc checksum */
	      crc =
		crc32 ((unsigned char *) &rfpkg,
		       sizeof (rfpkg) - sizeof (rfpkg.crc));
	      if ((crc == PtSwapLong (rfpkg.crc)) &&
		  (rfpkg.wmcu_id == env.e.mcu_id) &&
		  (rfpkg.cmd & RF_PKG_SENT_BY_DIMMER))
		{
		  // Sende Daten an die Zwischenschicht, um zu sehen ob was empfangen wird
		  memset(packet,0,100);
		  sprintf((portCHAR*)(packet+sizeof(struct packet_header) + 3), "Hallo ich höre!");		
  		  u_int8_t  length = strlen( (portCHAR*)(packet+sizeof(struct packet_header) + 3) ) + 3 + 1;
		  usb_send_buffer_zero_copy(packet, length+sizeof(struct packet_header),  NULL, NULL, portMAX_DELAY);
			
		  rf_rec++;
		}
	    }
	  while ((nRFAPI_GetFifoStatus () & FIFO_RX_EMPTY) == 0);

	  vLedSetGreen (1);
	}
      
	vTaskDelay (5 / portTICK_RATE_MS);

        /* did I already mention the paranoid world thing? */
        nRFAPI_ClearIRQ (MASK_IRQ_FLAGS);
    }
}

void
PtInitProtocol (void)
{
  rf_rec = rf_sent_unicast = rf_sent_broadcast = 0;
  xTaskCreate (vnRFtaskRxTx, (signed portCHAR *) "nRF_RxTx", TASK_NRF_STACK,
	       NULL, TASK_NRF_PRIORITY, NULL);
}
