// TODO: make function putData* and getData* THREAD-SAVE

#ifndef __OPENBEACON_COMUNICATION_H__
#define __OPENBEACON_COMUNICATION_H__

#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include "main.h"

extern int begin_ports;

struct device_data {
	char device_name[50];
	
	int rx_running;
	int tx_running;
	int fd, index;
	struct socket_connection *con;
	
	pthread_t cThread, rxThread, txThread, usbReadThread, clickReadThread, writeOBdThread;
	int threadResult;
	void *cThreadJoin, *rxThreadJoin,*txThreadJoin, *usbThreadJoin, *clickReadThreadJoin, *writeOBdThreadJoin;
	
	char usb_write_buffer[10000], usb_write_tmp_buffer[100];
	char usb_read_buffer[10000], usb_read_tmp_buffer[100];
	char click_read_buffer[10000], click_read_tmp_buffer[100];
	unsigned int usb_write_buffer_length, usb_read_buffer_length, click_read_buffer_length;
	
	pthread_mutex_t usb_read_mutex, click_read_mutex;
	pthread_mutex_t usb_write_mutex, click_write_mutex;
	
	char getDataFromClickChannel_buffer[10000];
	unsigned int getDataFromClickChannel_buffer_length;

	int sendPort, recivePort;
	FILE *beaconoutput_file, *hostoutput_file, *debug_file, *send_file_log, *recive_file_log;

	struct statistic_data stat_data;
};

#define OPENBEACON_MACSIZE                    5
#define ENCODING_PARAMETER		0x20
/*
	Comunication Protocol Header for comunication between Openbeacon Deamon and Openbeacon HW.
*/
#define MONITOR_INPUT 			1 	+ ENCODING_PARAMETER
#define TEST_DATA				2 	+ ENCODING_PARAMETER
#define TEST_DATA_ECHO			3 	+ ENCODING_PARAMETER
#define PACKET_DATA 			10 	+ ENCODING_PARAMETER
#define CONFIG_DATA 			11 	+ ENCODING_PARAMETER
#define DEBUG_PRINT 			12 	+ ENCODING_PARAMETER
#define MONITOR_PRINT 			13 	+ ENCODING_PARAMETER
#define MONITOR_HEX_PRINT   	14 	+ ENCODING_PARAMETER
#define DEBUG_HEX_PRINT			15 	+ ENCODING_PARAMETER
#define SPEZIAL_PRINT			16 	+ ENCODING_PARAMETER    // unused
#define STATUS_OPENBEACON_V1	17 	+ ENCODING_PARAMETER
#define STATUS_OPENBEACON_V2	18 	+ ENCODING_PARAMETER

#ifndef portCHAR
	#define portCHAR	char
#endif
#ifndef portLONG
	#define portLONG	int
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
    unsigned portCHAR  length;
    unsigned portCHAR  count;										
    unsigned portCHAR  channel;                          							// channel frequency:      2400 MHz + rf_ch * a MHz       ( a=1 f�r 1 Mbps, 2 f�r 2 Mbps )
    unsigned portCHAR  rate;									 		// data rate value:      	  1 = 1 Mbps   ,		2 = 2 Mbps
    unsigned portCHAR  power;   					     				 	// power:		        	00 =  -18 dBm,		01 = -12 dBm		10 = -6 dBm		11 = 0 dBm
    unsigned portCHAR  openbeacon_dmac[ OPENBEACON_MACSIZE ];	 		// kann von 3-5 Byte variieren
    unsigned portCHAR  openbeacon_smac[ OPENBEACON_MACSIZE ];		 	// kann von 3-5 Byte variieren
} __attribute__ ((packed)) Click2OBD_header;   // 16

typedef struct {
	unsigned char TxPowerLevel;
	unsigned char TxRate;
	unsigned char TxChannel;
	unsigned char NetID[5];

	/* Statistik  */
	unsigned char send_count[4];
	unsigned char send_fail_count[4];
	unsigned char recv_count[4];
	unsigned char recv_fail_count[4];
} StatusOpenbeacon_V1;

typedef struct {
	/* Statistik  */
	unsigned char tx_usb_packets[4], rx_usb_packets[4];
	unsigned char tx_usb_enc_bytes[4], rx_usb_enc_bytes[4];
	unsigned char tx_usb_dec_bytes[4], rx_usb_dec_bytes[4];
	unsigned char fail_tx_usb_packets[4], fail_rx_usb_packets[4];
	unsigned char qfree, rx_quse, tx_quse;
} StatusOpenbeacon_V2;

/*
	the struct for HW_RXTX_TEST
*/
typedef struct {
	unsigned portCHAR  openbeacon_smac[ OPENBEACON_MACSIZE ];		 	// kann von 3-5 Byte variieren
	unsigned char prot_type[2];										// Protokolltype: 0606  
	unsigned portLONG pID;
} __attribute__ ((packed)) HW_rxtx_Test;   // 5 + 5 + 5*4 = 20 + 10 = 30

#define USBCHANNEL_BUFFER_SIZE          1000
#define USBCHANNEL_TMPBUFFER_SIZE     	1000

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

#define STATUS_OK							10
#define STATUS_ERROR_NO_DATA				20

#ifdef __OPENBEACON_COMUNICATION_H__WITH_ENCODING		
	portCHAR putDataToUSBChannel(struct device_data* dev,  unsigned portCHAR* buffer,  unsigned portCHAR blen );
	portCHAR getDataFromUSBChannel( struct device_data* dev,  unsigned portCHAR* buffer,  unsigned portCHAR *blen, time_t max_wait );
	
#endif

#endif/*__OPENBEACON_COMUNICATION_H__*/
