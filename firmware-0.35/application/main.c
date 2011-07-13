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
#include "main.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_LL.h"
#include "nRF24L01/nRF_API.h"
#include "usbshell.h"

/* Priorities/stacks for the various tasks within the demo application. */
#define mainUSB_PRIORITY			( tskIDLE_PRIORITY )
#define mainNRF_PRIORITY			( tskIDLE_PRIORITY )
#define mainUSB_TASK_STACK			( 512 )
#define mainNRF_TASK_STACK			( 512 )

#define mainAPP_PRIORITY			( tskIDLE_PRIORITY )
#define mainAPP_TASK_STACK			( 512 )

/**********************************************************************/

OpenBeacon_data g_Beacon;
char USB_SYNC = 0;
char status_mode;

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

unsigned char global_TxPowerLevel=0, global_TxRate=0, global_TxChannel=DEFAULT_CHANNEL;
unsigned char global_MAC[  OPENBEACON_MACSIZE ] = {0xF1,0xB2,0xC3,0xD2,0xE1};

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
    
    if(!nRFAPI_Init(DEFAULT_CHANNEL, global_MAC, OPENBEACON_MACSIZE ))
	HaltBlinking();
    
    /* Inititalize nRF24L01 */
    nRFAPI_SetPipeSizeRX(0,sizeof(g_Beacon));
    nRFAPI_SetRxMode(1);
    nRFAPI_SetTxPowerRate(global_TxPowerLevel, global_TxRate);
    
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
	unsigned long swaplong (unsigned long src)
	{
		return (src>>24)|(src<<24)|((src>>8)&0x0000FF00)|((src<<8)&0x00FF0000);
	}
/**********************************************************************/

// TODO:  payload size?
void TransmitBeacon(unsigned portCHAR* payload, unsigned char TxPowerLevel, unsigned char TxRate, unsigned char TxChannel, unsigned char* mac, unsigned char mac_length)   // payload length = 30
{
    // TODO: check TX_FULL
    // TODO: check free space and use it
    unsigned int i=0;
    unsigned long crc;

    AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );
    vTaskDelay(portTICK_RATE_MS);
	
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

//    if(mac_length==0) mac_length=0;	
//    if(mac[0]==0) mac[0]=0;

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
   // nRFAPI_SetTxMAC(mac, mac_length);
	
    // setup packet 
    for(i=0; i<sizeof(g_Beacon.payload); i++) g_Beacon.payload[i] = payload[i];
   
    crc = env_crc16(g_Beacon.payload, sizeof (g_Beacon.payload) );
    g_Beacon.crc = swapshort(crc);    
    
    // upload data to nRF24L01
    nRFAPI_TX(g_Beacon.payload, sizeof(OpenBeacon_data) );
    
    // transmit data
    nRFLL_CE(1);
    status_mode=1;
    
    vTaskDelay(portTICK_RATE_MS);
    AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_RED );
}

unsigned char input[100];

void sendText(unsigned char* msg, unsigned char size) {
	MemBlock *InputOutput = NULL;
	OBD2HW_Header* p_hwh;
	
	InputOutput = pullFreeBlock();
	if(InputOutput!=NULL) {
		p_hwh = (OBD2HW_Header*)InputOutput->pValue;
		p_hwh->type = MONITOR_PRINT;
		p_hwh->length = size;
		memcpy(InputOutput->pValue+sizeof(OBD2HW_Header), msg,  p_hwh->length);
								
		InputOutput->length = p_hwh->length+sizeof(OBD2HW_Header);
		vUSBSendPacket(InputOutput, InputOutput->length);
	}
}
void sendText_MAC(unsigned char* msg, unsigned char size, unsigned char* mac, unsigned int pos) {
	MemBlock *InputOutput = NULL;
	OBD2HW_Header* p_hwh;
	unsigned int i, h=0;
	
	InputOutput = pullFreeBlock();
	if(InputOutput!=NULL) {
		p_hwh = (OBD2HW_Header*)InputOutput->pValue;
		p_hwh->type = MONITOR_PRINT;
		p_hwh->length = size;
		memcpy(InputOutput->pValue+sizeof(OBD2HW_Header), msg,  p_hwh->length);
		
		for(i=0; i<OPENBEACON_MACSIZE; i++) {
			if( ((mac[i]&0xF0)/0x0F)< 0x0A) InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = '0'+((mac[i]&0xF0)/0x10);
			else InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = 'A'+((mac[i]&0xF0)/0x10) - 10;
			h++;			
			if( (mac[i]&0x0F) < 0x0A) InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = '0'+( mac[i]&0x0F );
			else InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = 'A'+( mac[i]&0x0F ) - 10;
			h++;
			if(h==2 || h==5 || h==8 || h==11) {
				InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ] = ':';
				h++;
			}			
		}
								
		InputOutput->length = p_hwh->length+sizeof(OBD2HW_Header);
		vUSBSendPacket(InputOutput, InputOutput->length);
	}
}

