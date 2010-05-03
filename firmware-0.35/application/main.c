/***************************************************************
 *
 * OpenBeacon.org - main entry for 2.4GHz RFID USB reader
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * basically starts the USB task, initializes all IO ports
 * and introduces idle application hook to handle the HF traffic
 * from the nRF24L01 chip
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
/* Library includes. */
#include <string.h>
#include <stdio.h>

#include <FreeRTOS.h>
#include <AT91SAM7.h>
#include <USB-CDC.h>
#include <task.h>

#include "env.h"
#include "board.h"
#include "main.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_LL.h"
#include "nRF24L01/nRF_API.h"
#include "usbshell.h"

/* Priorities/stacks for the various tasks within the demo application. */
#define mainUSB_PRIORITY			( tskIDLE_PRIORITY + 1 )
#define mainNRF_PRIORITY			( tskIDLE_PRIORITY + 2 )
#define mainUSB_TASK_STACK			( 512 )
#define mainNRF_TASK_STACK			( 512 )

/**********************************************************************/

#define PACKET_SIZE 	64
unsigned char packet[PACKET_SIZE+CHUNK_SIZE];
SelfPacket g_Beacon;
char USB_SYNC = 0;
char status_mode;

const unsigned char mac[5]={0x01,0x02,0x03,0x02,0x01};

unsigned char fifo_queue_buffer[sizeof(HW_Queue_Entry)*22];
FIFOQueue hw_buffer_queue;

/**********************************************************************/
static inline void HaltBlinking(void)
{
    while(1)
    {
	vTaskDelay (portTICK_RATE_MS * 500);
        AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_MASK );

	vTaskDelay (portTICK_RATE_MS * 500);
        AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_MASK );
    }
}

/**********************************************************************/
static inline unsigned char HexChar(unsigned char nibble)
{
    if(nibble<0x0A)
	return nibble+'0';
    else
	return nibble+('A'-0xA);
}

/**********************************************************************/
static inline void prvSetupHardware (void)
{
    // Queue initialisation
    if( !FIFOQueue_init(&hw_buffer_queue, fifo_queue_buffer, sizeof(fifo_queue_buffer), sizeof(HW_Queue_Entry) ) )
	    HaltBlinking();
	
    /*	When using the JTAG debugger the hardware is not always initialised to
	the correct default state.  This line just ensures that this does not
	cause all interrupts to be masked at the start. */
    AT91C_BASE_AIC->AIC_EOICR = 0;

    /*	Enable PIOA outputs. */
    AT91F_PIO_CfgInput ( AT91C_BASE_PIOA, IRQ_PIN  );
    AT91F_PIO_CfgOutput( AT91C_BASE_PIOA, LED_MASK );
    AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_MASK );
 
    /*	Enable the peripheral clock. */
    AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOA;
    AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOB;    

    if(!nRFAPI_Init(DEFAULT_CHANNEL, mac, sizeof(mac)))
	HaltBlinking();

    /* Inititalize nRF24L01 */
    nRFAPI_SetPipeSizeRX(0,sizeof(g_Beacon));
    nRFAPI_SetRxMode(1);
    nRFAPI_SetTxPowerRate(0, 0);

    nRFLL_CE(1);
    status_mode=0;
    
    /* initialize environment variables */
    env_init();
    if(!env_load())
    {
	env.e.speed=2;
	env.e.mode=4;
	env.e.tag_id=666;	
	env_store();
    }
    
    /* Initialization done - Turn on green LED */
    AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_GREEN );
}

/**********************************************************************/
static inline unsigned short swapshort (unsigned short src)
{
    return (src>>8)|(src<<8);
}

/**********************************************************************/
unsigned long swaplong (unsigned long src)
{
    return (src>>24)|(src<<24)|((src>>8)&0x0000FF00)|((src<<8)&0x00FF0000);
}

/**********************************************************************/
void DumpUIntToUSB(unsigned int data)
{
    int i=0;
    unsigned char buffer[14],*p=&buffer[sizeof(buffer)];
    
    do {
	*--p='0'+(char)(data%10);
	data/=10;
	i++;
    } while(data);

    Msg2USB_encap(p-4, i+4, MONITOR_PRINT);
}
/**********************************************************************/

