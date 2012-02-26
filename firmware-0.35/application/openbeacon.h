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

#include <FreeRTOS.h>
#include <AT91SAM7.h>
#include <USB-CDC.h>
#include <task.h>

#include "env.h"
#include "rnd.h"
#include "board.h"
#include "nRF24L01/nRF_HW.h"
#include "nRF24L01/nRF_CMD.h"
#include "nRF24L01/nRF_LL.h"
#include "nRF24L01/nRF_API.h"
#include <config.h>

#define OPENBEACON_NEW                          8
#define OPENBEACON_MAX_DATA                     30
#define NETID_SIZE								5

typedef unsigned char u_int8_t;
typedef unsigned short u_int16_t;

typedef struct {
        u_int8_t payload[OPENBEACON_MAX_DATA*sizeof(u_int8_t)];
        u_int16_t crc;
} ob_data;

typedef union {
                ob_data sp;
                u_int8_t    data_byte[ OPENBEACON_MAX_DATA ];
                u_int16_t   data_word[ OPENBEACON_MAX_DATA/sizeof(u_int16_t)];
                u_int32_t  data_dword[ OPENBEACON_MAX_DATA/sizeof( u_int32_t)];
} __attribute__((packed)) ob_packet;


typedef struct {
	unsigned char Mode;
	unsigned char Pipes;
	unsigned char TxPowerLevel;
	unsigned char TxRate;
	unsigned char TxChannel;
	unsigned char NetID[5];

	#ifdef OPENBEACON_TEST_AUTO_SEND
		portTickType test_hw_diff;
	#endif

	/* Statistik  */
	portTickType stat_time;
	unsigned char tx_beacons[4], rx_beacons[4];
	unsigned char fail_tx_beacons[4], fail_rx_beacons[4];
} ob_Mgmt;

static inline unsigned short swapshort (unsigned short src);
static inline unsigned long swaplong (unsigned long src);
static inline void HaltBlinking(void);

void ob_init( unsigned char power, unsigned char rate, unsigned char channel, unsigned char *nid );
void ob_switchRXMode( void );
void ob_switchTXMode( void );

void ob_setRate( unsigned char r );
void ob_setPower( unsigned char p );
void ob_setChannel( unsigned char c );
void ob_setNetID( unsigned char nid[] );

signed char sendBeacon( ob_data* block );
unsigned char recvBeacon( ob_data* payload );

void sendBeaconStat( portTickType diff );
char isFinishTransmit( void );

extern ob_data ob_int_buffer;
extern ob_Mgmt ob_int_mgmt;

#endif/*__OPENBEACON_H__*/
