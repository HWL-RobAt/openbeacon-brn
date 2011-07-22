// TODO: make function putData* and getData* THREAD-SAVE

#ifndef __OPENBEACON_COMUNICATION_H__
#define __OPENBEACON_COMUNICATION_H__

#include <time.h>

struct device_data {
	char device_name[50];
	
	int rx_running;
	int tx_running;
	int fd, index;
	struct socket_connection *con;
	
	pthread_t rxThread, txThread, usbReadThread, clickReadThread;
	int threadResult;
	void *rxThreadJoin,*txThreadJoin;
	
	char usb_read_buffer[10000], usb_read_tmp_buffer[100];
	char click_read_buffer[10000], click_read_tmp_buffer[100];
	unsigned int usb_read_buffer_length, click_read_buffer_length;
	
	pthread_mutex_t usb_read_mutex, click_read_mutex;
	pthread_mutex_t usb_write_mutex, click_write_mutex;
	
	char getDataFromClickChannel_buffer[10000];
	unsigned int getDataFromClickChannel_buffer_length;

	int sendPort, recivePort;
	FILE *output_file, *hostoutput_file, *debug_file, *send_file_log, *recive_file_log;
};

#define OPENBEACON_MACSIZE                    5
#define ENCODING_PARAMETER		0x20
/*
	Comunication Protocol Header for comunication between Openbeacon Deamon and Openbeacon HW.
*/
#define UNKNOWN_DATA1	1 + ENCODING_PARAMETER
#define PACKET_DATA 		2 + ENCODING_PARAMETER
#define CONFIG_DATA 		3 + ENCODING_PARAMETER
#define DEBUG_PRINT 		4 + ENCODING_PARAMETER
#define MONITOR_PRINT 		5 + ENCODING_PARAMETER
#define MONITOR_INPUT 		6 + ENCODING_PARAMETER
#define MONITOR_HEX_PRINT   7 + ENCODING_PARAMETER
#define DEBUG_HEX_PRINT	8 + ENCODING_PARAMETER
#define SPEZIAL_PRINT		9 + ENCODING_PARAMETER
#define TEST_DATA			10 + ENCODING_PARAMETER
#define TEST_DATA_ECHO	11 + ENCODING_PARAMETER
#define UNKNOWN_DATA2	12 + ENCODING_PARAMETER

#ifndef portCHAR
	#define portCHAR	char
#endif
#ifndef portLONG
	#define portLONG	int
#endif
#ifndef portTickType 
	#define portTickType	unsigned short
#endif

typedef struct {
	unsigned portCHAR  start;
	unsigned portCHAR  length;                  
	unsigned portCHAR  type;
	unsigned portCHAR reserved;
} __attribute__((packed)) OBD2HW_Header; 

/*
	Comunication Protocol Header for comunication between Click and Openbeacon Deamon.
*/
#define STATUS_ECHO_OK		0x01				// set 1 for echo, if packet can send 
#define STATUS_ECHO_ERROR		0x02				// set 1 for echo, if packet can't send
#define STATUS_CRC_CHECK		0x04				// hw set 1, if crc is ok
#define STATUS_NO_TX			0x08				// set 1, if packet no send
#define STATUS_hw_rxtx_test		0x10				// set 1, if hw must send [count ] packets
#define STATUS_full_test			0x20				// set 1, if packet send from HOST to HOST

typedef struct {	
    unsigned portCHAR  status;									 	// State:   echo_ok?, echo_error?;  crc? , no_tx?, hw_rxtx_test?  ...
    unsigned portCHAR  count;										
    unsigned portCHAR  channel;                          							// channel frequency:      2400 MHz + rf_ch * a MHz       ( a=1 für 1 Mbps, 2 für 2 Mbps )
    unsigned portCHAR  rate;									 		// data rate value:      	  1 = 1 Mbps   ,		2 = 2 Mbps
    unsigned portCHAR  power;   					     				 	// power:		        	00 =  -18 dBm,		01 = -12 dBm		10 = -6 dBm		11 = 0 dBm
    unsigned portCHAR  openbeacon_dmac[ OPENBEACON_MACSIZE ];	 		// kann von 3-5 Byte variieren
    unsigned portCHAR  openbeacon_smac[ OPENBEACON_MACSIZE ];		 	// kann von 3-5 Byte variieren
    unsigned portCHAR  length;	
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
} __attribute__ ((packed)) HW_rxtx_Test;   // 5 + 5 + 5*4 = 20 + 10 = 30

portCHAR putDataToUSBChannel(struct device_data* dev,  unsigned portCHAR* buffer,  unsigned portCHAR blen );
portCHAR getDataFromUSBChannel( struct device_data* dev,  unsigned portCHAR* buffer,  unsigned portCHAR *blen, time_t max_wait );

