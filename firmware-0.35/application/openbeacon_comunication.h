#ifndef __OPENBEACON_COMUNICATION_H__
#define __OPENBEACON_COMUNICATION_H__

#define OPENBEACON_MACSIZE                    5

/*
	Comunication Protocol Header for comunication between Openbeacon Deamon and Openbeacon HW.
*/
#define UNKNOWN_DATA 		0
#define PACKET_DATA 		1
#define CONFIG_DATA 		2
#define DEBUG_PRINT 		3
#define MONITOR_PRINT 		4
#define MONITOR_INPUT 		5

#ifndef portCHAR
	#define portCHAR	char
#endif
#ifndef portLONG
	#define portLONG	int
#endif
#ifndef portTickType 
	#define portTickType	unsigned long
#endif

typedef struct {
  unsigned portCHAR  start;
  unsigned portCHAR  length;
  unsigned portCHAR  type;
  unsigned portCHAR  reserved;
} __attribute__((packed)) OBD2HW_Header;   // 4 Bytes

/*
	Comunication Protocol Header for comunication between Click and Openbeacon Deamon.
*/
#define STATUS_ECHO_OK		0x01				// set 1 for echo, if packet can send 
#define STATUS_ECHO_ERROR		0x02				// set 1 for echo, if packet can't send
#define STATUS_CRC_CHECK		0x04				// hw set 1, if crc is ok
#define STATUS_NO_TX			0x08				// set 1, if packet no send
#define STATUS_hw_rxtx_test		0x10				// set 1, if hw must send [count ] packets
#define STATUS_full_test			0x20				// set 1, if packet send from HOST to HOST

typedef struct {													//             rx/tx?    // TODO:  beim empfangen auswerten, ob packet CRC ok ist
    unsigned portCHAR  status;									 	// State:   echo_ok?, echo_error?;  crc? , no_tx?, hw_rxtx_test?  ...
    unsigned portCHAR  count;										
    unsigned portCHAR  channel;                          							// channel frequency:      2400 MHz + rf_ch * a MHz       ( a=1 für 1 Mbps, 2 für 2 Mbps )
    unsigned portCHAR  rate;									 		// data rate value:      	  1 = 1 Mbps   ,		2 = 2 Mbps
    unsigned portCHAR  power;   					     				 	// power:		        	00 =  -18 dBm,		01 = -12 dBm		10 = -6 dBm		11 = 0 dBm
    unsigned portCHAR  openbeacon_dmac[ OPENBEACON_MACSIZE ];	 		// kann von 3-5 Byte variieren
    unsigned portCHAR  openbeacon_smac[ OPENBEACON_MACSIZE ];		 	// kann von 3-5 Byte variieren
} __attribute__ ((packed)) Click2OBD_header;   // 15


/*
	the struct for HW_RXTX_TEST
*/
typedef struct {
	unsigned portCHAR  openbeacon_smac[ OPENBEACON_MACSIZE ];		 	// kann von 3-5 Byte variieren
	unsigned char prot_type[2];										// Protokolltype: 0606  
	unsigned portCHAR type;
	unsigned portCHAR count;
	unsigned portCHAR number;
	portTickType timestamp_send;	
	portTickType timestamp_recive;
	// extensions 
	// Testbegin, Testend
	unsigned portLONG test_begin;
	unsigned portLONG test_end;
	unsigned portLONG test_time;
} __attribute__ ((packed)) HW_rxtx_Test;   // 6 + 5*4 = 26    =>  26+15+4 = 30 + 15 = 45 - 4 = 41

portCHAR putDataToUSBChannel(portLONG fd,  unsigned portCHAR* buffer,  unsigned portCHAR blen);
portCHAR getDataFromUSBChannel(portLONG fd,  unsigned portCHAR* buffer,  unsigned portCHAR *blen );
unsigned int write_to_channel( portCHAR* out, unsigned portCHAR len, portLONG device );
unsigned int read_to_channel( portCHAR* out, unsigned portCHAR len, portLONG device );
		
void debug_msg(char* msg, unsigned portCHAR msg_len);
void debug_hex_msg(char* msg, unsigned portCHAR msg_len);

#define USBCHANNEL_BUFFER_SIZE     500
extern portCHAR getDataFromUSBChannel_buffer[];
extern portCHAR putDataToUSBChannel_buffer[];

#define STATUS_OK							0
#define STATUS_ERROR_NO_DATA				-1
#define STRUKTUR_BUFFER_MAX_LENGTH	       200

