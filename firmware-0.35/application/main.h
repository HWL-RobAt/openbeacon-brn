/***************************************************************
 *
 * OpenBeacon.org - Definitions
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * basically only exports our 2.4GHz beacon data structure
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
#ifndef __MAIN_H__
#define __MAIN_H__

#include "openbeacon.h"
#include "fifoqueue.h"

extern SelfPacket g_Beacon;
extern portCHAR usb_status[10];
extern FIFOQueue hw_buffer_queue;

typedef struct {
	unsigned char TxPowerLevel;
	unsigned char TxRate;
	unsigned char TxChannel;
	unsigned char mac[OPENBEACON_MACSIZE];
	unsigned char payload[32];
} HW_Queue_Entry;	

#endif/*__MAIN_H__*/
