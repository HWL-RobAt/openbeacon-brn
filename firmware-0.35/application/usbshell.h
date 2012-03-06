
#ifndef USBSHELL_H_
#define USBSHELL_H_

#include <FreeRTOS.h>

#define USB_SHELL_MAX_SIZE			20
extern unsigned char usb_shell_input[];

void useShell( void );

/* Statistik  */
typedef struct {
	portTickType stat_time;
	unsigned char tx_usb_packets[4], rx_usb_packets[4];
	unsigned char tx_usb_enc_bytes[4], rx_usb_enc_bytes[4];
	unsigned char tx_usb_dec_bytes[4], rx_usb_dec_bytes[4];
	unsigned char fail_tx_usb_packets[4], fail_rx_usb_packets[4];
	unsigned char qfree, rx_quse, tx_quse;
} usb_Mgmt;

extern usb_Mgmt usb_stat;


void sendUSBStat( portTickType diff );

#endif /* USBSHELL_H_ */