#ifdef __OPENBEACON_COMUNICATION_H__WITH_ENCODING	
	typedef struct {
		unsigned portCHAR buffer[ STRUKTUR_BUFFER_MAX_LENGTH ];
		unsigned portCHAR length; 
	} __attribute__ ((packed)) StrukturBuffer;
	
	/*
		Send and Recive Packets over USB(HOST)
	*/
	portCHAR putDataToUSBChannel(portLONG fd,  unsigned portCHAR* buffer,  unsigned portCHAR blen) {
		static unsigned portLONG len=0;
		OBD2HW_Header *ph = (OBD2HW_Header *)putDataToUSBChannel_buffer;
		unsigned portCHAR tmp_buffer[150];
		unsigned int i, j;
		
		if( USBCHANNEL_BUFFER_SIZE-len>blen) {
			memcpy(putDataToUSBChannel_buffer+len, buffer, blen);
			len += blen;
		} else { // TODO: other error?
			return STATUS_ERROR_NO_DATA;
		}

		if(len>= sizeof(OBD2HW_Header)+ph->length) { // can full send
			tmp_buffer[0] = putDataToUSBChannel_buffer[0];     //  is 0
			j=1;
			for(i=1; i<sizeof(OBD2HW_Header)+ph->length; i++) {
				// encoding for usb-channel
				if( putDataToUSBChannel_buffer[i]==0x00 || (putDataToUSBChannel_buffer[i]>0x00 && putDataToUSBChannel_buffer[i]<=0x1F) ) {
					tmp_buffer[j] = 0x01;
					j++;
					tmp_buffer[j] = putDataToUSBChannel_buffer[i]+0x20;
				} else {
					tmp_buffer[j] = putDataToUSBChannel_buffer[i];
				}				
				j++;
			}		
			write_to_channel( (char*)tmp_buffer, j, fd );
			
			len -= sizeof(OBD2HW_Header)+ph->length;
			memmove( putDataToUSBChannel_buffer, putDataToUSBChannel_buffer+sizeof(OBD2HW_Header)+ph->length, len );
		}		
		return STATUS_OK;
	}
	portCHAR getDataFromUSBChannel(portLONG fd,  unsigned portCHAR* buffer,  unsigned portCHAR *blen ) {
		static portLONG len=0, prev_len;
		
		OBD2HW_Header *ph;
		unsigned int i, j;
		static unsigned portCHAR tmp_buffer[150];
		static unsigned int tmp_len = 0;
		int tmp_switch_break;
		
		while(1) {		
			if( len > (portLONG)sizeof(OBD2HW_Header) ) {
				ph = (OBD2HW_Header *) getDataFromUSBChannel_buffer;
				
				if(len >= (portLONG)(sizeof(OBD2HW_Header) + ph->length)  	// ) {// packet full recive
					&& *blen>= sizeof(OBD2HW_Header) + ph->length) { 
						
					for(i=0; i<sizeof(OBD2HW_Header)+ph->length; i++) {	
						buffer[i] = getDataFromUSBChannel_buffer[i];
						*blen = sizeof(OBD2HW_Header)+ph->length;
					}			
					
					len -= *blen;
					memmove( getDataFromUSBChannel_buffer, getDataFromUSBChannel_buffer+(*blen), len );
				
					return STATUS_OK;
				}
			}
			prev_len = len;
			if( USBCHANNEL_BUFFER_SIZE-len>0 ) {
				unsigned int htmp_len = 150;
				
				if(( USBCHANNEL_BUFFER_SIZE-len)>(portLONG)(150-htmp_len-tmp_len) ) {
					tmp_len += read_to_channel( (char*) (tmp_buffer+tmp_len),  htmp_len, fd);
				} else {
					tmp_len += read_to_channel( (char*) (tmp_buffer+tmp_len),  (USBCHANNEL_BUFFER_SIZE-len), fd);
				}
				
				j=0;
				tmp_switch_break = 0;
				for(i=0; i<tmp_len && tmp_switch_break==0; i++) {
					// decoding data from usb-channel					
					switch( tmp_buffer[i] ) {
						case 0x00:	
//									ph = (OBD2HW_Header *) getDataFromUSBChannel_buffer;
//									if( !(ph->start==0 && len+j==ph->length+sizeof(OBD2HW_Header)) ) {
//										len=-j;
//										prev_len=0;
//									}
									
									getDataFromUSBChannel_buffer[len+j] = tmp_buffer[i];
									break;
						case 0x01:
									if(i<(tmp_len-1) ) {
										i++;
										getDataFromUSBChannel_buffer[len+j] = tmp_buffer[i]-0x20;
									} else {
										tmp_buffer[0] = tmp_buffer[i];
										tmp_switch_break=1;
										j--;
										i--;
									}
									break;
						default:
									getDataFromUSBChannel_buffer[len+j] = tmp_buffer[i];
					}
					j++;
				}
				len += j;
				tmp_len -= i;
			}

			if(prev_len == len) {
				return STATUS_ERROR_NO_DATA;
			}
		}		
		return STATUS_ERROR_NO_DATA;
	}
#endif

#endif/*__OPENBEACON_COMUNICATION_H__*/
