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
#include "rnd.h"
#include "board.h"
#include "openbeacon_comunication.h"
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

#define mainAPP_PRIORITY			( tskIDLE_PRIORITY + 1 )
#define mainAPP_TASK_STACK			( 512 )

/**********************************************************************/

#define PACKET_SIZE 	64
unsigned char packet[PACKET_SIZE+CHUNK_SIZE];
OpenBeacon_data g_Beacon;
char USB_SYNC = 0;
char status_mode;

const unsigned char mac[5]={0x01,0x02,0x03,0x02,0x01};

unsigned char fifo_queue_buffer[ (sizeof(Click2OBD_header)+32)*22 ];
FIFOQueue hw_buffer_queue;

static unsigned char global_TxPowerLevel, global_TxRate, global_TxChannel;

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
    if( !FIFOQueue_init(&hw_buffer_queue, fifo_queue_buffer, sizeof(fifo_queue_buffer), sizeof(Click2OBD_header)+32 ) )
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

    global_TxPowerLevel	= 0;
    global_TxRate		= 0;
    global_TxChannel		= DEFAULT_CHANNEL;
    
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
    unsigned char buffer[sizeof(OBD2HW_Header)+15],*p=&buffer[sizeof(buffer)];
    
    do {
	*--p='0'+(char)(data%10);
	data/=10;
	i++;
    } while(data);

    Msg2USB_encap(p-sizeof(OBD2HW_Header), i+sizeof(OBD2HW_Header), MONITOR_PRINT);
}
/**********************************************************************/

// Check size and splitt to blocks with size<64
#define MIN(a,b) ((a)>(b)?(b):(a))
void DumpStringToUSB(char* text)
{
	unsigned char packet[1000];
	unsigned int len = strlen(text);
    
	memcpy(packet+sizeof(OBD2HW_Header), text, len);
	Msg2USB_encap(packet, len+sizeof(OBD2HW_Header), MONITOR_PRINT);
}

void DumpCharToUSB(char text)
{
    unsigned char packet[sizeof(OBD2HW_Header)+2];

    packet[sizeof(OBD2HW_Header)+0] = text;
    packet[sizeof(OBD2HW_Header)+1] = 0;
    Msg2USB_encap(packet, 2+sizeof(OBD2HW_Header), MONITOR_PRINT);
}
/**********************************************************************/
void delay(portTickType ticks) {
	portTickType xLastBlink = xTaskGetTickCount() ;
	
	while( xTaskGetTickCount ()-xLastBlink<ticks  );
}

void TransmitBeacon(unsigned portCHAR* payload, unsigned char TxPowerLevel, unsigned char TxRate, unsigned char TxChannel, unsigned char* mac, unsigned char mac_length)   // payload length = 30
{
    // TODO: check TX_FULL
    // TODO: check free space and use it
    unsigned int i=0;
    unsigned long crc;
    
    // set TX mode
    nRFLL_CE(0);
    nRFAPI_SetRxMode(0);

    if(TxPowerLevel==0) TxPowerLevel = global_TxPowerLevel;	else TxPowerLevel--;	
    if(TxRate==0) TxRate = global_TxRate;				else TxRate--;
    if(TxChannel==0) TxChannel= global_TxChannel;			else TxChannel--;
	
    // check the limit
    if(TxRate>1) TxRate=1;
    if(TxChannel>125) TxChannel=125;
    if(TxPowerLevel>3) TxPowerLevel=3;	
	
    if(mac_length==0) mac_length=0;	
    if(mac[0]==0) mac[0]=0;	


    if( global_TxPowerLevel != TxPowerLevel || global_TxRate!=TxRate ) {
	    global_TxPowerLevel	= TxPowerLevel;
	    global_TxRate		= TxRate;
	    nRFAPI_SetTxPowerRate( global_TxPowerLevel, global_TxRate );    
    }
    if( global_TxChannel != TxChannel ) {
	    global_TxChannel		= TxChannel;
	    nRFAPI_SetChannel( global_TxChannel );
    }

//  set DESC-MAC
//  nRFAPI_SetTxMAC(mac, mac_length);
	
    // setup packet 
    for(i=0; i<sizeof(g_Beacon.payload); i++) g_Beacon.payload[i] = payload[i];
    
    crc = env_crc16(g_Beacon.payload, sizeof (g_Beacon.payload) );
    g_Beacon.crc = swapshort(crc);    

    // set timestamp for tests
    HW_rxtx_Test* ts = (HW_rxtx_Test*)( payload );
    if(ts->prot_type[0]==0x06 && ts->prot_type[1]==0x06) {
	ts->timestamp_send =  xTaskGetTickCount();
    }
    
    // upload data to nRF24L01
    nRFAPI_TX(g_Beacon.payload, sizeof(OpenBeacon_data) );

    // transmit data
    nRFLL_CE(1);
    status_mode=1;
}

/**********************************************************************/
void vApplicationIdleHook(void)
{    

}

/**********************************************************************/

