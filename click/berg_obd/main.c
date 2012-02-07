#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dlfcn.h>
#include <pthread.h>
#include <dirent.h>
#include <string.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>

#include "socket/obd_socket.h"
#include "serial/obd_serial.h"

#include "tools/commandline.h"


#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING		
#include "openbeacon_comunication.h"

#define BUFFERSIZE 2048
#define SLEEP_TIME 500

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

static time_t exit_time=0;
static unsigned char packet_size			= 	      20;
static unsigned long packet_intervall		=   		0;
static unsigned long print_intervall		=  1000000;
static unsigned long bytes_per_intervall	= 	63000;
static char use_rand					= 		0;
static char use_gen					=		0;
static char use_ech						=		0;
static char use_daemon					=		0;
						
struct device_data * device_list;
unsigned int device_list_size;
						
void read_from_usb_thread(void *p);
void read_from_click_thread(void *p);

unsigned int write_to_channel( portCHAR* out, portLONG len, struct device_data* dev ) {
	unsigned int ret = write_obd_serial( dev->fd, (char*)out, len );
	
	usb_channel_counter2 += len;
	return ret;
}

unsigned int  read_from_channel( portCHAR* out, portLONG len, struct device_data* dev ) {
	unsigned int ret = len, i;
	
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

void *tx_from_click_to_ob_thread(void *p);
void *rx_from_ob_to_click_thread(void *p);

int begin_ports = 20000;
unsigned int InOut_Device_id;

int use_dev(int argc, char** argv) { 
	unsigned int j=0;
	
	if(argc==0) return -1;

	device_list = (struct device_data*) calloc ( argc+1, sizeof(struct device_data) );
	device_list_size = argc;

	for(j=0; j<argc; j++) {
		device_list[j].index = j;
		
		sprintf(device_list[j].device_name, "/dev/ttyACM%s\0", argv[j] );

		device_list[j].rx_running = 1;
		device_list[j].tx_running = 1;
		
		device_list[j].fd = open_obd_serial( device_list[j].device_name );
		if ( device_list[j].fd == -1 ) exit(-2);

		device_list[j].sendPort   = begin_ports+j*2;
		device_list[j].recivePort = begin_ports+j*2+1;

		printf("open socket(localhost, %d, %d)\n", device_list[j].sendPort, device_list[j].recivePort );
		device_list[j].con = open_socket_connection("localhost", device_list[j].sendPort, device_list[j].recivePort );
		
		char filename[120];
		
		int i;
		int l = strlen(device_list[j].device_name);
		
		for(i=l; i>=0 && device_list[j].device_name[i-1]!='/'; i-- )  ;
		strncpy(filename, device_list[j].device_name+i, l-i);
		
		sprintf(filename,"/tmp/%s",device_list[j].device_name+i);
		
		strncpy(filename+(l-i), "_b.log", 7);			device_list[j].output_file 		= fopen(filename, "a");
		strncpy(filename+(l-i), "_h.log", 7);			device_list[j].hostoutput_file	= fopen(filename, "a");
		strncpy(filename+(l-i), ".dat", 5);			device_list[j].debug_file 		= fopen(filename, "a");
		strncpy(filename+(l-i), "_send.log", 10);		device_list[j].send_file_log 	= fopen(filename, "a");
		strncpy(filename+(l-i), "_recv.log", 10);		device_list[j].recive_file_log 	= fopen(filename, "a");
		
		if(device_list[j].output_file==NULL || device_list[j].hostoutput_file==NULL || device_list[j].debug_file==NULL
			|| device_list[j].send_file_log==NULL || device_list[j].recive_file_log==NULL) {
			printf("Dateien konnten nicht erstellt werden\n", filename);
			exit(-1);
		}
		
		pthread_mutex_init( &device_list[j].usb_read_mutex,  NULL);
		
		device_list[j].threadResult = pthread_create(  &(device_list[j].txThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&tx_from_click_to_ob_thread
							     ,(void*)&device_list[j]); 

		device_list[j].threadResult = pthread_create(  &(device_list[j].usbReadThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&read_from_usb_thread
							     ,(void*)&device_list[j]);
		
		device_list[j].threadResult = pthread_create(  &(device_list[j].clickReadThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&read_from_click_thread
							     ,(void*)&device_list[j]);		

		device_list[j].threadResult = pthread_create(  &(device_list[j].rxThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&rx_from_ob_to_click_thread
							     ,(void*)&device_list[j]);
		
		// WICHTIG ab hier sollten keine änderungen mehr an device_list[j] gemacht werden.
	}
	return 0;
}
int use_help(int argc, char** argv) { return -1; }

int use_exittime(int argc, char** argv){ 
	if( argc==1 ) {
		exit_time = time(0) + atoi( argv[0] );
	
		return 0;
	}
	return -1;
}
int use_packetsize(int argc, char** argv){ 
	if( argc==1 ) {
		packet_size = atoi( argv[0] );
		if( !(packet_size>=5 && packet_size<96) ) return -1;
		return 0;
	}
	return -1;
}
int use_packetintv(int argc, char** argv){ 
	if( argc==1 ) {		
		packet_intervall =  floor(1000000.0/( atoi(argv[0])/packet_size ) );
		bytes_per_intervall = atoi(argv[0]);
		
		return 0;
	}
	return -1;
}
int use_printinterval(int argc, char** argv){ 
	if( argc==1 ) {
		print_intervall = atoi(argv[0]);
		return 0;
	}
	return -1;
}
int use_random(int argc, char** argv){ 
	use_rand = 1;
	return 0;
}

int use_generate(int argc, char** argv){ 
	use_gen = 1;
	return 0;
}

int use_echo(int argc, char** argv){ 
	use_ech = 1;
	return 0;
}
int use_daemon_mode(int argc, char** argv){ 
	use_daemon = 1;
	return 0;
}


static struct param2func pam[10] = {	  
					{"--help",  use_help, "\t\t\t- print this help text\n" }
					, {"-O",  use_dev, "[O1] [O2] ... [On]\t- USB Device for OpenBeacon HW\n\t\t\t\tsample: berg_odb -d 0 1 - for device ttyACM0 und ttyACM1" }
					, {"-Q", use_exittime, "[TIME]\t\t- Exittime (0 for no terminate)"} 
					, {"-D", use_printinterval, "[microseconds]\t- time for display status infos "}
					, {"-g", use_generate, "\t\t\t- send data to openbeacon"}
					, {"-e", use_echo, "\t\t\t- with echo from openbeacon"}
					, {"-p", use_packetsize, "[PACKET_SIZE]\t\t- size of a packet (5...95)"} 
					, {"-I", use_packetintv, "[bytes per seconds]\t- rate for sending data to openbeacon"}
					, {"-r", use_random, "\t\t\t- random data activate "}
					, {"-d", use_daemon_mode, "\t\t\t- daemon mode activate "} };
					
static struct hListe plist = { (int)sizeof(pam)/sizeof(struct param2func), (struct param2func *)&pam };

void read_from_usb_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int ret = 0, i;
	unsigned char buff[4] = {0, 0, 0, 0};
	
	while(1) {
		if(exit_time>0 && exit_time<time(0)) break;

		if(ret==0) {
			ret = read_obd_serial(dev->fd, (char*)dev->usb_read_tmp_buffer, 100 );
			if(ret<0) ret = 0;
		} else {
			pthread_mutex_lock(&dev->usb_read_mutex);
				if(10000-dev->usb_read_buffer_length>ret ) {
					memcpy(dev->usb_read_buffer+dev->usb_read_buffer_length, dev->usb_read_tmp_buffer, ret);
					dev->usb_read_buffer_length +=ret;
					usb_channel_counter1 += ret;
					ret=0;
				}
			pthread_mutex_unlock(&dev->usb_read_mutex);
		}
		usleep( SLEEP_TIME );
	}
//	printf("exit: work");
	pthread_exit(p);
}

void read_from_click_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int ret = 0, j;
	unsigned char buff[4] = {0, 0, 0, 0};
	
	while(1) {
		if(exit_time>0 && exit_time<time(0)) break;

		if(ret==0) {
			ret =  recv_from_peer(dev->con, (char*)dev->click_read_tmp_buffer, 100); 
			if(ret<0) ret = 0;
		} else {
			pthread_mutex_lock(&dev->click_read_mutex);
				if(10000-dev->click_read_buffer_length>ret ) {
					memcpy(dev->click_read_buffer+dev->click_read_buffer_length, dev->click_read_tmp_buffer, ret);
					dev->click_read_buffer_length +=ret;
					ret=0;
				}
			pthread_mutex_unlock(&dev->click_read_mutex);
		}
		usleep( SLEEP_TIME );
	}
//	printf("exit: work");
	pthread_exit(p);
}


#define MAX_GENERATOR_SLEEP_TIME 300
unsigned int sleep_genereator = MAX_GENERATOR_SLEEP_TIME;

void insertLONG(portCHAR* buffer, long l) {
	char i;
	long tmp = l;
	
	for(i=0; i<sizeof(long); i++) {
		buffer[i] = tmp%256;
		tmp = tmp/256;		
	}	
}

unsigned long time_diff(struct timeval v1, struct timeval v2) {
	if(v1.tv_sec>= v2.tv_sec) {
		return (v1.tv_sec-v2.tv_sec)*1000000+(v1.tv_usec-v2.tv_usec);
	}
	return (v2.tv_sec-v1.tv_sec)*1000000+(v2.tv_usec-v1.tv_usec);	
}

char* textnachricht = "Hallo, das ist ein Text aus dem openbeacon.Bitte gut behandeln und bearbeiten.Dann machen wir weiter. ";

void *tx_from_click_to_ob_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	unsigned char readbytes, i, rj;
	struct timeval c_time, se_time, sb_time;
	int ret=0, coding_d, coding_h, packet_len;
	
	char buffer[10000];
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;
	Click2OBD_header* p_obdh;
	
	memcpy(buffer+sizeof(OBD2HW_Header), textnachricht, 100);
		
	long PacketID=0;
	
	sleep(1);

	while( dev->tx_running == 1) {
		if(exit_time>0 && exit_time<time(0)) break;

		if(use_gen==1) {
			p_hwh =   (OBD2HW_Header*)buffer;
			memcpy(buffer+sizeof(OBD2HW_Header), textnachricht, 100);
	
			p_hwh->start=0;
			p_hwh->length=packet_size;
	
			if(use_ech==1) p_hwh->type=TEST_DATA_ECHO;
			else p_hwh->type=TEST_DATA;

			p_hwh->reserved=0xFF;

			gettimeofday(&sb_time, 0);		
			for(i=0; i<1 && usb_channel_counter3<bytes_per_intervall; i++) {
				coding_h = sizeof(OBD2HW_Header);
				if(p_hwh->length<ENCODING_PARAMETER) coding_h++;
				
				coding_d = 0;
				for(rj=0; rj<packet_size; rj++) {
					coding_d++;
					if(use_rand==1) buffer[  sizeof(OBD2HW_Header) + rj ] = rand()%255;
					if(buffer[  sizeof(OBD2HW_Header) + rj ]<ENCODING_PARAMETER) coding_d++;
				}		
				
				insertLONG(buffer+sizeof(OBD2HW_Header), PacketID);
				putDataToUSBChannel(dev,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
				
				printf("Packet FromClick\n");
				// Time/PacketID in Datei1 packen
				gettimeofday(&c_time, 0);
				fprintf(dev->send_file_log, "%d.%.6d: %.6d\t%.3d\t%.3d\t%.3d \n", (unsigned int)c_time.tv_sec, (unsigned int)c_time.tv_usec, PacketID, coding_h, packet_size, coding_d );
				fflush(dev->send_file_log);
				
				PacketID++;
				usb_channel_counter3 += coding_h+coding_d;
				usb_channel_counter6++; //  =  sizeof(OBD2HW_Header)+ph->length;
			}
			
			// TODO: kernel Blockierzeit mit einrechnen  
			gettimeofday(&se_time, 0);
			usleep(  packet_intervall );
		} else if(dev->click_read_buffer_length>sizeof(Click2OBD_header) ) { // read from click and send to beacon
			pthread_mutex_lock(&dev->click_read_mutex);
				p_obdh = (Click2OBD_header*)dev->click_read_tmp_buffer;
				packet_len = p_obdh->length + sizeof(Click2OBD_header);
			
				if( dev->click_read_buffer_length>=packet_len) {
				
					memcpy(buffer+ sizeof(OBD2HW_Header), dev->click_read_buffer, packet_len);
					p_hwh =   (OBD2HW_Header*)buffer;
					p_hwh->start 		= 0;
					p_hwh->length 	= packet_len;
					p_hwh->type 		= PACKET_DATA;
					p_hwh->reserved 	= 0xFF;
					                         
					
					// HEXDUMP:
					// printf("DATEN: %d, %d, %d\n", p_obdh->channel,  p_obdh->power,  p_obdh->rate);
					// for(i=0; i<p_hwh->length; i++) printf("%.2X ", buffer[i]);
					// printf("\n\n");
					
					dev->click_read_buffer_length -= packet_len;
					if(dev->click_read_buffer_length>0) memcpy(dev->click_read_buffer, dev->click_read_buffer+packet_len, dev->click_read_buffer_length);
					
					putDataToUSBChannel(dev,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
					
				}
			pthread_mutex_unlock(&dev->click_read_mutex);
		}
		usleep( SLEEP_TIME );
	}
	printf("exit: click -> obd\n");
	pthread_exit(p);
}

unsigned long usb_channel_counter1 = 0;
unsigned long usb_channel_counter2 = 0;
unsigned long usb_channel_counter3 = 0, usb_channel_counter4 = 0, usb_channel_counter5=0, usb_channel_counter6=0;
unsigned long usb_channel_counter7 = 0, usb_channel_counter8 = 0, usb_channel_counter9 = 0;

time_t openbeacon_status_time = 0;
unsigned long openbeacon_status[11] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72 };  

unsigned long openbeacon_last_sec[9] = {0, 0, 0, 0, 0, 0, 0, 0, 0 };  
unsigned long openbeacon_avg[13] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 0, 0 };  
unsigned long openbeacon_avg_time = 0;

void *rx_from_ob_to_click_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	unsigned int i, index=0;
	int k;
	unsigned char hlen, recive_spezial=0;
	unsigned int blen, status;
	long txc_dec, txc_max_dec, rxc_dec, rxc_max_dec, txq, rxq, freeb, pid, idle_thread_counter;
	long txc_enc, txc_max_enc, rxc_enc, rxc_max_enc;
        struct timeval c_time, r_time, tmp_time, opb_time;
	long PacketID=0;

	char buffer[10000];
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;

	fprintf(dev->output_file, "Time\t\t     %10s/txME %10s/rxME %10s/txMD %10s/rxMD\t     txQ     rxQ    freeQ\n", "txE", "rxE", "txD", "rxD");
	fflush(dev->output_file);
	
	gettimeofday(&c_time, 0);
	gettimeofday(&opb_time, 0);
	
	fprintf(dev->hostoutput_file, "time\t\t\trxEnc\ttxEnc\ttxDec\trxDataP\trxStP\tCtxDP\tCrxDP\tCrxSP\tCErrP\n");
	fflush(dev->hostoutput_file);

	while( dev->rx_running == 1 ) {
		if(exit_time>0 && exit_time<time(0)) break;
		
		hlen = 200;
		status = getDataFromUSBChannel(dev,  buffer,  &hlen, 1 );
		
		gettimeofday(&tmp_time, 0);		
		if(  time_diff(tmp_time, c_time)>=print_intervall ) {
			fprintf(dev->hostoutput_file, "%d.%.6d:\t%ld\t%ld\t%ld\t%ld\t%ld\t%ld", tmp_time.tv_sec, tmp_time.tv_usec, usb_channel_counter1, usb_channel_counter2, usb_channel_counter3, usb_channel_counter5, usb_channel_counter4, usb_channel_counter6);
			fprintf(dev->hostoutput_file, "\t%ld\t%ld\t%ld\n", usb_channel_counter7, usb_channel_counter8, usb_channel_counter9 );
			fflush(dev->hostoutput_file);

			///if( usb_channel_counter1 == 0  ) sleep_genereator = 1000*MAX_GENERATOR_SLEEP_TIME;
			
			usb_channel_counter1=0;
			usb_channel_counter2=0;
			usb_channel_counter3=0;
			usb_channel_counter4=0;
			usb_channel_counter5=0;
			usb_channel_counter6=0;
			usb_channel_counter7=0;
			usb_channel_counter8=0;
			usb_channel_counter9=0;
			
			gettimeofday(&c_time, 0);
		}
		
		if(status==STATUS_OK && hlen>0) {
		        //if ( p_hwh->type!=SPEZIAL_PRINT) {
			//  printf("Packet FromOpenbeacon %d %d\n",hlen, p_hwh->type);
			//}
			if( p_hwh->type==MONITOR_PRINT ) {
				buffer[  sizeof(OBD2HW_Header) + p_hwh->length ] = 0;
				printf("%s\n", buffer+sizeof(OBD2HW_Header) );
				fflush(stdout);
				
				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==MONITOR_HEX_PRINT ) {
				pid=0;
				for(k=sizeof(long); k>=0; k--) {
					pid = pid*256 	+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header)        ];
				}

				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==DEBUG_HEX_PRINT ) {
				usb_channel_counter7++;
				// Time/PacketID in Datei1 packen
				PacketID = 0;
				for(k=sizeof(long); k>=0; k--) {
					PacketID = PacketID*256 	+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header) ];
				}
				gettimeofday(&r_time, 0);
				fprintf(dev->recive_file_log, "%d.%.6d:  %.6d\n", r_time.tv_sec, r_time.tv_usec,  PacketID);
				fflush(dev->recive_file_log);
				
				p_hwh->type=0;
				p_hwh->length=0;				
			} else if( p_hwh->type==SPEZIAL_PRINT ) {
				usb_channel_counter8++;
				txc_enc = 0; txc_max_enc = 0; rxc_enc = 0; rxc_max_enc = 0; txq=0; rxq=0; freeb=0;
				txc_dec = 0; txc_max_dec = 0; rxc_dec = 0; rxc_max_dec = 0; idle_thread_counter=0;
				for(k=sizeof(portLONG); k>=0; k--) {
					txc_enc			= txc_enc*256			 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)						];
					txc_max_enc		= txc_max_enc*256 	 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   1*sizeof(portLONG)	];
					txc_dec			= txc_dec*256		 	 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   2*sizeof(portLONG)	];
					txc_max_dec 		= txc_max_dec*256		 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   3*sizeof(portLONG)	];
					rxc_enc			= rxc_enc*256		 	 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   4*sizeof(portLONG) 	];
					rxc_max_enc		= rxc_max_enc*256 	 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   5*sizeof(portLONG) 	];
					rxc_dec 			= rxc_dec*256		 	 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   6*sizeof(portLONG)	];
					rxc_max_dec		= rxc_max_dec*256		 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   7*sizeof(portLONG)	];
					txq 				= txq*256 			 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   8*sizeof(portLONG)	];
					rxq 				= rxq*256 			 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+   9*sizeof(portLONG)	];
					freeb 			= freeb*256 			 + (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+ 10*sizeof(portLONG)	];
					idle_thread_counter	= idle_thread_counter*256+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header)+ 11*sizeof(portLONG)	];
				}				
				if( txc_enc	<openbeacon_status[0]  )  openbeacon_status[0]=0;
				if( txc_max_enc<openbeacon_status[1]  )  openbeacon_status[1]=0;
				if( txc_dec	<openbeacon_status[4]  )  openbeacon_status[4]=0;
				if( txc_max_dec<openbeacon_status[5]  )  openbeacon_status[5]=0;
				
				if( rxc_enc	<openbeacon_status[2]  )  openbeacon_status[2]=0;
				if( rxc_max_enc<openbeacon_status[3]  )  openbeacon_status[3]=0;
				if( rxc_dec	<openbeacon_status[6]  )  openbeacon_status[6]=0;
				if( rxc_max_dec<openbeacon_status[7]  )  openbeacon_status[7]=0;

				openbeacon_last_sec[0] += (txc_enc	- openbeacon_status[0]);
				openbeacon_last_sec[1] += (txc_max_enc- openbeacon_status[1]);
				openbeacon_last_sec[2] += (rxc_enc	- openbeacon_status[2]);
				openbeacon_last_sec[3] += (rxc_max_enc- openbeacon_status[3]);
				openbeacon_last_sec[4] += (txc_dec	- openbeacon_status[4]);
				openbeacon_last_sec[5] += (txc_max_dec- openbeacon_status[5]);
				openbeacon_last_sec[6] += (rxc_dec	- openbeacon_status[6]);
				openbeacon_last_sec[7] += (rxc_max_dec- openbeacon_status[7]);
				openbeacon_last_sec[8] += idle_thread_counter;
				
				openbeacon_status[0] = txc_enc;
				openbeacon_status[1] = txc_max_enc;
				openbeacon_status[2] = rxc_enc;
				openbeacon_status[3] = rxc_max_enc;
				openbeacon_status[4] = txc_dec;
				openbeacon_status[5] = txc_max_dec;
				openbeacon_status[6] = rxc_dec;
				openbeacon_status[7] = rxc_max_dec;
				
				if(openbeacon_status[8] < txq		) openbeacon_status[8] = txq;			// max. Puffer in einer Sekunde
				if(openbeacon_status[9] < rxq		) openbeacon_status[9] = rxq;
				if(openbeacon_status[10]>freeb 	) openbeacon_status[10] 	= freeb;
				
				p_hwh->type=0;
				p_hwh->length=0;
				if( recive_spezial==0 ) {
					gettimeofday(&opb_time, 0);
					gettimeofday(&tmp_time, 0);
					openbeacon_last_sec[0]  = 0;
					openbeacon_last_sec[1]  = 0;
					openbeacon_last_sec[2]  = 0;
					openbeacon_last_sec[3]  = 0;
					openbeacon_last_sec[4]  = 0;
					openbeacon_last_sec[5]  = 0;
					openbeacon_last_sec[6]  = 0;
					openbeacon_last_sec[7]  = 0;
				}
				recive_spezial=1;
			} else if(p_hwh->type==PACKET_DATA) {			
				// send to click
				send_to_peer(dev->con, buffer+sizeof(OBD2HW_Header),  p_hwh->length);
				printf("packet recive %d \n", p_hwh->length);
			} else {				
				usb_channel_counter9++;
			}
		}
		
		if( time_diff(tmp_time, opb_time)>=print_intervall ) {
			int ti;
			
			if( openbeacon_last_sec[0] < 1000000 || openbeacon_avg_time==0 ) {	
				for(ti=0; ti<8; ti++) {
					openbeacon_avg[ti] += openbeacon_last_sec[ti];
				}
				openbeacon_avg[8] += openbeacon_status[8];
				openbeacon_avg[9] += openbeacon_status[9];
				openbeacon_avg[10] += openbeacon_status[10];
				openbeacon_avg[11] += openbeacon_last_sec[8];
				openbeacon_avg_time++;
			} else {
				for(ti=0; ti<8; ti++) {
					openbeacon_last_sec[ti] = floor(openbeacon_avg[ti]/openbeacon_avg_time);
				}
				openbeacon_status[8] = floor( openbeacon_avg[8]/openbeacon_avg_time );
				openbeacon_status[9] = floor( openbeacon_avg[9]/openbeacon_avg_time );
				openbeacon_status[10] = floor( openbeacon_avg[10]/openbeacon_avg_time );
				openbeacon_last_sec[8] = floor( openbeacon_avg[11]/openbeacon_avg_time );
			}
			
			fprintf(dev->output_file, "%10d.%.6d",  tmp_time.tv_sec, tmp_time.tv_usec);
			fprintf(dev->output_file, "\t%7ld/%-7ld", openbeacon_last_sec[0], openbeacon_last_sec[1] );    // send_enc/sendMax_enc
			fprintf(dev->output_file, "\t%7ld/%-7ld", openbeacon_last_sec[2], openbeacon_last_sec[3] );    // recive_enc/reciveMAX
			fprintf(dev->output_file, "\t%7ld/%-7ld", openbeacon_last_sec[4], openbeacon_last_sec[5] );    // send_enc/sendMax_enc
			fprintf(dev->output_file, "\t%7ld/%-7ld", openbeacon_last_sec[6], openbeacon_last_sec[7] );    // recive_enc/reciveMAX
			fprintf(dev->output_file, "\t%7ld\t%7ld\t%7ld", openbeacon_status[8], openbeacon_status[9], openbeacon_status[10] );
			fprintf(dev->output_file, "\t%7ld\n", openbeacon_last_sec[8] );
			fflush(dev->output_file);
			
			openbeacon_last_sec[0] 	=   0; 	openbeacon_last_sec[1]	= 0;	openbeacon_last_sec[2] = 0;	openbeacon_last_sec[3] = 0;
			openbeacon_last_sec[4] 	=   0;	openbeacon_last_sec[5]	= 0;	openbeacon_last_sec[6] = 0;	openbeacon_last_sec[7] = 0;
			openbeacon_last_sec[8] 	=   0;
			
			openbeacon_status[8] 	=   0; 	openbeacon_status[9]	= 0;
			openbeacon_status[10] 	= 72;
			
			gettimeofday(&opb_time, 0);
		}
		usleep( SLEEP_TIME );
	}  
	printf("exit: obd -> click\n");
	pthread_exit(p);
}

