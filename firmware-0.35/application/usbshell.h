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

#ifndef __USBSHELL_H__
#define __USBSHELL_H__

extern void vUSBShellInit (void);

#define UNKNOWN_DATA 		0
#define PACKET_DATA 		1
#define CONFIG_DATA 		2
#define DEBUG_PRINT 		3
#define MONITOR_PRINT 		4
#define MONITOR_INPUT 		5

struct packet_header {
  unsigned portCHAR  low_length;
  unsigned portCHAR  high_length;
  unsigned portCHAR  type;
  unsigned portCHAR  reserved;
} __packed__ ;

typedef struct packet_header OBD2HW_Header;

void Msg2USB_encap(unsigned char* msg, unsigned int len, unsigned portCHAR type);

#endif /* __USBSHELL_H__ */
