#include "usbshell.h"

#include <openbeacon.h>
#include <openbeacon_communication.h>

unsigned char usb_shell_input[ USB_SHELL_MAX_SIZE ];
usb_Mgmt usb_stat;

// Hilferoutinen für das versenden von Daten
unsigned int pow(unsigned int base, unsigned int exp) {
        unsigned long ret=base;

        if(exp==0) return 1;

        while( (--exp)>0 ) {
                ret = ret * base;
        }
        return ret;
}

void sendText(unsigned char* msg, unsigned char size) {
	MemBlock *InputOutput = NULL;
	OBD2HW_Header* p_hwh;

	InputOutput = pullFreeBlock();
	if(InputOutput!=NULL) {
		p_hwh = (OBD2HW_Header*)InputOutput->pValue;
		p_hwh->type = MONITOR_PRINT;
		p_hwh->length = size;
		memcpy(InputOutput->pValue+sizeof(OBD2HW_Header), msg,  p_hwh->length);
		vUSBSendPacket(InputOutput, p_hwh->length+sizeof(OBD2HW_Header));
	}
}
void sendText_MAC(unsigned char* msg, unsigned char size, unsigned char* mac, unsigned int pos) {
	MemBlock *InputOutput = NULL;
	OBD2HW_Header* p_hwh;
	unsigned int i, h=0;

	InputOutput = pullFreeBlock();
	if(InputOutput!=NULL) {
		p_hwh = (OBD2HW_Header*)InputOutput->pValue;
		p_hwh->type = MONITOR_PRINT;
		p_hwh->length = size;
		memcpy(InputOutput->pValue+sizeof(OBD2HW_Header), msg,  p_hwh->length);

		for(i=0; i<OPENBEACON_MACSIZE; i++) {
			if( ((mac[i]&0xF0)/0x0F)< 0x0A) InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = '0'+((mac[i]&0xF0)/0x10);
			else InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = 'A'+((mac[i]&0xF0)/0x10) - 10;
			h++;
			if( (mac[i]&0x0F) < 0x0A) InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = '0'+( mac[i]&0x0F );
			else InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ]  = 'A'+( mac[i]&0x0F ) - 10;
			h++;
			if(h==2 || h==5 || h==8 || h==11) {
				InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+h ] = ':';
				h++;
			}
		}

		InputOutput->length = p_hwh->length+sizeof(OBD2HW_Header);
		vUSBSendPacket(InputOutput, InputOutput->length);
	}
}

void sendText_shortint(unsigned char* msg, unsigned char size, unsigned char value, unsigned int pos) {
	MemBlock *InputOutput = NULL;
	OBD2HW_Header* p_hwh;
	unsigned int i, h=0, hp;
	unsigned char z=value, leer=0;

	InputOutput = pullFreeBlock();
	if(InputOutput!=NULL) {
		p_hwh = (OBD2HW_Header*)InputOutput->pValue;
		p_hwh->type = MONITOR_PRINT;
		p_hwh->length = size;
		memcpy(InputOutput->pValue+sizeof(OBD2HW_Header), msg,  p_hwh->length);

		for(i=0; i<3; i++) {
			hp = pow( 10, (2-i) );
			if( z/hp>0 ) {
				InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i ]  = '0'+  z/hp;
				z = z%hp;
				leer=1;
			} else
				if(leer==0) InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i ]  = ' ';
				else InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i ]  = '0';
		}
		if(InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i-1]==' ') InputOutput->pValue[ sizeof(OBD2HW_Header)+pos+i-1 ]  = '0';

		InputOutput->length = p_hwh->length+sizeof(OBD2HW_Header);
		vUSBSendPacket(InputOutput, InputOutput->length);
	}
}

unsigned char get8BitInteger(unsigned char* buff, unsigned char size) {
	unsigned char i;
	unsigned char ret = 0;

	for(i=0; i<size; i++) {
		if(buff[i]>='0' && buff[i]<='9') {
			ret = ret*10+(buff[i]-'0');
		} else break;
	}
	return ret;
}

