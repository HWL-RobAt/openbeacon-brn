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
#define OPENBEACON_MACSIZE                    5

typedef unsigned char u_int8_t;
typedef unsigned short u_int16_t;
typedef unsigned long u_int32_t;

typedef struct {
        u_int8_t payload[30*sizeof(u_int8_t)];
        u_int16_t crc;
} SelfPacket;

typedef union {
                SelfPacket sp;
                u_int8_t   data_byte[OPENBEACON_NEW*sizeof(u_int32_t)];
                u_int16_t  data_word[OPENBEACON_NEW*sizeof(u_int16_t)];
                u_int32_t data_dword[OPENBEACON_NEW*sizeof( u_int8_t)];
} __attribute__((packed)) OpenBeacon_packet;

void TransmitBeacon(unsigned portCHAR* payload, unsigned char TxPowerLevel, unsigned char TxRate);

struct Click2OBD_header {
    u_int8_t  rssi;									 	// unused
    u_int8_t  channel;                          						// channel frequency:      2400 MHz + rf_ch * a MHz       ( a=1 für 1 Mbps, 2 für 2 Mbps )
    u_int8_t  rate;									 	// data rate value:      	  1 = 1 Mbps   ,		2 = 2 Mbps
    u_int8_t  power;   					     			 	// power:		        	00 =  -18 dBm,		01 = -12 dBm		10 = -6 dBm		11 = 0 dBm
    u_int8_t  openbeacon_dmac[ OPENBEACON_MACSIZE ];	 	// kann von 3-5 Byte variieren
    u_int8_t  openbeacon_smac[OPENBEACON_MACSIZE];		 	// kann von 3-5 Byte variieren
} __attribute__ ((packed));

#endif/*__OPENBEACON_H__*/
