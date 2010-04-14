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
#include "../obd_usb/USB-CDC.h"
#include "usbshell.h"
#include "main.h"

#define PACKET_SIZE 	64
unsigned char packet[PACKET_SIZE+CHUNK_SIZE];
portCHAR usb_status[10] = {0,0,0,0,0,0,0,0,0,0};

void Msg2USB_encap(unsigned char* msg, unsigned int len, unsigned portCHAR type) {
	struct packet_header *ph = (struct packet_header *) msg;
        ph->type    = type;
	
        ph->high_length = (len-sizeof(struct packet_header))/256 ;
	ph->low_length = (len-sizeof(struct packet_header))%256;
	
//	if(type==MONITOR_PRINT) {  // Probleme siehe USB-CDC.c
//		vUSBSendZeroCopyBytes( (char*)msg, len );
//	} else {
		vUSBSendBytes((char*)msg, len);	
//	}
}

static void
usbshell_task (void *pvParameters)
{
	portTickType xLastBlink=0;
	unsigned int index=0;
	struct packet_header *ph;
	struct Click2OBD_header *c2obdh;
		
	if(pvParameters==NULL) xLastBlink=0;

	xLastBlink = xTaskGetTickCount();

        // workloop
        for (;;)
        {
		// recive from usb
		index += vUSBRecvByte( (char*)(packet+index), sizeof(unsigned char)*(PACKET_SIZE-index+CHUNK_SIZE) ) ;

		if(index >= sizeof(struct packet_header) ) {  // header is recive
			ph = (struct packet_header *)  packet;
			c2obdh = (struct Click2OBD_header *)( packet + sizeof(struct packet_header) );
			
			// TODO: for all recive packet
			if(index >= ph->low_length+256*ph->high_length+sizeof(struct packet_header)  ) { // packet is recive
				if(ph->type==MONITOR_INPUT) {
					memcpy((char*) (usb_status+1), packet+sizeof(struct packet_header),  ph->low_length<9?ph->low_length:9);
					usb_status[0]=ph->low_length<9?ph->low_length:9;
				}
				if(ph->type==PACKET_DATA) {
					// echo
					// Msg2USB_encap(packet, ph->low_length+256*ph->high_length+sizeof(struct packet_header), PACKET_DATA);
					
					// send to hw
					TransmitBeacon( packet+sizeof(struct packet_header)+sizeof(struct Click2OBD_header)-sizeof(c2obdh->openbeacon_smac) , c2obdh->power, c2obdh->rate);
				}
				index = 0;
			}

		}

	}
}

void
vUSBShellInit (void) {
	xTaskCreate (usbshell_task, (signed portCHAR *) "USBSHELL", TASK_USBSHELL_STACK, NULL, TASK_USBSHELL_PRIORITY, NULL);
}
