#include "openbeacon_communication.h"
#include "main.h"

portCHAR b0[ USBCHANNEL_BUFFER_SIZE ], b1[ USBCHANNEL_BUFFER_SIZE ], b2[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b3[ USBCHANNEL_BUFFER_SIZE ], b4[ USBCHANNEL_BUFFER_SIZE ], b5[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b6[ USBCHANNEL_BUFFER_SIZE ], b7[ USBCHANNEL_BUFFER_SIZE ], b8[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b9[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b10[ USBCHANNEL_BUFFER_SIZE ], b11[ USBCHANNEL_BUFFER_SIZE ], b12[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b13[ USBCHANNEL_BUFFER_SIZE ], b14[ USBCHANNEL_BUFFER_SIZE ], b15[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b16[ USBCHANNEL_BUFFER_SIZE ], b17[ USBCHANNEL_BUFFER_SIZE ], b18[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b19[ USBCHANNEL_BUFFER_SIZE ];

portCHAR t0[ USBCHANNEL_TMPBUFFER_SIZE ], t1[ USBCHANNEL_TMPBUFFER_SIZE ], t2[ USBCHANNEL_TMPBUFFER_SIZE ];
portCHAR t3[ USBCHANNEL_TMPBUFFER_SIZE ], t4[ USBCHANNEL_TMPBUFFER_SIZE ], t5[ USBCHANNEL_TMPBUFFER_SIZE ];
portCHAR t6[ USBCHANNEL_TMPBUFFER_SIZE ], t7[ USBCHANNEL_TMPBUFFER_SIZE ], t8[ USBCHANNEL_TMPBUFFER_SIZE ];
portCHAR t9[ USBCHANNEL_TMPBUFFER_SIZE ];

portCHAR c0[ USBCHANNEL_TMPBUFFER_SIZE ], c0[ USBCHANNEL_TMPBUFFER_SIZE ], c1[ USBCHANNEL_TMPBUFFER_SIZE ], c2[ USBCHANNEL_TMPBUFFER_SIZE ];
portCHAR c0[ USBCHANNEL_TMPBUFFER_SIZE ], c3[ USBCHANNEL_TMPBUFFER_SIZE ], c4[ USBCHANNEL_TMPBUFFER_SIZE ], c5[ USBCHANNEL_TMPBUFFER_SIZE ];
portCHAR c0[ USBCHANNEL_TMPBUFFER_SIZE ], c6[ USBCHANNEL_TMPBUFFER_SIZE ], c7[ USBCHANNEL_TMPBUFFER_SIZE ], c8[ USBCHANNEL_TMPBUFFER_SIZE ];
portCHAR c0[ USBCHANNEL_TMPBUFFER_SIZE ], c9[ USBCHANNEL_TMPBUFFER_SIZE ];

static_buffer_info sbi_dev[10] = {
							 { b0, 0, 0, 0, b10, 0, t0, 0, 0, 0, 0 }
							,{ b1, 0, 0, 0, b11, 0, t1, 0, 0, 0, 0 }
							,{ b2, 0, 0, 0, b12, 0, t2, 0, 0, 0, 0 }
							,{ b3, 0, 0, 0, b13, 0, t3, 0, 0, 0, 0 }
							,{ b4, 0, 0, 0, b14, 0, t4, 0, 0, 0, 0 }
							,{ b5, 0, 0, 0, b15, 0, t5, 0, 0, 0, 0 }
							,{ b6, 0, 0, 0, b16, 0, t6, 0, 0, 0, 0 }
							,{ b7, 0, 0, 0, b17, 0, t7, 0, 0, 0, 0 }
							,{ b8, 0, 0, 0, b18, 0, t8, 0, 0, 0, 0 }
							,{ b9, 0, 0, 0, b19, 0, t9, 0, 0, 0, 0 }
						};

unsigned int write_to_channel( portCHAR* out, portLONG len, struct device_data* dev ) {
	while( 1 ) {
			pthread_mutex_lock(&dev->usb_write_mutex);
			if( dev->usb_write_buffer_length<10000-len ) {
				memcpy( dev->usb_write_buffer+dev->usb_write_buffer_length, out, len );
				dev->usb_write_buffer_length += len;

				pthread_mutex_unlock(&dev->usb_write_mutex);
				return len;
			}
			pthread_mutex_unlock(&dev->usb_write_mutex);
			usleep(10);
	}
	return 0;
}

unsigned int  read_from_channel( portCHAR* out, portLONG len, struct device_data* dev ) {
	unsigned int ret = len;

	pthread_mutex_lock(&dev->usb_read_mutex);
		if( ret>dev->usb_read_buffer_length ) ret = dev->usb_read_buffer_length;
		if( ret>0 ) {
			memcpy(out, dev->usb_read_buffer, ret);
			dev->usb_read_buffer_length -= ret;
			if(dev->usb_read_buffer_length>0) memmove(dev->usb_read_buffer, dev->usb_read_buffer+ret, ret);
		}
	pthread_mutex_unlock(&dev->usb_read_mutex);

	return ret;
}

/*
	Send and Recive Packets over USB(HOST)
*/
portCHAR putDataToUSBChannel(struct device_data* dev,  unsigned portCHAR* buffer,  unsigned portCHAR blen ) {
	portCHAR ret = STATUS_OK;

	OBD2HW_Header *ph 	= (OBD2HW_Header *)sbi_dev[ dev->index ].putDataToUSBChannel_buffer;
	OBD2HW_Header *ph_sen = (OBD2HW_Header *)buffer;
	unsigned portCHAR tmp_buffer[ 150];
	unsigned int i, j;
	unsigned portCHAR send_len = sizeof(OBD2HW_Header)+ph_sen->length ;
	unsigned long tmp_enc=0, tmp_dec=0;

	if(  USBCHANNEL_BUFFER_SIZE-sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len>send_len) {
		memcpy(sbi_dev[ dev->index ].putDataToUSBChannel_buffer+sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len, buffer, send_len>blen?blen:send_len);
		sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len += send_len;

		if(sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len>= (portLONG)(sizeof(OBD2HW_Header)+ph->length) ) { // can full send
			tmp_buffer[0] = sbi_dev[ dev->index ].putDataToUSBChannel_buffer[0];     //  is 0
			j=1;
			for(i=1; i<sizeof(OBD2HW_Header)+ph->length; i++) {
				// encoding for usb-channel
				if( sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]==0x00 || (sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]>0x00 && sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]<ENCODING_PARAMETER) ) {
					tmp_enc++;
					tmp_buffer[j] = 0x01;
					j++;
					tmp_buffer[j] = sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]+ENCODING_PARAMETER;
				} else {
					tmp_buffer[j] = sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i];
				}
				j++;
				tmp_enc++;
				tmp_dec++;
			}
			tmp_buffer[j] = 0; j++;
			if(write_to_channel( (char*)tmp_buffer, j, dev )>0) {
				main_stat_data.usb_send_packets++;
				main_stat_data.usb_send_enc_bytes+=tmp_enc;
				main_stat_data.usb_send_dec_bytes+=tmp_dec;
			}

			sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len -= sizeof(OBD2HW_Header)+ph->length;
			if(sbi_dev[ dev->index ].putDataToUSBChannel_lastpacket<0) sbi_dev[ dev->index ].putDataToUSBChannel_lastpacket = 0;

			memmove( sbi_dev[ dev->index ].putDataToUSBChannel_buffer, sbi_dev[ dev->index ].putDataToUSBChannel_buffer+sizeof(OBD2HW_Header)+ph->length, sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len );
		}
	} else {
		main_stat_data.usb_fail_send_packets;
		ret=STATUS_ERROR_NO_DATA;
	}
	return ret;
}

/*
	Neu bauen
	1. Daten tempor�re Laden
	2. Packetanfang finden und Packet st�ck f�r St�ck in den Packetpuffer �bertragen
	3. Wenn Packet fertig ist, an den Anwender �bergeben.
*/
static int in_count=0;

portCHAR getDataFromUSBChannel( struct device_data* dev,  unsigned portCHAR* buffer,  unsigned portCHAR *blen, time_t max_wait) {
	unsigned int pos, tmp_i, dec_pos;
	unsigned char found = 0;
	OBD2HW_Header *ph;

	// encoding data ----> TMPBUFFER
	if(USBCHANNEL_TMPBUFFER_SIZE-sbi_dev[dev->index].tmp_buffer_len>0) {
		sbi_dev[dev->index].tmp_buffer_len += read_from_channel( (char*) (sbi_dev[dev->index].tmp_buffer+sbi_dev[dev->index].tmp_buffer_len),  USBCHANNEL_TMPBUFFER_SIZE-sbi_dev[dev->index].tmp_buffer_len, dev);
	}

	// find begin
	for( pos=0; pos<sbi_dev[dev->index].tmp_buffer_len && sbi_dev[dev->index].tmp_buffer[ pos ]!=0; pos++);
	for( ; pos+1<sbi_dev[dev->index].tmp_buffer_len && sbi_dev[dev->index].tmp_buffer[ pos+1 ]==0; pos++);

	if( pos>0 ) {
		sbi_dev[dev->index].tmp_buffer_len -= pos;
		memmove( sbi_dev[dev->index].tmp_buffer, sbi_dev[dev->index].tmp_buffer+pos, sbi_dev[dev->index].tmp_buffer_len );
	}

	// find end of packet
	found=0;
	for(pos=1; pos<sbi_dev[dev->index].tmp_buffer_len; pos++) {
		if(sbi_dev[dev->index].tmp_buffer[pos]==0) {
			found=1;
			break;
		}
	}

	if(found) {
		dec_pos=0;
		for(tmp_i=0; tmp_i<pos; tmp_i++) {
			if( sbi_dev[dev->index].tmp_buffer[tmp_i]==0x01 ) {
				sbi_dev[dev->index].getDataFromUSBChannel_packet_enc =  ENCODING_PARAMETER;
				main_stat_data.usb_recive_enc_bytes++;
			} else {
				buffer[ dec_pos ] = sbi_dev[dev->index].tmp_buffer[ tmp_i ] - sbi_dev[dev->index].getDataFromUSBChannel_packet_enc;
				sbi_dev[dev->index].getDataFromUSBChannel_packet_enc=0;
				dec_pos++;
				main_stat_data.usb_recive_dec_bytes++;
				main_stat_data.usb_recive_enc_bytes++;
			}
		}
		*blen=dec_pos;

		// removing
		sbi_dev[dev->index].tmp_buffer_len -= pos;
		memmove( sbi_dev[dev->index].tmp_buffer, sbi_dev[dev->index].tmp_buffer+pos, sbi_dev[dev->index].tmp_buffer_len );

		// check the packet
		ph = (OBD2HW_Header *)buffer;
		if(ph->length+sizeof(OBD2HW_Header)!=*blen ) {
			main_stat_data.usb_fail_recive_packets++;
			*blen=0;
			return STATUS_ERROR_NO_DATA;
		}
		main_stat_data.usb_recive_packets++;

		return STATUS_OK;
	}

	*blen=0;
	return STATUS_ERROR_NO_DATA;
}

