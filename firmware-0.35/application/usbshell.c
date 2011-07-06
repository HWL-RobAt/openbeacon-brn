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

#include "openbeacon.h"
#include "env.h"
#include  "../obd_usb/USB-CDC.h"
#include "usbshell.h"
#include "main.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_LL.h"
#include "nRF24L01/nRF_API.h"


void insertLONG(portCHAR* buffer, portLONG l) {
	char i;
	portLONG tmp = l;
	
	for(i=0; i<sizeof(portLONG); i++) {
		buffer[i] = tmp%256;
		tmp = tmp/256;		
	}	
}

unsigned portLONG tx_queue = 0;
unsigned portLONG rx_queue = 0;
unsigned portLONG queue_free = USB_CDC_QUEUE_SIZE_FREE;

extern char USB_SYNC;

MemBlock regBlock, *pRegBlock;

void
usbshell_task (void *pvParameters)
{
	(void) pvParameters;
	while( USB_SYNC==0 );
	unsigned portBASE_TYPE len, i;
	portTickType xMovBig=0;
	OBD2HW_Header* p_hwh;
	MemBlock *bl=NULL;
	unsigned portBASE_TYPE ret;

	vTaskDelay (portTICK_RATE_MS*1000);

	xMovBig = 0;
	
	pRegBlock = NULL;
	
	debug_block = &regBlock;
	p_hwh = (OBD2HW_Header*)debug_block->pValue;
	debug_block->pos =   0;
	debug_block->flag = 10;
			
	memcpy(debug_block->pValue+sizeof(OBD2HW_Header), "Hallo, wer ist da!\0\0\0\0\0\0\0\0\0\0\0\0", 28);
			
	p_hwh->length = 28;
	p_hwh->type    = DEBUG_HEX_PRINT;
	p_hwh->start = 0;
	p_hwh->reserved = 0xFF;		
				
	debug_block->length 	= sizeof(OBD2HW_Header)+p_hwh->length;
	debug_block->count 	= 1;	

	// debug_block = NULL;

	while(true) {
		xMovBig++;
		if( getTXSize()   > tx_queue ) tx_queue = getTXSize();
		if( getRXSize()   > rx_queue ) rx_queue = getRXSize();
		if( getFreeSize() < queue_free ) queue_free = getFreeSize();

		if( pRegBlock==NULL && xMovBig>500 && statusBlock==NULL) {
			pRegBlock = pullFreeBlock();
			if(pRegBlock==NULL) continue;
			
			portENTER_CRITICAL ();
			{			
				xMovBig = 0;
				
				p_hwh = (OBD2HW_Header*)pRegBlock->pValue;
				pRegBlock->pos =   0;
				pRegBlock->flag = 10;
			
				memcpy(pRegBlock->pValue+sizeof(OBD2HW_Header), "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 28);
			
				p_hwh->length = 48;
				p_hwh->type    = SPEZIAL_PRINT;
				p_hwh->start = 0;
				p_hwh->reserved = 0xFF;		
				
				pRegBlock->length 	= sizeof(OBD2HW_Header)+p_hwh->length;
				pRegBlock->count 	= 1;
						
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  0*sizeof(portLONG), txCounter_enc ); 
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  1*sizeof(portLONG), txCounterMAX_enc );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  2*sizeof(portLONG), txCounter_dec );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  3*sizeof(portLONG), txCounterMAX_dec );
				if(txCounter_dec>0xFFFFF) { 
					txCounter_dec=0; 
					txCounterMAX_dec=0;
					txCounter_enc=0; 
					txCounterMAX_enc=0;					
				}
				
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  4*sizeof(portLONG), rxCounter_enc );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  5*sizeof(portLONG), rxCounterMAX_enc );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  6*sizeof(portLONG), rxCounter_dec );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  7*sizeof(portLONG), rxCounterMAX_dec );				
				if(rxCounter_dec>0xFFFFF) { 
					rxCounter_dec=0; 
					rxCounterMAX_dec=0; 
					rxCounter_enc=0; 
					rxCounterMAX_enc=0; 					
				}
					
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  8*sizeof(portLONG), tx_queue );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+  9*sizeof(portLONG), rx_queue );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+ 10*sizeof(portLONG), queue_free );
				insertLONG(pRegBlock->pValue+sizeof(OBD2HW_Header)+ 11*sizeof(portLONG), idle_tread_counter);
				idle_tread_counter=0;
				
				pRegBlock->type = MEMBLOCK_TYPE_USE;

				txCounterMAX_dec += pRegBlock->length;
				txCounterMAX_enc += pRegBlock->length;
				for(i=0; i<pRegBlock->length; i++) 				
					if( pRegBlock->pValue[i]<ENCODING_PARAMETER ) txCounterMAX_enc++;
				
				statusBlock =  pRegBlock;
				statusBlock->pos=0;
				pRegBlock = NULL;
				
				tx_queue = 0;
				rx_queue = 0;
				queue_free = USB_CDC_QUEUE_SIZE_FREE;
			}
			portEXIT_CRITICAL ();
				
		}		
		if(getRXSize()>0 && getTXSize()<USB_CDC_QUEUE_SIZE_TX ) {
			if(bl!=NULL) {
				portENTER_CRITICAL ();
				{			
					pushFreeBlock(bl);
					bl=NULL;
				}
				portEXIT_CRITICAL ();
			}
				
			if( vUSBRecivePacket(&bl)>0 && bl!=NULL) {	
				p_hwh = (OBD2HW_Header*)bl->pValue;
				if( p_hwh->type!=PACKET_DATA ) {		// send to host
					vUSBSendPacket(bl,  bl->length);   
					bl=NULL;
				} else {
					Click2OBD_header* ph =  (Click2OBD_header*)(bl->pValue+sizeof(OBD2HW_Header));
					TransmitBeacon( bl->pValue+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-OPENBEACON_MACSIZE-1, ph->power, ph->rate, ph->channel, ph->openbeacon_dmac, OPENBEACON_MACSIZE) ;
					pushFreeBlock(bl);
					bl=NULL;
				}
			}
		}
	}
}
