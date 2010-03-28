/***************************************************************
 *
 * OpenBeacon.org - midlevel access functions for
 * issuing raw commands to the nRF24L01 2.4Ghz frontend
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * provides generic register level access functions
 * for accessing nRF24L01 registers at a generic level
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
#include "nRF_HW.h"
#include "nRF_LL.h"
#include "nRF_CMD.h"

void nRFCMD_Init(void)
{
    nRFLL_Init();
}

unsigned char nRFCMD_RegExec(unsigned char reg)
{
	unsigned char res;
	
	nRFLL_CSN(0);	
	res=nRFLL_ReadWrite(reg);
	nRFLL_CSN(1);
		
	return res;
}

unsigned char nRFCMD_RegRead(unsigned char reg)
{
	unsigned char res;
	
	nRFLL_CSN(0);	
	nRFLL_ReadWrite(reg);
	res=nRFLL_ReadWrite(0);
	nRFLL_CSN(1);
		
	return res;
}

unsigned char nRFCMD_RegReadWrite(unsigned char reg,unsigned char value)
{
	unsigned char res;
	
	nRFLL_CSN(0);	
	res=nRFLL_ReadWrite(reg);
	nRFLL_ReadWrite(value);	
	nRFLL_CSN(1);	

	return res;
}

unsigned char nRFCMD_RegWriteBuf(unsigned char reg,const unsigned char *buf,unsigned char count)
{
	unsigned char res;
	
	nRFLL_CSN(0);	
	res=nRFLL_ReadWrite(reg);
	while(count--)
		nRFLL_ReadWrite(*buf++);
	nRFLL_CSN(1);

	return res;
}

unsigned char nRFCMD_RegReadBuf(unsigned char reg,unsigned char *buf,unsigned char count)
{
	unsigned char res;
	
	nRFLL_CSN(0);	
	res=nRFLL_ReadWrite(reg);
	while(count--)
		*buf++=nRFLL_ReadWrite(0);
	nRFLL_CSN(1);

	return res;
}

unsigned char nRFCMD_GetRegSize(unsigned char reg)
{
	unsigned char res;
	
	if(reg>0x17)
		res=0;
	else		
		switch(reg)
		{
			case RX_ADDR_P0:
			case RX_ADDR_P1:
			case TX_ADDR:
				res=NRF_MAX_MAC_SIZE;
				break;
			default:
				res=1;
		}
	
	return res;
}
