/***************************************************************
 *
 * OpenBeacon.org - OnAir protocol specification and definition
 *
 * Copyright 2006 Milosch Meriac <meriac@openbeacon.de>
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

#ifndef __OPENBEACON_H__
#define __OPENBEACON_H__

#define OPENBEACON_NEW                          8

typedef unsigned char u_int8_t;
typedef unsigned short u_int16_t;

#include "rnd.h"

typedef struct {
        u_int8_t payload[30*sizeof(u_int8_t)];
        u_int16_t crc;
} OpenBeacon_data;

typedef union {
                OpenBeacon_data sp;
                u_int8_t   data_byte[OPENBEACON_NEW*sizeof(u_int32_t)];
                u_int16_t  data_word[OPENBEACON_NEW*sizeof(u_int16_t)];
                u_int32_t data_dword[OPENBEACON_NEW*sizeof( u_int8_t)];
} __attribute__((packed)) OpenBeacon_packet;

void TransmitBeacon(unsigned portCHAR* payload, unsigned char TxPowerLevel, unsigned char TxRate, unsigned char TxChannel, unsigned char* mac, unsigned char mac_length);

#endif/*__OPENBEACON_H__*/
