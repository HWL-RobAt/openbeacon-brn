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

static void
usbshell_task (void *pvParameters)
{
  int len, lowlen, index;
  static portCHAR c;

  memset(packet,0,1500);
  
  len = 0;
  lowlen = 0;
  index = 0;
 
  for (;;)
  {
    if (!vUSBRecvByte (&c, sizeof (c), 100)) continue;

    if ( index == 0 ) lowlen = c;
    if ( index == 1 ) {
      len = c;
      len = len * 256 + lowlen;
    }
    
    packet[index] = c;
    index++;
    
    if ( ( len + 4 ) == index ) {
      usb_send_buffer_zero_copy(packet, index, NULL, NULL, portMAX_DELAY);
      index = 0;
      len = 0; 
    }
  }      
}

void
vUSBShellInit (void)
{
  xTaskCreate (usbshell_task, (signed portCHAR *) "USBSHELL",
	       TASK_USBSHELL_STACK, NULL, TASK_USBSHELL_PRIORITY, NULL);
}