unsigned long pow(unsigned long base, unsigned long exp) {
        unsigned long ret=base;

        if(exp==0) return 1;

        while( (--exp)>0 ) {
                ret = ret * base;
        }
        return ret;
}

void sendText_shortint(unsigned char* msg, unsigned char size, unsigned char value, unsigned int pos) {
	MemBlock *InputOutput = NULL;
	OBD2HW_Header* p_hwh;
	unsigned int i, h=0, hp;
	unsigned char z=value, leer=0;
	
	InputOutput = pullFreeBlock();
	if(InputOutput!=NULL) {
		p_hwh = (OBD2HW_Header*)InputOutput->pValue;
		p_hwh->type = MONITOR_PRINT;
		p_hwh->length = size;
		memcpy(InputOutput->pValue+sizeof(OBD2HW_Header), msg,  p_hwh->length);
		
		for(i=0; i<3; i++) {
			hp = pow( 10, (2-i) );
			if( z/hp>0 ) {
				InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i ]  = '0'+  z/hp;
				z = z%hp;
				leer=1;
			} else 
				if(leer==0) InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i ]  = ' ';
				else InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i ]  = '0';
		}
		if(InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i-1]==' ') InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i-1 ]  = '0';						
		
		InputOutput->length = p_hwh->length+sizeof(OBD2HW_Header);
		vUSBSendPacket(InputOutput, InputOutput->length);
	}
}