void useShell() {
	unsigned char parm;
	unsigned char nid_buffer[5];

	if(usb_shell_input[0]!='\0') {
		switch(usb_shell_input[0]) {
			case 'c':
			case 'C':
						parm = ob_int_mgmt.TxChannel;
						ob_setChannel( get8BitInteger( usb_shell_input+1, 3 ) );
						if( parm!=ob_int_mgmt.TxChannel ) {
							sendText_shortint("neuer Funkkanal:      ", 22, ob_int_mgmt.TxChannel, 17);
						}
						break;
			case 'r':
			case 'R':
						parm = ob_int_mgmt.TxRate;
						ob_setRate( get8BitInteger( usb_shell_input+1, 1 ) );
						if( parm!=ob_int_mgmt.TxRate ) {
							sendText_shortint("neue Bitrate:      ", 19, ob_int_mgmt.TxRate, 14);
						}
						break;
			case 'p':
			case 'P':
						parm = ob_int_mgmt.TxPowerLevel;
						ob_setPower( get8BitInteger( usb_shell_input+1, 1 ) );
						if( parm!=ob_int_mgmt.TxPowerLevel ) {
							sendText_shortint("neue Power:      ", 19, ob_int_mgmt.TxPowerLevel, 12);
						}
						break;
			case 'n':
			case 'N': {
							unsigned char i=0,k=0, pc=0;
							unsigned char valid=1;

							for(k=0; k<USB_SHELL_MAX_SIZE && i<NETID_SIZE; k++) {
								if(pc==3) pc=0;

								switch(pc) {
									case 0:
											if( usb_shell_input[1+k]>='0' && usb_shell_input[1+k]<='9' ) {
												// 0x0* - 0x9*
												nid_buffer[i] = 0x10*( usb_shell_input[1+k]-'0');
											} else if( usb_shell_input[1+k]>='A' && usb_shell_input[1+k]<='F' ) {
												// 0xA* - 0xF*
												nid_buffer[i] = 0x10*( usb_shell_input[1+k]-'A'+10);
											} else if( usb_shell_input[1+k]>='a' && usb_shell_input[1+k]<='f' ) {
												// 0xa* - 0xf*
												nid_buffer[i] = 0x10*( usb_shell_input[1+k]-'a'+10);
											} else valid=0;
											break;
									case 1:
											if( usb_shell_input[1+k]>='0' && usb_shell_input[1+k]<='9' ) {
												// 0x*0 - 0x*9
												nid_buffer[i] += ( usb_shell_input[1+k]-'0');
											} else 	if( usb_shell_input[1+k]>='A' && usb_shell_input[1+k]<='F' ) {
												// 0x*A - 0x*F
												nid_buffer[i] += ( usb_shell_input[1+k]-'A'+10);
											} else if( usb_shell_input[1+k]>='a' && usb_shell_input[1+k]<='f' ) {
												// 0x*a - 0x*f
												nid_buffer[i] += ( usb_shell_input[1+k]-'a'+10);
											} else valid=0;
											i++;
											break;
									case 2: if(usb_shell_input[1+k]!=':') valid=0;
											break;

								}
								pc++;
							}
							if(i<NETID_SIZE) valid=0;

							if(valid>0) {
								ob_setNetID( nid_buffer );
								sendText_MAC("neue NID: AA:BB:CC:DD:EE ", 25, ob_int_mgmt.NetID, 10);
							} else {
								sendText("neue NID hat nicht dir Form: AA:BB:CC:DD:EE ", 44);
							}
						}
						break;
#ifdef OPENBEACON_TEST_AUTO_SEND
			case 't':
			case 'T':
						parm = ob_int_mgmt.test_hw_diff;
						ob_int_mgmt.test_hw_diff = get8BitInteger( usb_shell_input+1, 3 );
						if( ob_int_mgmt.test_hw_diff>250 ) ob_int_mgmt.test_hw_diff=255;
						if( parm!=ob_int_mgmt.test_hw_diff ) {
							if( ob_int_mgmt.test_hw_diff==255 ) {
								sendText("neue daten rate(hw test):   off ", 32);
							} else {
								sendText_shortint("neue daten rate(hw test):      ", 31, ob_int_mgmt.test_hw_diff, 26);
							}
						}
						break;
#endif
			case 'h': case 'H': case '?':
			default:
				sendText("**********************************************************", 58);
				sendText("*        OpenBeacon Version 0.2.0                        *", 58);
				sendText("**********************************************************", 58);
				sendText("*\t\t\t\t\t*                *", 25);
				sendText_shortint("*   c[1-125]\t- channel\t\t*                *", 50, ob_int_mgmt.TxChannel, 32);
				sendText_shortint("*   r[1-2]\t- rate\t\t\t*                *", 50, ob_int_mgmt.TxRate, 28);
				sendText_shortint("*   p[1-4]\t- power\t\t\t*                *", 50, ob_int_mgmt.TxPowerLevel, 29);
				sendText_MAC("*   n[#NetID]\t- set Netzadresse\t* AA:BB:CC:DD:EE *", 50, ob_int_mgmt.NetID, 34);
				sendText("*\t\t\t\t\t*                *", 25);
				#ifdef OPENBEACON_TEST_AUTO_SEND
					if(ob_int_mgmt.test_hw_diff==255) {
						sendText("*   t[TTC]\t- sende 1 Packet pro TTC*       off      *", 54);
					} else {
						sendText_shortint("*   t[TTC]\t- sende 1 Packet pro TTC*                *", 54, ob_int_mgmt.test_hw_diff, 44);
					}
					sendText("*\t\t\t\t\t*                *", 25);
				#endif
				sendText("**********************************************************", 58);
				sendText("*   h\t\t- hilfe                                  *", 50);
				sendText("*   x\t\t- Exit                                   *", 50);
				sendText("**********************************************************", 58);
				break;
		}
		usb_shell_input[0]='\0';
	}
}