void DumpStringToUSB(char* text)
{
    unsigned char packet[1000];
    unsigned int len = strlen(text);

    memcpy(packet+4, text, len);
    Msg2USB_encap(packet, len+4, MONITOR_PRINT);
}

void DumpCharToUSB(char text)
{
    unsigned char packet[6];

    packet[4] = text;
    packet[5] = 0;
    Msg2USB_encap(packet, 6, MONITOR_PRINT);
}
/**********************************************************************/
void delay(portTickType ticks) {
	portTickType xLastBlink = xTaskGetTickCount() ;
	
	while( xTaskGetTickCount ()-xLastBlink<ticks  );
}

void TransmitBeacon(unsigned portCHAR* payload, unsigned char TxPowerLevel, unsigned char TxRate, unsigned char TxChannel, unsigned char* mac, unsigned char mac_length)   // payload length = 30
{
    // TODO: THREAD SAVE????
    // TODO: check TX_FULL
    // TODO: check free space and use it
    unsigned int i=0;
    unsigned long crc;
    
    // set TX mode
    nRFLL_CE(0);
    nRFAPI_SetRxMode(0);
    nRFAPI_SetTxPowerRate( TxPowerLevel, TxRate );
    nRFAPI_SetChannel( TxChannel );

    // set DESC-MAC
    nRFAPI_SetTxMAC(mac, mac_length);
	
    // setup packet 
    for(i=0; i<sizeof(g_Beacon.payload); i++) g_Beacon.payload[i] = payload[i];
    
    crc = env_crc16(g_Beacon.payload, sizeof (g_Beacon.payload) );
    g_Beacon.crc = swapshort(crc);    
    
    // upload data to nRF24L01
    nRFAPI_TX(g_Beacon.payload, sizeof(SelfPacket) );

    // transmit data
    nRFLL_CE(1);
    status_mode=1;
}