void vApplicationIdleHook(void)
{                                      
	unsigned char status, i,j, hvar;
	MemBlock *data_pack = NULL;

	idle_tread_counter++;
	if(input[0]!='\0') {
		switch(input[0]) {
			case 'm':
					j=1;
					for(i=0; i<OPENBEACON_MACSIZE; i++) {
						if(input[j]>='0' && input[j]<='9') input[j] -= '0';
						if(input[j]>='A' && input[j]<='F') input[j] = input[j] - 'A' + 10;
						if(input[j]>='a' && input[j]<='f')  input[j] = input[j] - 'a' + 10;
						
						if(input[j+1]>='0' && input[j+1]<='9') input[j+1] -= '0';
						if(input[j+1]>='A' && input[j+1]<='F') input[j+1] = input[j+1] - 'A' + 10;
						if(input[j+1]>='a' && input[j+1]<='f')  input[j+1] = input[j+1] - 'a' + 10;
						
						global_MAC[i] = input[j]*0x10+input[j+1];
						j += 2;
						if(input[j]==':') j++;						
					}
			
					break;			
			case 'c':	hvar = 0;
					for(i=0; i<3; i++) {
						if( input[i+1]>='0' &&  input[i+1]<='9') {
							hvar = hvar*10 + (input[i+1]-'0');
						}
					}						
					if(hvar>127) hvar=127;
					if(hvar>0) {
						global_TxChannel = hvar - 1;
					}
					nRFAPI_SetChannel( global_TxChannel );
					break;
			case 'r':	hvar = 0;
					if( input[1]>='0' &&  input[1]<='9') {
						hvar = input[1]-'0';
					}
					
					if(hvar>3) hvar=3;
					if(hvar>0) {
						global_TxRate = hvar - 1;
					}
				        nRFAPI_SetTxPowerRate( global_TxPowerLevel, global_TxRate );
					break;
			case 'p':	hvar = 0;
					if( input[1]>='0' &&  input[1]<='9') {
						hvar = input[1]-'0';
					}
					
					if(hvar>5) hvar=5;
					if(hvar>0) {
						global_TxPowerLevel = hvar - 1;
					}
					nRFAPI_SetTxPowerRate( global_TxPowerLevel, global_TxRate );    
					break;					
			case 'h': case 'H':
			default:	// print help 
					sendText("**********************************************************", 58);
					sendText("*        OpenBeacon Version 0.1.0                        *", 58);
					sendText("**********************************************************", 58);
					sendText_shortint("*   c[1-125]\t- channel\t\t*                *", 50, global_TxChannel, 32);
					sendText_shortint("*   r[1-2]\t- rate\t\t\t*                *", 50, global_TxRate, 28);
					sendText_shortint("*   p[1-4]\t- power\t\t\t*                *", 50, global_TxPowerLevel, 29);
					sendText_MAC("*   m[#MAC]\t- set MAC Adresse\t* AA:BB:CC:DD:EE *", 50, global_MAC, 32);
					sendText("**********************************************************", 58);
					sendText("*   h\t\t- hilfe                                  *", 50);
					sendText("*   x\t\t- Exit                                   *", 50);
					sendText("**********************************************************", 58);
					break;		
		}
		input[0]='\0';
	}
	
	if((AT91F_PIO_GetInput(AT91C_BASE_PIOA)&IRQ_PIN)==0)
	{
		OpenBeacon_packet* dph;
		unsigned short crc;
		OBD2HW_Header* p_hwh;

		status=nRFAPI_GetStatus();

		if(status & MASK_RX_DR_FLAG)
		{
			data_pack = pullFreeBlock();		
			// read packet from nRF chip
			if(data_pack!=NULL)  {
				nRFCMD_RegReadBuf(RD_RX_PLOAD, data_pack->pValue+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-OPENBEACON_MACSIZE-1, sizeof(g_Beacon));
					    
				dph = (OpenBeacon_packet*) (data_pack->pValue+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-OPENBEACON_MACSIZE-1 );
				p_hwh =  (OBD2HW_Header*) (data_pack->pValue);
				
				// verify the crc checksum
				crc = env_crc16(data_pack->pValue+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-OPENBEACON_MACSIZE-1, sizeof(g_Beacon)-sizeof(dph->sp.crc));	    
				if(swapshort(dph->sp.crc)==crc) {  
					Click2OBD_header* ph =  (Click2OBD_header*)(data_pack->pValue+sizeof(OBD2HW_Header));
					
					ph->status	= 0;
					ph->count	= 0;
					ph->power 	= global_TxPowerLevel+1;
					ph->rate 		= global_TxRate+1;
					ph->channel 	= global_TxChannel+1;
										
					p_hwh->start = 0;
					p_hwh->length = ph->length+sizeof(Click2OBD_header);
					p_hwh->type = PACKET_DATA;
					p_hwh->reserved = 0xFF;
					
					data_pack->length = p_hwh->length+sizeof(OBD2HW_Header);
					
					memcpy( ph->openbeacon_dmac,  global_MAC, OPENBEACON_MACSIZE );				
					
					vUSBSendPacket(data_pack,  data_pack->length);
					sendText_shortint("CRC OK:      \r\n", 15, ph->length, 8);					
				} else {
					sendText("CRC Fail   \r\n", 13);
					pushFreeBlock( data_pack );
				}
				nRFAPI_FlushRX();
				data_pack=NULL;
			}
		}
		
		if(status & MASK_MAX_RT_FLAG)
		    nRFAPI_FlushTX();

		nRFAPI_ClearIRQ(status);
	}
}

int main (void)
{
    input[0] = '\0';
    USB_SYNC=0;
	prvSetupHardware ();
	xTaskCreate (vUSBCDCTask, (signed portCHAR *) "USB", mainUSB_TASK_STACK, NULL, mainUSB_PRIORITY, NULL);
    USB_SYNC = 1;
	   
    xTaskCreate (usbshell_task	, (signed portCHAR *) "USBSHELL"	, mainAPP_TASK_STACK	, NULL, mainAPP_PRIORITY, NULL);
    vTaskStartScheduler ();

    return 0;
}
