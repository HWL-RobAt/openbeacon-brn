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
#include "xxtea.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_LL.h"
#include "nRF24L01/nRF_API.h"

/* Priorities/stacks for the various tasks within the demo application. */
#define mainUSB_PRIORITY			( tskIDLE_PRIORITY + 1 )
#define mainNRF_PRIORITY			( tskIDLE_PRIORITY + 2 )
#define mainUSB_TASK_STACK			( 512 )
#define mainNRF_TASK_STACK			( 512 )

/**********************************************************************/
TBeaconEnvelope g_Beacon;

const unsigned char mac[5]={0x01,0x02,0x03,0x02,0x01};

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

    if(!nRFAPI_Init(DEFAULT_CHANNEL,mac,sizeof(mac)))
	HaltBlinking();

    /* Inititalize nRF24L01 */
    nRFAPI_SetPipeSizeRX(0,sizeof(g_Beacon));
    nRFAPI_SetRxMode(1);
    nRFLL_CE(1);
    
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
#define SHUFFLE(a,b)    tmp=g_Beacon.datab[a];\
                        g_Beacon.datab[a]=g_Beacon.datab[b];\
                        g_Beacon.datab[b]=tmp;

/**********************************************************************/
static inline void shuffle_tx_byteorder (void)
{
    unsigned char tmp;

    SHUFFLE (0 +  0, 3 +  0);
    SHUFFLE (1 +  0, 2 +  0);
    SHUFFLE (0 +  4, 3 +  4);
    SHUFFLE (1 +  4, 2 +  4);
    SHUFFLE (0 +  8, 3 +  8);
    SHUFFLE (1 +  8, 2 +  8);
    SHUFFLE (0 + 12, 3 + 12);
    SHUFFLE (1 + 12, 2 + 12);
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
    unsigned char buffer[10],*p=&buffer[sizeof(buffer)];
    
    do {
	*--p='0'+(unsigned char)(data%10);
	data/=10;
	i++;
    } while(data);
    
    while(i--)
	vUSBSendByte(*p++);        
}
/**********************************************************************/

void DumpStringToUSB(char* text)
{
    unsigned char data;
    
    if(text)
	while((data=*text++)!=0)
	    vUSBSendByte(data);
}
/**********************************************************************/

void TransmitBeacon(unsigned int TxPowerLevel)
{
    static unsigned long seq=0;
    unsigned long crc;
    
    if(TxPowerLevel>3)
	TxPowerLevel=3;	

    // set TX mode    
    nRFAPI_SetRxMode(0);
    nRFAPI_SetTxPower(TxPowerLevel);

    // setup packet 
    g_Beacon.pkt.hdr.size = sizeof (TBeaconTracker);
    g_Beacon.pkt.hdr.proto = RFBPROTO_BEACONTRACKER;
    g_Beacon.pkt.flags = 0;
    g_Beacon.pkt.strength = 0x55 * TxPowerLevel;
    g_Beacon.pkt.seq = swaplong (seq++);
    g_Beacon.pkt.oid = swaplong (env.e.tag_id);
    g_Beacon.pkt.reserved = 0;

    crc = env_crc16(g_Beacon.datab, sizeof (g_Beacon.pkt) - sizeof (g_Beacon.pkt.crc));
    g_Beacon.pkt.crc = swapshort(crc);    
    
    // encrypt the data
    shuffle_tx_byteorder ();
    xxtea_encode ();
    shuffle_tx_byteorder ();

    // upload data to nRF24L01
    nRFAPI_TX(g_Beacon.datab, sizeof(g_Beacon));

    // transmit data
    nRFLL_CE(1);
}

/**********************************************************************/
void vApplicationIdleHook(void)
{    
    unsigned short crc;
    unsigned char status;
    static unsigned char blinked=0;
    static portTickType xLastBlink=0,xLastTx=0;
    static unsigned int xTxPowerLevel=0;
    portCHAR cByte;
    
    if(vUSBRecvByte(&cByte,1,100))
    {
	if(cByte>='A' && cByte<='Z')
	    cByte-=('A'-'a');
	    
	if(cByte>='1' && cByte<='4')
	{
	    DumpStringToUSB(" * Switched to transmit mode at power level ");
	    vUSBSendByte(cByte);
	    DumpStringToUSB("\n\r");
	    	    
	    env.e.mode=cByte-'0';

	    nRFLL_CE(0);
	    nRFAPI_SetRxMode(0);
	}
	else
	    switch(cByte)
	    {
		case 's':
		    env_store();
		    DumpStringToUSB(" * Stored environment variables\n\r");
		    break;
		case '0':
		    nRFAPI_SetRxMode(1);
		    nRFLL_CE(1);
		    env.e.mode=0;
		    DumpStringToUSB(" * Switched to receive-only mode\n\r");
		    break;
		case '+':
		case '-':
		    if(cByte=='+')
		    {
			if(env.e.speed<9)
			    env.e.speed++;
		    }
		    else
			if(env.e.speed>1)
			    env.e.speed--;
		    			
		    DumpStringToUSB(" * Transmit interval set to ");
		    vUSBSendByte(((char)(env.e.speed))+'0');		    
		    DumpStringToUSB("00ms\n\r");
		    break;		    
		case 'h':	
		case '?':
		    DumpStringToUSB(
			" *****************************************************\n\r"
			" * OpenBeacon USB terminal                           *\n\r"
			" * (C) 2007 Milosch Meriac <meriac@openbeacon.de>    *\n\r"
			" *****************************************************\n\r"
			" *\n\r"
			" * s    - store transmitter settings\n\r"
			" * 0    - receive only mode\n\r"
			" * 1..4 - automatic transmit at selected power levels\n\r"
			" * +,-  - faster/slower transmit speed\n\r"
			" * ?,h  - display this help screen\n\r"
			" *\n\r"
			" *****************************************************\n\r"
			);
		    break;
	    }
    }
    
    if(env.e.mode && ((xTaskGetTickCount () - xLastTx) > (portTICK_RATE_MS*100*env.e.speed)))
    {
	TransmitBeacon(xTxPowerLevel++);
	if(xTxPowerLevel>=env.e.mode)
	    xTxPowerLevel=0;

	blinked = 1;
	xLastBlink = xLastTx = xTaskGetTickCount ();	    
	AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );	
    }
    
    if((AT91F_PIO_GetInput(AT91C_BASE_PIOA)&IRQ_PIN)==0)
    {
	status=nRFAPI_GetStatus();

	if(status & MASK_RX_DR_FLAG)
	{
	    // read packet from nRF chip
	    nRFCMD_RegReadBuf(RD_RX_PLOAD,g_Beacon.datab,sizeof(g_Beacon));
	    	    
	    // adjust byte order and decode
	    shuffle_tx_byteorder();
	    xxtea_decode();
	    shuffle_tx_byteorder();
	    
	    // verify the crc checksum
	    crc = env_crc16(g_Beacon.datab, sizeof(g_Beacon)-sizeof(g_Beacon.pkt.crc));	    
	    if(swapshort(g_Beacon.pkt.crc)==crc)
	    {
		DumpUIntToUSB(swaplong(g_Beacon.pkt.oid));
		vUSBSendByte(',');
		DumpUIntToUSB(swaplong(g_Beacon.pkt.seq));
		vUSBSendByte(',');
		DumpUIntToUSB(g_Beacon.pkt.strength);
		vUSBSendByte(',');
		DumpUIntToUSB(g_Beacon.pkt.flags);		    		
		DumpStringToUSB("\n\r");
				
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

    vTaskStartScheduler ();

    return 0;
}
