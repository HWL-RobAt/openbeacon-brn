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

unsigned char packet[1500];

void printDebug(char* msg) {
	struct packet_header *ph = (struct packet_header *) &packet;
        ph->type    = DEBUG_PRINT;
        ph->high_length = 0;

        sprintf((portCHAR*)(packet+sizeof(struct packet_header) + 3), msg);
        ph->low_length = strlen( (portCHAR*)(packet+sizeof(struct packet_header) + 3) ) + 3 + 1;
        
	usb_send_buffer_zero_copy(packet, ph->low_length+sizeof(struct packet_header), NULL, NULL, portMAX_DELAY);
}


static void
usbshell_task (void *pvParameters)
{
	char c, ispacket=0;

	// initial sleep
	unsigned int i;
	for (i=0; i<20000; i++) {
		if(!vUSBRecvByte (&c, sizeof (c), 100) ) continue; 
		else {
			ispacket = 1;
			break;
		}
	}
	
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
		
		// Empfangen über Antenne
		
		
		printDebug("Hallo, World!!, Mal ein Test!");

	

	
		ispacket = 0;
	}      
}

void
vUSBShellInit (void) {
	xTaskCreate (usbshell_task, (signed portCHAR *) "USBSHELL", TASK_USBSHELL_STACK, NULL, TASK_USBSHELL_PRIORITY, NULL);
}

