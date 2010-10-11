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

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_comunication.h"

#include "openbeacon.h"
#include "env.h"
#include "../obd_usb/USB-CDC.h"
#include "usbshell.h"
#include "main.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_LL.h"
#include "nRF24L01/nRF_API.h"

#define PACKET_SIZE 	64
unsigned char packet[PACKET_SIZE+CHUNK_SIZE];
portCHAR usb_status[10] = {0,0,0,0,0,0,0,0,0,0};

portCHAR getDataFromUSBChannel_buffer[ USBCHANNEL_BUFFER_SIZE ];
portCHAR putDataToUSBChannel_buffer[ USBCHANNEL_BUFFER_SIZE ];
portCHAR tmp_buffer[150];

static_buffer_info sbi_dev[1] = 	{	
							{ getDataFromUSBChannel_buffer, 0, putDataToUSBChannel_buffer, 0, tmp_buffer, 0 }
						};

void Msg2USB_encap(unsigned char* msg, unsigned portCHAR len, unsigned portCHAR type) {
	OBD2HW_Header *ph = (OBD2HW_Header *) msg;
        ph->type    = type;
	ph->length = len-sizeof(OBD2HW_Header);
	
//	vUSBSendBytes((char*)msg, len);	
	putDataToUSBChannel(0,  msg,  len);
}

unsigned int read_to_channel( portCHAR* out, unsigned portCHAR len, portLONG device ) {
	if(device>0) return 0;
	return vUSBRecvByte (out, len);
}

unsigned int write_to_channel( portCHAR* out, unsigned portCHAR len, portLONG device ) {
	if(device>0) return 0;
	vUSBSendBytes((char*)out, len, 10);
	return len;
}	

void debug_msg(char* msg, unsigned portCHAR msg_len) {	
	portCHAR buffer[300];
	OBD2HW_Header *ph = (OBD2HW_Header *) buffer;
	unsigned portLONG i = 0;
	
	for(i=0; i<msg_len; i++) {
		buffer[sizeof(OBD2HW_Header)+i] = msg[i];
	}
	
	ph->start		= 0;
        ph->type		= MONITOR_PRINT;
	ph->length	= msg_len;
	ph->reserved	= 0;
	
//	vUSBSendBytes(buffer, msg_len+sizeof(OBD2HW_Header), 10);	
}
void debug_hex_msg(char* msg, unsigned portCHAR msg_len) {	
	portCHAR buffer[300];
	OBD2HW_Header *ph = (OBD2HW_Header *) buffer;
	unsigned portLONG i = 0;
	
	for(i=0; i<msg_len; i++) {
		// TODO: convert to hex
		buffer[sizeof(OBD2HW_Header)+i] = msg[i];
	}
	
	ph->start		= 0;
        ph->type		= MONITOR_PRINT;
	ph->length	= msg_len;
	ph->reserved	= 0;
	
//	vUSBSendBytes(buffer, msg_len+sizeof(OBD2HW_Header), 10);		
}

extern char USB_SYNC;

void
usbshell_task (void *pvParameters)
{
	portTickType xLastBlink=0;
	unsigned portCHAR packet_len=0;
	OBD2HW_Header *ph;
	Click2OBD_header *c2obdh;
	
	(void) pvParameters;	
	while( USB_SYNC==0 );
		
	// workloop
        for (;;)
        {
		if( xTaskGetTickCount()-xLastBlink>100 ) {
//			memcpy( packet+sizeof(OBD2HW_Header), "get? ", 5);
//			Msg2USB_encap(packet, 5+sizeof(OBD2HW_Header), MONITOR_PRINT);
				
			xLastBlink = xTaskGetTickCount();
		}
		
		// recive from usb
		packet_len = PACKET_SIZE+CHUNK_SIZE;
	
		if( getDataFromUSBChannel(0,  packet,  &packet_len )==STATUS_OK ) {		
			ph = (OBD2HW_Header *)  packet;
			c2obdh = (Click2OBD_header *)( packet + sizeof(OBD2HW_Header) );
			
			// TODO: for all recive packet
			if(ph->type==MONITOR_INPUT) {
				memcpy((char*) (usb_status+1), packet+sizeof(OBD2HW_Header),  ph->length<9?ph->length:9);
				usb_status[0]=ph->length<9?ph->length:9;
			}
			if(ph->type==PACKET_DATA) {
				if(c2obdh->status&STATUS_NO_TX ) {  // no send 
					c2obdh->status = c2obdh->status | STATUS_ECHO_OK | STATUS_ECHO_ERROR;   // set STATUS_ECHO_OK and STATUS_ECHO_ERROR to 1 => Testpacket Antwort
					// TODO: zeitliche Bewertung

					
					Msg2USB_encap(packet, ph->length+sizeof(OBD2HW_Header), PACKET_DATA);
				} else {						
					if( FIFOQueue_push( &hw_buffer_queue,  (unsigned char**)&c2obdh) ) {
						memcpy( packet+sizeof(OBD2HW_Header), "push into queue\n\r", 17);
					} else {
						memcpy( packet+sizeof(OBD2HW_Header), "no packet send \n\r", 17);
					}
					Msg2USB_encap(packet, 17+sizeof(OBD2HW_Header), MONITOR_PRINT);
				}
			}
		}
	}
}