unsigned int write_to_channel( portCHAR* out, portLONG len,  struct device_data* dev );
unsigned int read_from_channel( portCHAR* out, portLONG len, struct device_data* dev );
		
void debug_msg(char* msg, unsigned portCHAR msg_len);
void debug_hex_msg(char* msg, unsigned portCHAR msg_len);

#define USBCHANNEL_BUFFER_SIZE           1000
#define USBCHANNEL_TMPBUFFER_SIZE     1000

typedef struct {
	portCHAR *getDataFromUSBChannel_buffer;
	portLONG  getDataFromUSBChannel_buffer_len;
	portCHAR  getDataFromUSBChannel_packet_enc;
	portCHAR  getDataFromUSBChannel_state;
	
	portCHAR *putDataToUSBChannel_buffer;
	portLONG  putDataToUSBChannel_buffer_len;	
	portCHAR *tmp_buffer;
	portLONG  tmp_buffer_len;
	portLONG  putDataToUSBChannel_lastpacket;
	unsigned int thread_mutex_lock_read;
	unsigned int thread_mutex_lock_write;
} __attribute__ ((packed)) static_buffer_info;

extern static_buffer_info sbi_dev[];

extern unsigned long usb_channel_counter1;
extern unsigned long usb_channel_counter2;
extern unsigned long usb_channel_counter3;
extern unsigned long usb_channel_counter4;
extern unsigned long usb_channel_counter5, usb_channel_counter6, usb_channel_counter7, usb_channel_counter8, usb_channel_counter9;

#define STATUS_OK							10
#define STATUS_ERROR_NO_DATA				20

#ifdef __OPENBEACON_COMUNICATION_H__WITH_ENCODING		
	
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
			
		if(  USBCHANNEL_BUFFER_SIZE-sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len>send_len) {
			memcpy(sbi_dev[ dev->index ].putDataToUSBChannel_buffer+sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len, buffer, send_len>blen?blen:send_len);
			sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len += send_len;

			if(sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len>= (portLONG)(sizeof(OBD2HW_Header)+ph->length) ) { // can full send
				tmp_buffer[0] = sbi_dev[ dev->index ].putDataToUSBChannel_buffer[0];     //  is 0
				j=1;
				for(i=1; i<sizeof(OBD2HW_Header)+ph->length; i++) {
					// encoding for usb-channel
					if( sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]==0x00 || (sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]>0x00 && sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]<ENCODING_PARAMETER) ) {
						tmp_buffer[j] = 0x01;
						j++;
						tmp_buffer[j] = sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i]+ENCODING_PARAMETER;
					} else {
						tmp_buffer[j] = sbi_dev[ dev->index ].putDataToUSBChannel_buffer[i];
					}				
					j++;
				}		
				tmp_buffer[j] = 0; j++;
				write_to_channel( (char*)tmp_buffer, j, dev );
				
				sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len -= sizeof(OBD2HW_Header)+ph->length;
				if(sbi_dev[ dev->index ].putDataToUSBChannel_lastpacket<0) sbi_dev[ dev->index ].putDataToUSBChannel_lastpacket = 0;
				
				memmove( sbi_dev[ dev->index ].putDataToUSBChannel_buffer, sbi_dev[ dev->index ].putDataToUSBChannel_buffer+sizeof(OBD2HW_Header)+ph->length, sbi_dev[ dev->index ].putDataToUSBChannel_buffer_len );
			}		
		} else { 
			ret=STATUS_ERROR_NO_DATA;
		}
		return ret;
	}
	
	/*
		Neu bauen
		1. Daten temporäre Laden
		2. Packetanfang finden und Packet stück für Stück in den Packetpuffer übertragen 
		3. Wenn Packet fertig ist, an den Anwender übergeben.
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
				} else {
					buffer[ dec_pos ] = sbi_dev[dev->index].tmp_buffer[ tmp_i ] - sbi_dev[dev->index].getDataFromUSBChannel_packet_enc;
					sbi_dev[dev->index].getDataFromUSBChannel_packet_enc=0;
					dec_pos++;
				}
			}
			*blen=dec_pos;
			
			// removing
			sbi_dev[dev->index].tmp_buffer_len -= pos;
			memmove( sbi_dev[dev->index].tmp_buffer, sbi_dev[dev->index].tmp_buffer+pos, sbi_dev[dev->index].tmp_buffer_len );
						
			// check the packet
			ph = (OBD2HW_Header *)buffer;
			if(ph->length+sizeof(OBD2HW_Header)!=*blen ) {
				usb_channel_counter9++;
				*blen=0;
				return STATUS_ERROR_NO_DATA;
			}
			
			return STATUS_OK;
		}
		
		*blen=0;
		return STATUS_ERROR_NO_DATA;
	}
#endif

#endif/*__OPENBEACON_COMUNICATION_H__*/
