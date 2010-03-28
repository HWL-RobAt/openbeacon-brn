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
#include "led.h"
#include "debug.h"

unsigned char packet[1500];

void usbreceive(unsigned char* packet) {

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
	sprintf(msg, "Begin:\n");

        // workloop
        for (;;)
        {
                // recive packet?
                if(vUSBRecvByte (&c, sizeof (c), 100) ) ispacket = 1;

		// read packet
                if(ispacket == 1) {
                        // Read Packet
                        for (;;) if(vUSBRecvByte (&c, sizeof (c), 100) ) continue; else break;

			// Bearbeiten von eingegangenen Packeten
			usbreceive(packet);
                }
		printDebug(packet, msg);

                ispacket = 0;
        }

}

void
vUSBShellInit (void) {
	xTaskCreate (usbshell_task, (signed portCHAR *) "USBSHELL", TASK_USBSHELL_STACK, NULL, TASK_USBSHELL_PRIORITY, NULL);
}
