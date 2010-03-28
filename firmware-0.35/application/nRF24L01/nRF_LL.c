/***************************************************************
 *
 * OpenBeacon.org - low level functions for bitbanging IO access
 * to NRF24L01 2.4GHz HF frontend.
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * this file contains the hardware specific access routines to
 * the pins responsible for nRF24L01 2.4GHz HF frontend.
 *
 * *TODO*: update bitbanging code to hardware SPI with DMA
 * acceleration
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
#include <FreeRTOS.h>
#include <board.h>
#include <task.h>
#include "nRF_LL.h"

void nRFLL_Init(void)
{
    AT91F_PIO_SetOutput  (AT91C_BASE_PIOA,CSN_PIN);
    AT91F_PIO_ClearOutput(AT91C_BASE_PIOA,        CE_PIN|MOSI_PIN|SCK_PIN);    
    AT91F_PIO_CfgOutput  (AT91C_BASE_PIOA,CSN_PIN|CE_PIN|MOSI_PIN|SCK_PIN);
    AT91F_PIO_CfgInput   (AT91C_BASE_PIOA,MISO_PIN);
}

unsigned char nRFLL_ReadWrite(unsigned char byte) 
{
    int bit;
    
    for(bit=0;bit<8;bit++)
    {
	if(byte & 0x80)
	    AT91F_PIO_SetOutput(AT91C_BASE_PIOA,MOSI_PIN);
	else
	    AT91F_PIO_ClearOutput(AT91C_BASE_PIOA,MOSI_PIN);
		
	AT91F_PIO_SetOutput(AT91C_BASE_PIOA,SCK_PIN);

	byte<<=1;
	if(AT91F_PIO_GetInput(AT91C_BASE_PIOA)&MISO_PIN)
	    byte|=1;
		    
	AT91F_PIO_ClearOutput(AT91C_BASE_PIOA,SCK_PIN);
    }	
    AT91F_PIO_ClearOutput(AT91C_BASE_PIOA,MOSI_PIN);
	
    return byte;
}

void nRFLL_CE(unsigned char enable)
{
	if(enable)
		AT91F_PIO_SetOutput(AT91C_BASE_PIOA,CE_PIN);
	else
		AT91F_PIO_ClearOutput(AT91C_BASE_PIOA,CE_PIN);
}

void nRFLL_CSN(unsigned char enable)
{
	if(enable)
		AT91F_PIO_SetOutput(AT91C_BASE_PIOA,CSN_PIN);
	else
		AT91F_PIO_ClearOutput(AT91C_BASE_PIOA,CSN_PIN);
}
