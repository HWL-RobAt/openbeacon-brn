/***************************************************************
 *
 * OpenBeacon.org - midlevel access function defines for
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
#ifndef NRF_CMD_H
#define NRF_CMD_H

extern void nRFCMD_Init(void);
extern unsigned char nRFCMD_RegExec(unsigned char reg);
extern unsigned char nRFCMD_RegRead(unsigned char reg);
extern unsigned char nRFCMD_RegReadWrite(unsigned char reg,unsigned char value);
extern unsigned char nRFCMD_RegWriteBuf(unsigned char reg,const unsigned char *buf,unsigned char count);
extern unsigned char nRFCMD_RegReadBuf(unsigned char reg,unsigned char *buf,unsigned char count);
extern unsigned char nRFCMD_GetRegSize(unsigned char reg);

#endif/*NRF_CMD_H*/
