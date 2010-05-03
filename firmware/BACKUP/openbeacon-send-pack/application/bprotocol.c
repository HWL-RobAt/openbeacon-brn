/* bprotocol.c - FreeRTOS/lwip based implemenation of the Blinkenlights udp protocol
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
#include <led.h>

//#include "debug_printf.h"
//#include "network.h"
//#include "SAM7_EMAC.h"
#include "env.h"

/* lwIP includes. */
//#include "lwip/ip.h"
//#include "lwip/udp.h"

/* RF includes */
#include "proto.h"

/* Blinkenlights includes. */
#include "bprotocol.h"

unsigned int b_rec_total = 0;
unsigned int b_rec_frames = 0;
unsigned int b_rec_setup = 0;
unsigned int sequence_seed = 0;
unsigned char last_lamp_val[MAX_LAMPS] = { 0 };