void sendUSBStat( portTickType diff) {
	/* send Stats */
	if( xTaskGetTickCount()-usb_stat.stat_time>1) {
		AT91F_PIO_SetOutput( AT91C_BASE_PIOA, LED_GREEN );
	}
	if( xTaskGetTickCount()-usb_stat.stat_time>diff ) {
		usb_stat.stat_time = xTaskGetTickCount();
	    MemBlock *h = pullFreeBlock();

	    if(h!=NULL) {
	    	OBD2HW_Header* c2ob_h;
	    	char* bh=(char*)h->pValue;
			c2ob_h	=(OBD2HW_Header*)bh;

			c2ob_h->length = sizeof(StatusOpenbeacon_V2);
			c2ob_h->type   = STATUS_OPENBEACON_V2;

			StatusOpenbeacon_V2* sbv2 =(StatusOpenbeacon_V2*)(bh+sizeof(OBD2HW_Header));
			char i;

			// Statistik eintragen
			for(i=0; i<4; i++) {
				sbv2->tx_usb_packets[i] = usb_stat.tx_usb_packets[i];
				sbv2->rx_usb_packets[i] = usb_stat.rx_usb_packets[i];
				sbv2->fail_tx_usb_packets[i] = usb_stat.fail_tx_usb_packets[i];
				sbv2->fail_rx_usb_packets[i] = usb_stat.fail_rx_usb_packets[i];
				sbv2->rx_usb_dec_bytes[i] = usb_stat.rx_usb_dec_bytes[i];
				sbv2->tx_usb_dec_bytes[i] = usb_stat.tx_usb_dec_bytes[i];
				sbv2->rx_usb_enc_bytes[i] = usb_stat.rx_usb_enc_bytes[i];
				sbv2->tx_usb_enc_bytes[i] = usb_stat.tx_usb_enc_bytes[i];
			}

			sbv2->qfree    = usb_stat.qfree;
			sbv2->tx_quse  = usb_stat.tx_quse;
			sbv2->rx_quse  = usb_stat.rx_quse;

			// remove old data
			for(i=0; i<4; i++) {
				usb_stat.tx_usb_packets[i]		=	0;
				usb_stat.rx_usb_packets[i]		=	0;
				usb_stat.fail_tx_usb_packets[i]	=	0;
				usb_stat.fail_rx_usb_packets[i]	=	0;
				usb_stat.rx_usb_dec_bytes[i]	=	0;
				usb_stat.tx_usb_dec_bytes[i]	=	0;
				usb_stat.rx_usb_enc_bytes[i]	=	0;
				usb_stat.tx_usb_enc_bytes[i]	=	0;
			}
			usb_stat.qfree		=	USB_CDC_QUEUE_SIZE_FREE;
			usb_stat.tx_quse	=	0;
			usb_stat.rx_quse	=	0;

			vUSBSendPacket(h, sizeof(OBD2HW_Header)+c2ob_h->length );
			h=NULL;
			AT91F_PIO_ClearOutput( AT91C_BASE_PIOA, LED_GREEN );
	    }
	}
}