static void
main_input_task (void *pvParameters)
{
	static portTickType yLastBlink=0; 
	portCHAR cByte;	
	int i;
	unsigned char TxChannel, TxRate, tx_count;
		
	(void) pvParameters;	
	
	while( USB_SYNC==0 );

	while(true) {
	
		if( xTaskGetTickCount()-yLastBlink>500 ) {
//			DumpStringToUSB("x");
			yLastBlink = xTaskGetTickCount();
		}

		if(usb_status[0]!=0)
		{
			// work
			cByte = usb_status[1];
			if(cByte>='A' && cByte<='Z') cByte-=('A'-'a');

			switch(cByte)
			{
				case 'k':
					tx_count=0;

					for(i=0; i<3 && i<usb_status[0]-1; i++) tx_count = tx_count*10+(usb_status[i+2]-'0');
					// create testpacket
					unsigned char*  buffer[64];
							
					Click2OBD_header *pc2obdh;
					pc2obdh = (Click2OBD_header *)buffer;
					    
					pc2obdh->status = STATUS_hw_rxtx_test;
					pc2obdh->count  = tx_count-1;
					pc2obdh->rate     = 0;
					pc2obdh->power  = 0;
					pc2obdh->channel = 0;
					   
					memcpy(pc2obdh->openbeacon_dmac, mac, sizeof(mac));
					memcpy(pc2obdh->openbeacon_smac, mac, sizeof(mac));

					HW_rxtx_Test *ts =    (HW_rxtx_Test *) (buffer+sizeof(Click2OBD_header) - sizeof(pc2obdh->openbeacon_smac));
					ts->type = 1;                     // send count packets over hw-link
					ts->prot_type[0] = 0x06;
					ts->prot_type[1] = 0x06;
					ts->count = tx_count-1;
					ts->number = 0;

					FIFOQueue_push( &hw_buffer_queue,  (unsigned char**)&pc2obdh);
					break;

				case '0':
					nRFAPI_SetRxMode(1);
					nRFLL_CE(1);
					// DumpStringToUSB(" * Switched to receive-only mode\n\r");
					break;
				case 'r':
					TxRate = ( usb_status[2]-'0' );
					if(TxRate==0) TxRate = global_TxRate;				else TxRate--;
					if(TxRate>1) TxRate = 1;
					if(global_TxRate != TxRate) {
						global_TxRate = TxRate;
						nRFAPI_SetTxPowerRate( global_TxPowerLevel, global_TxRate );
						DumpStringToUSB(" * set rate to ");
						DumpUIntToUSB(TxRate);
						DumpStringToUSB("\n\r");
					} else DumpStringToUSB("no change the rate\n\r");
					
					break;
				case 'c':
					TxChannel=0;
					for(i=0; i<3 && i<usb_status[0]-1; i++) TxChannel = TxChannel*10+(usb_status[i+2]-'0');
					if(TxChannel>125) TxChannel=125;

					if(TxChannel==0) TxChannel = global_TxChannel;				else TxChannel--;
					if(TxChannel>125) TxChannel = 125;
					if(global_TxChannel != TxChannel) {
						global_TxChannel = TxChannel;
						nRFAPI_SetChannel( TxChannel );
						nRFAPI_SetRxMode(1);
						nRFLL_CE(1);	
						
						DumpStringToUSB(" * switch channel to ");
						DumpUIntToUSB( TxChannel );
						DumpStringToUSB("\n\r");
					} else DumpStringToUSB("no change the channel\n\r");		
					break;
				case 'h':	
				case '?':
					DumpStringToUSB(" ********************************************************\n\r");
					DumpStringToUSB(" * OpenBeacon USB terminal\t\t\t\t*\n\r");
					DumpStringToUSB(" * (C) 2007 Milosch Meriac <meriac@openbeacon.de>\t*\n\r");
					DumpStringToUSB(" ********************************************************\n\r");
					DumpStringToUSB(" *\t\t\t\t\t\t\t*\n\r");
					DumpStringToUSB(" * r[0-1]\t- rate for transmit \t\t\t*\n\r");
					DumpStringToUSB(" * c[0-125]\t- channel for transmit\t\t\t*\n\r");
					DumpStringToUSB(" * k[0-255]\t- transmit x packet over hw link\t*\n\r");
					DumpStringToUSB(" * ?,h\t\t- display this help screen\t\t*\n\r *\t\t\t\t\t\t\t*\n\r");
					DumpStringToUSB(" ********************************************************\n\r");
					DumpStringToUSB(" * d[0-9]\t- switch to device \t\t\t*\n\r");
					DumpStringToUSB(" * x\t\t- exit \t\t\t\t\t*\n\r");
					DumpStringToUSB(" ********************************************************\n\r");
					DumpStringToUSB(" * Status:\t\t\t\t\t\t*\n\r");
					DumpStringToUSB(" *       Power: ");
					DumpUIntToUSB( global_TxPowerLevel );
					DumpStringToUSB("    Rate: ");
					DumpUIntToUSB( global_TxRate );
					DumpStringToUSB("    Channel: ");
					DumpUIntToUSB( global_TxChannel );
					DumpStringToUSB("\t\t*\n\r");
					DumpStringToUSB(" ********************************************************\n\r");
					break;
			}
			usb_status[0] = 0;
		}
	}
}