/**********************************************************************/
void vApplicationIdleHook(void)
{    
    unsigned short crc;
    unsigned char status, TxChannel, TxRate;
    static unsigned char blinked=0;
    static portTickType xLastBlink=0; 
    int i;
	
    portCHAR cByte;
	
    if( USB_SYNC==0 ) return;
	
    if(usb_status[0]!=0)
    {
	// work
	cByte = usb_status[1];

	if(cByte>='A' && cByte<='Z')
	    cByte-=('A'-'a');
	
	switch(cByte)
	{
	case '0':
                    nRFAPI_SetRxMode(1);
                    nRFLL_CE(1);
                    // DumpStringToUSB(" * Switched to receive-only mode\n\r");
		    break;
	case 'r':
		TxRate = ( usb_status[2]-'0' );
		if(TxRate==0) TxRate = nRFAPI_GetTxRate(); else TxRate--;
		if(TxRate>1) TxRate=1;
	
		DumpStringToUSB(" * set rate to ");
		DumpUIntToUSB(TxRate);
		DumpStringToUSB("\n\r");
		nRFAPI_SetTxPowerRate( nRFAPI_GetTxPower(), TxRate );
		break;
	case 'c':
		TxChannel=0;
		for(i=0; i<3 && i<usb_status[0]-1; i++) TxChannel = TxChannel*10+(usb_status[i+2]-'0');
		if(TxChannel>125) TxChannel=125;
		DumpStringToUSB(" * switch channel to ");
		DumpUIntToUSB( TxChannel );
		DumpStringToUSB("\n\r");
		nRFAPI_SetChannel( TxChannel );
                nRFAPI_SetRxMode(1);
                nRFLL_CE(1);	
		break;
	case 'h':	
	case '?':
		DumpStringToUSB(	" *********************************************************\n\r"
					" * OpenBeacon USB terminal                               *\n\r"
					" * (C) 2007 Milosch Meriac <meriac@openbeacon.de>        *\n\r"
					" *********************************************************\n\r");
		DumpStringToUSB(	" *\n\r"
						 " * r[0-1]          - rate for transmit \n\r"
						 " * c[0-125]      - channel for transmit \n\r");
		DumpStringToUSB(" * ?,h               - display this help screen\n\r *\n\r"
					" *********************************************************\n\r"
					" * d[0-9] - switch to device \n\r"
					" * x      - exit \n\r");
		DumpStringToUSB(    " *********************************************************\n\r");
		break;
	}
	usb_status[0] = 0;
    }

//    if( !status_mode && nRFAPI_CarrierDetect() )  // media free
    {
		// have data to send?
		HW_Queue_Entry qentry, *pqentry;
		pqentry = &qentry;
		
		if(  FIFOQueue_view( &hw_buffer_queue, (unsigned char**)&pqentry) ) {
			FIFOQueue_pop( &hw_buffer_queue, (unsigned char**)&pqentry);
			TransmitBeacon(pqentry->payload, pqentry->TxPowerLevel, pqentry->TxRate, pqentry->TxChannel, pqentry->mac, OPENBEACON_MACSIZE);
			DumpStringToUSB("send\n\r");
		}
    }
    
     // check for transmit packet
     if( status_mode && (nRFAPI_GetFifoStatus()&FIFO_STATUS_TX_EMPTY)) {
	nRFAPI_SetRxMode(1);
	nRFLL_CE(1);
	status_mode=0;
     }	
    
    if((AT91F_PIO_GetInput(AT91C_BASE_PIOA)&IRQ_PIN)==0)
    {
	status=nRFAPI_GetStatus();
	if(status & MASK_RX_DR_FLAG)
	{
	    // read packet from nRF chip
	    nRFCMD_RegReadBuf(RD_RX_PLOAD,g_Beacon.payload,sizeof(g_Beacon));
	    	    
	    // verify the crc checksum
	    crc = env_crc16(g_Beacon.payload, sizeof(g_Beacon.payload));	    
	    if(swapshort(g_Beacon.crc)==crc) {
		// Recive Beacon
		DumpStringToUSB("Packet Recive\n\r");
		    
		unsigned portCHAR i;
		struct Click2OBD_header* c2obdh;
		    
		for(i=0; i<sizeof(g_Beacon.payload); i++) packet[sizeof(struct packet_header)+sizeof(struct Click2OBD_header)-sizeof(c2obdh->openbeacon_smac)+i] = g_Beacon.payload[i];	    
		    
		c2obdh = (struct Click2OBD_header*)(packet+sizeof(struct packet_header));
		c2obdh->channel = nRFAPI_GetChannel();
		c2obdh->rate       = nRFAPI_GetTxRate();
		c2obdh->power    = nRFAPI_GetTxPower();
				    
		Msg2USB_encap(packet, sizeof(struct packet_header)+sizeof(struct Click2OBD_header)+sizeof(g_Beacon.payload)-sizeof(c2obdh->openbeacon_smac), PACKET_DATA );
				
		blinked = 1;
		xLastBlink = xTaskGetTickCount ();	    
    		AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );
	    } else {
		DumpStringToUSB("crc fail!\n\r");
		blinked = 1;
	        xLastBlink = xTaskGetTickCount ();
            	AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );
	    }
    	    nRFAPI_FlushRX();
	} 
	
	if(status & MASK_MAX_RT_FLAG)
	    nRFAPI_FlushTX();

	nRFAPI_ClearIRQ(status);
    }

    if(blinked && ((xTaskGetTickCount () - xLastBlink) > (portTICK_RATE_MS*10)))
    {
    	blinked = 0;
    	AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_RED );
			
	if(env.e.mode)
	    nRFLL_CE(0);
    }
}

/**********************************************************************/
int main (void)
{
    prvSetupHardware ();
    
    xTaskCreate (vUSBCDCTask, (signed portCHAR *) "USB", mainUSB_TASK_STACK,
	NULL, mainUSB_PRIORITY, NULL);
	
    USB_SYNC = 1;
   
    vUSBShellInit();
    vTaskStartScheduler ();

    return 0;
}
