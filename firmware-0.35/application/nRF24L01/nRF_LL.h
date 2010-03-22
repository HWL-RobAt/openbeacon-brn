/***************************************************************
 *
 * OpenBeacon.org - low level function definitions for
 * bitbanging IO access to NRF24L01 2.4GHz HF frontend.
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * this file contains the hardware specific access routines to
 * the pins responsible for nRF24L01 2.4GHz HF frontend.
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
#ifndef NRF_LL_H
#define NRF_LL_H

extern void nRFLL_Init(void);
extern unsigned char nRFLL_ReadWrite(unsigned char byte);
extern void nRFLL_CE(unsigned char enable);
extern void nRFLL_CSN(unsigned char enable);

#endif/*NRF_LL_H*/