int exit_function() {
	struct device_data* dev = device_list;
	unsigned int i;

	for(i=0; i<device_list_size; i++) {
		printf("closing connection to %s\n", dev->device_name);
		close_connection(dev->con);
		close_obd_serial(dev->fd);
		fclose(dev->output_file);
		fclose(dev->debug_file);
		fclose(dev->send_file_log);
		fclose(dev->recive_file_log);
		dev++;
	}
}

unsigned int default_index=0;

int input_function(void *p) {
	char buffer[100];
	unsigned char len = 0;
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;
	unsigned int dev_num;
		
	p_hwh->start=0;
	p_hwh->length=0;
	p_hwh->type=MONITOR_INPUT;
	p_hwh->reserved=0xFF;
	
	while(1) {
		if(exit_time>0 && exit_time<time(0)) break;

		while( (buffer[sizeof(OBD2HW_Header)+len]=getchar())!='\n' ) len++;
		switch( buffer[sizeof(OBD2HW_Header) ] ) {
			case '\n':  break;
			case 'd':  	dev_num = atoi( buffer+sizeof(OBD2HW_Header)+1);
		
					if(dev_num>=0 && dev_num<device_list_size && default_index != dev_num) {
						default_index = dev_num;
						printf("switch device to: %d\n", default_index);
					}
				
					break;
			case 'x': 	exit_time = time(0)-1;
					break;
			default:	p_hwh->length = len;
					putDataToUSBChannel(device_list+default_index,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
					break;
		}
		len=0;
		usleep( SLEEP_TIME*10 );
	}
	printf("exit: input\n");
	pthread_exit(p);
}

int main( int argc, char **argv) {
	struct device_data* dev;
	unsigned int i=0;
	pthread_t inputThread;
	void* inputJoin;

	srand ( time(NULL) );
	
	packet_intervall =  floor( (1000000.0*packet_size)/bytes_per_intervall );
	if( argc==1 || processParameter(argc-1,argv+1, plist)!=0 ) {
		int i;
		printf("Help for %s\n\n", argv[0] );
		for(i=0; i<plist.size; i++) {
			printf("%s%s\n", plist.func_list[i].param, plist.func_list[i].help);
		}

		return -1;
	}
	
	dev = device_list;
	InOut_Device_id = 0;  
	
	// Input-Thread
	if( use_daemon!=1 ) {
		pthread_create(  &inputThread,  (pthread_attr_t*)NULL, (void *)&input_function, NULL);
	}
	
	for(i=0; i<device_list_size; i++) {
		pthread_join(dev->txThread,&dev->txThreadJoin);
		pthread_join(dev->rxThread,&dev->rxThreadJoin);
		dev++; 
	}
	
	exit_function();
	
	return(0);
}
