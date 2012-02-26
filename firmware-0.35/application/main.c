/***************************************************************
 *
 * OpenBeacon.org - main entry for 2.4GHz RFID USB reader
 *
 * Copyright 2007 Milosch Meriac <meriac@openbeacon.de>
 *
 * basically starts the USB task, initializes all IO ports
 * and introduces idle application hook to handle the HF traffic
 * from the nRF24L01 chip
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
/* Library includes. */
#include <string.h>
#include <stdio.h>

#include "openbeacon.h"
#include "usbshell.h"
#include "openbeacon_communication.h"

/* Priorities/stacks for the various tasks within the demo application. */
#define mainUSB_PRIORITY			( tskIDLE_PRIORITY )
#define mainNRF_PRIORITY			( tskIDLE_PRIORITY )
#define mainUSB_TASK_STACK			( 512 )
#define mainNRF_TASK_STACK			( 512 )

#define mainAPP_PRIORITY			( tskIDLE_PRIORITY )
#define mainAPP_TASK_STACK			( 512 )

static inline void prvSetupHardware (void)
{
    /*	When using the JTAG debugger the hardware is not always initialised to
	the correct default state.  This line just ensures that this does not
	cause all interrupts to be masked at the start. */
    AT91C_BASE_AIC->AIC_EOICR = 0;

    /*	Enable PIOA outputs. */
    AT91F_PIO_CfgInput ( AT91C_BASE_PIOA, IRQ_PIN  );
    AT91F_PIO_CfgOutput( AT91C_BASE_PIOA, LED_MASK );
    AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_MASK );

    /*	Enable the peripheral clock. */
    AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOA;
    AT91C_BASE_PMC->PMC_PCER = 1 << AT91C_ID_PIOB;

    unsigned char mac[5] = {0xF1,0xB2,0xC3,0xD2,0xE1};
    ob_init( 1, 2, DEFAULT_CHANNEL, mac );

    /* Initialization done - Turn on green LED */
    AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_GREEN );
    AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_RED );
}

ob_data send_buffer, recv_buffer;
portTickType ob_send_time, ob_app_start;

static MemBlock* last_usb_recvmesg=NULL;
static MemBlock* last_usb_sendmesg=NULL;