/**********************************************************************/
static void
main_app_task (void *pvParameters)
{
	unsigned short crc;
	unsigned char status;
	static unsigned char blinked=0;
	static portTickType xLastBlink=0, yLastBlink=0; 
	static portTickType xNextSend=0; 
	
	(void) pvParameters;	
	
	while( USB_SYNC==0 );

	while(true) {
		if( xTaskGetTickCount()-yLastBlink>500 ) {
//			DumpStringToUSB("y");
			yLastBlink = xTaskGetTickCount();
		}

		if( !status_mode && xNextSend<xTaskGetTickCount() && FIFOQueue_elements( &hw_buffer_queue )>0 ) {
			if( !nRFAPI_CarrierDetect() )  // media free
			{
				// have data to send?
				Click2OBD_header *pqentry=NULL;

				if(  FIFOQueue_view( &hw_buffer_queue, (unsigned char**)&pqentry) ) {
					// HW_RXTX_TEST:  set timestamp for any packet 
					if(pqentry->status&STATUS_hw_rxtx_test) {
						// TODO:  check the prot_type for valid value (expl. 0x0606)
						HW_rxtx_Test* ts = (HW_rxtx_Test*)(pqentry+sizeof(Click2OBD_header)-sizeof(pqentry->openbeacon_smac));
						
						if(ts->prot_type[0]==0x06 && ts->prot_type[1]==0x06) {
							ts->number++;
							ts->timestamp_send = xTaskGetTickCount();
						}
					}
					
					TransmitBeacon(  (unsigned char*)(pqentry+sizeof(Click2OBD_header)-sizeof(pqentry->openbeacon_smac)), pqentry->power, pqentry->rate, pqentry->channel, pqentry->openbeacon_dmac, OPENBEACON_MACSIZE);
					DumpStringToUSB("Packet Send\n\r");
					
					// check status flag 
					if(  !(pqentry->status&STATUS_hw_rxtx_test) || (pqentry->count--)==0) FIFOQueue_pop( &hw_buffer_queue, (unsigned char**)&pqentry);
					
					xNextSend = xTaskGetTickCount() + 50; // TODO:
				}
			} else {  // Randomtime warten
				xNextSend = xTaskGetTickCount() + RndNumber()%50;
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
					Click2OBD_header* c2obdh;
			    
					for(i=0; i<sizeof(g_Beacon.payload); i++) packet[sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-sizeof(c2obdh->openbeacon_smac)+i] = g_Beacon.payload[i];	    
			    
					c2obdh = (Click2OBD_header*)(packet+sizeof(OBD2HW_Header));
					c2obdh->channel = nRFAPI_GetChannel();
					c2obdh->rate       = nRFAPI_GetTxRate();
					c2obdh->power    = nRFAPI_GetTxPower();
			    
					// check for hw test
					HW_rxtx_Test* ts = (HW_rxtx_Test*)( packet+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-sizeof(c2obdh->openbeacon_smac) );
					if(ts->prot_type[0]==0x06 && ts->prot_type[1]==0x06) {
						ts->timestamp_recive =  xTaskGetTickCount();
					}
					// TODO: set state for real recive
				
					Msg2USB_encap(packet, sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)+sizeof(g_Beacon.payload)-sizeof(c2obdh->openbeacon_smac), PACKET_DATA );
				} else {
					DumpStringToUSB("crc fail!\n\r");
				}

				blinked = 1;
				xLastBlink = xTaskGetTickCount ();
				AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );
				nRFAPI_FlushRX();
			} 

			if(status & MASK_MAX_RT_FLAG) nRFAPI_FlushTX();
			nRFAPI_ClearIRQ(status);
		}

		if(blinked && ((xTaskGetTickCount () - xLastBlink) > (portTICK_RATE_MS*10)))
		{
			blinked = 0;
			AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_RED );
			
			if(env.e.mode)	nRFLL_CE(0);
		}
		
	}
}


int main (void)
{
    USB_SYNC=0;
	prvSetupHardware ();
	xTaskCreate (vUSBCDCTask, (signed portCHAR *) "USB", mainUSB_TASK_STACK, NULL, mainUSB_PRIORITY, NULL);
    USB_SYNC = 1;
	   
    xTaskCreate (usbshell_task	, (signed portCHAR *) "USBSHELL"	, mainAPP_TASK_STACK	, NULL, mainAPP_PRIORITY, NULL);
    xTaskCreate (main_app_task	, (signed portCHAR *) "MAIN_APP"	, mainAPP_TASK_STACK	, NULL, mainAPP_PRIORITY, NULL);
    xTaskCreate(main_input_task, (signed portCHAR *) "MAIN_INPUT", mainAPP_TASK_STACK	, NULL, mainAPP_PRIORITY, NULL);
	
    vTaskStartScheduler ();

    return 0;
}
