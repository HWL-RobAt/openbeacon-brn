/***************************************************************
 *
 * OpenBeacon.org - board specific configuration
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * change this file to reflect hardware design changes
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
#ifndef Board_h
#define Board_h

#include "lib_AT91SAM7.h"

#define true	-1
#define false	0

/*-------------------------------*/
/* SAM7Board Memories Definition */
/*-------------------------------*/

#define  ENVIRONMENT_SIZE	1024
#define  FLASH_PAGE_NB		AT91C_IFLASH_NB_OF_PAGES-(ENVIRONMENT_SIZE/AT91C_IFLASH_PAGE_SIZE)

/*-----------------*/
/* Master Clock    */
/*-----------------*/

#define EXT_OC		18432000	// Exetrnal ocilator MAINCK
#define MCK		47923200	// MCK (PLLRC div by 2)
#define MCKKHz		(MCK/1000)	//

/*-----------------*/
/* LED declaration */
/*-----------------*/

#define LED_GREEN	(1L<<23)
#define LED_RED		(1L<<20)
#define LED_MASK	(LED_GREEN|LED_RED)

/*-----------------*/
/* nRF declaration */
/*-----------------*/

#define DEFAULT_CHANNEL 81

#define CSN_PIN		(1L<<11)
#define MISO_PIN	(1L<<12)
#define MOSI_PIN	(1L<<13)
#define SCK_PIN		(1L<<14)
#define IRQ_PIN		(1L<<19)
#define CE_PIN		(1L<<26)

/*-----------------*/
/* utils settings  */
/*-----------------*/

#define TASK_USBSHELL_PRIORITY  ( tskIDLE_PRIORITY + 0)
#define TASK_USBSHELL_STACK     ( 512 )

#endif /* Board_h */