void vApplicationIdleHook(void)
{
	static char sending=0;
	static char state=0;
	static char* sendData=NULL;
	OBD2HW_Header* pobd2hw;

	#ifdef APPLICATION_START_TIME
		if(xTaskGetTickCount()-ob_app_start<APPLICATION_START_TIME) {
			usb_stat.stat_time 	  = ob_app_start + 2*APPLICATION_START_TIME;
			ob_int_mgmt.stat_time = ob_app_start + 2*APPLICATION_START_TIME + OPENBEACON_STATS_AUTO_SEND_TIME/2;

			return;
		}
	#endif

	// TODO: erforsche diesen Einfluss | nRFAPI_GetStatus()&STATUS_TX_DS
	if(xTaskGetTickCount()-ob_send_time > OPENBEACON_SEND_WIRELESS ) {
		AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_RED );
		sending=0;
		ob_switchRXMode();
	}

	#ifdef OPENBEACON_RECIVE_WIRELESS
		if( last_usb_sendmesg==NULL ) last_usb_sendmesg = pullFreeBlock();

		if(sending==0 && last_usb_sendmesg!=NULL) {
			// Wirless Packete empfangen
			pobd2hw = (OBD2HW_Header*) last_usb_sendmesg->pValue;
			pobd2hw->length=recvBeacon( &recv_buffer );

			if( pobd2hw->length>0 ) {
				sending=1;
				memcpy(last_usb_sendmesg->pValue+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-OPENBEACON_MACSIZE, recv_buffer.payload, pobd2hw->length );

				// TODO: auswerten der Daten (ggf. weiterleiten an Click)
				pobd2hw->type=PACKET_DATA;
				pobd2hw->length += sizeof(Click2OBD_header);

				Click2OBD_header* pclick2obd = (Click2OBD_header*) (last_usb_recvmesg->pValue+sizeof(OBD2HW_Header) );
				pclick2obd->channel = ob_int_mgmt.TxChannel;
				pclick2obd->rate	= ob_int_mgmt.TxRate;
				pclick2obd->power 	= ob_int_mgmt.TxPowerLevel;
				#ifdef OPENBEACON_TRANSMIT_WIRELESS_TO_USB
					vUSBSendPacket( last_usb_sendmesg, pobd2hw->length+sizeof(OBD2HW_Header) );
					last_usb_sendmesg = NULL;
				#endif
			}
		}
	#endif
	#ifdef OPENBEACON_TEST_AUTO_SEND
		if(sending==0 && xTaskGetTickCount()-ob_send_time > OPENBEACON_SEND_WIRELESS) {
			if( ob_int_mgmt.test_hw_diff<255 && xTaskGetTickCount()-ob_send_time>ob_int_mgmt.test_hw_diff ) {
				// TODO: Testpacket einrichten
				HW_rxtx_Test *htestp = (HW_rxtx_Test *)send_buffer.payload;
				char i;

				for(i=0; i<OPENBEACON_MACSIZE; i++) htestp->openbeacon_smac[ i ] = 0xFF;
				htestp->prot_type[0] = ETHERNET_TEST_PROTOCOL_FIRST;
				htestp->prot_type[1] = ETHERNET_TEST_PROTOCOL_SECOND;
				increment(htestp->pID, 4);

				switch( sendBeacon( &send_buffer ) ) {
					case 0:	sending=1;
						AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );
						ob_send_time=xTaskGetTickCount();
						break;
					case -1:
					break;
				}
			}
		}
	#endif

	// Sendet USB-Statistics
	#ifdef USB_STATS_AUTO_SEND
		#ifdef USB_STATS_AUTO_SEND_TIME
			sendUSBStat( USB_STATS_AUTO_SEND_TIME );
		#else
			sendUSBStat( 1000 );
		#endif
	#endif

	// Sendet Wirless-Statistics
	#ifdef OPENBEACON_STATS_AUTO_SEND
		#ifdef OPENBEACON_STATS_AUTO_SEND_TIME
			sendBeaconStat( OPENBEACON_STATS_AUTO_SEND_TIME );
		#else
			sendBeaconStat( 1000 );
		#endif
	#endif



	// Shelleingaben verarbeiten
	#ifdef APPLICATION_USBSHELL
			useShell();
	#endif

	// verarbeiten der USB Packete ( Datenpackete )
	#ifdef OPENBEACON_SEND_USB_PACKET_DATA
		if(last_usb_recvmesg==NULL) vUSBRecivePacket( &last_usb_recvmesg );
		if(sending==0 && last_usb_recvmesg!=NULL && xTaskGetTickCount()-ob_send_time > OPENBEACON_SEND_WIRELESS) {
			OBD2HW_Header* pobd2hw = (OBD2HW_Header*) last_usb_recvmesg->pValue;

			if( pobd2hw->type==PACKET_DATA ) {
				Click2OBD_header* pclick2obd = (Click2OBD_header*) (last_usb_recvmesg->pValue+sizeof(OBD2HW_Header) );

				ob_setChannel( pclick2obd->channel );
				ob_setRate( pclick2obd->rate );
				ob_setPower( pclick2obd->power );
				ob_setNetID( pclick2obd->openbeacon_dmac );

				// TODO: den Payload ob_data richtig festlegen
				memcpy(send_buffer.payload, last_usb_recvmesg->pValue+sizeof(OBD2HW_Header)+sizeof(Click2OBD_header)-OPENBEACON_MACSIZE, OPENBEACON_MAX_DATA);

				switch( sendBeacon( &send_buffer ) ) {
					case 0:	sending=1;
							AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_RED );
							pushFreeBlock( last_usb_recvmesg );
							last_usb_recvmesg=NULL;
						break;
					case -1:

						break;
				}
				ob_send_time=xTaskGetTickCount();
			} else {
				pushFreeBlock( last_usb_recvmesg );
				last_usb_recvmesg=NULL;
			}
		}
	#endif
}

int main (void)
{
	char i;

	// shell init
	usb_shell_input[0]='\0';

	prvSetupHardware ();
	for(i=0; i<sizeof(ob_data); i++) {
		send_buffer.payload[i]=0;
		recv_buffer.payload[i]=0;
	}
	xTaskCreate (vUSBCDCTask	, (signed portCHAR *) "USB_CDC"	, mainUSB_TASK_STACK	, NULL, mainUSB_PRIORITY, NULL);

    vTaskStartScheduler ();

    ob_app_start=xTaskGetTickCount();
    ob_send_time=xTaskGetTickCount();

    return 0;
}
