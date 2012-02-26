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
#define INPUT_THREAD_SLEEP_TIME 	100L
#define THREAD_SLEEP_TIME 			100L
#define THREAD_MAX_SLEEP_TIME	 500000L


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
static char use_rand						= 		0;
static char use_gen							=		0;
static char use_ech							=		0;
static char use_daemon						=		0;
static unsigned char hw_send_rate			=	  	0;
static unsigned char wireless_channel		=	  	0;
static unsigned char wireless_rate			=	  	0;
static unsigned char wireless_power			=	  	0;
static char default_path[6]					= "/tmp/";
static char* path							= default_path;
static char noclick							= FALSE;
						
struct device_data * device_list;
unsigned int device_list_size;
						
void read_from_usb_thread(void *p);
void read_from_click_thread(void *p);

// Thread: ermöglicht das Häppchenweise(63) versenden über USB
void write_to_obd_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int put_len;

	while( TRUE ) {
		if(dev->usb_write_buffer_length>0) {
			pthread_mutex_lock(&dev->usb_write_mutex);
				put_len = dev->usb_write_buffer_length;
				if(dev->usb_write_buffer_length<put_len ) put_len = dev->usb_write_buffer_length;

				write_obd_serial( dev->fd, dev->usb_write_buffer, put_len );
				memcpy(dev->usb_write_buffer, dev->usb_write_buffer+put_len, put_len);

				dev->usb_write_buffer_length -= put_len;
			pthread_mutex_unlock(&dev->usb_write_mutex);
		}
		usleep( INPUT_THREAD_SLEEP_TIME );
	}
}

unsigned int write_to_channel( portCHAR* out, portLONG len, struct device_data* dev ) {
	write_obd_serial( dev->fd, out, len );
	usb_channel_counter2 += len;

/*
	while( TRUE ) {
		pthread_mutex_lock(&dev->usb_write_mutex);
		if( dev->usb_write_buffer_length<10000-len ) {
			memcpy( dev->usb_write_buffer+dev->usb_write_buffer_length, out, len );
			dev->usb_write_buffer_length += len;

			usb_channel_counter2 += len;
			pthread_mutex_unlock(&dev->usb_write_mutex);
			return len;
		}
		// usleep( INPUT_THREAD_SLEEP_TIME );
		pthread_mutex_unlock(&dev->usb_write_mutex);
	}
*/

	return len;
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

		sprintf(filename,"%s%s",path, device_list[j].device_name+i);
		l = strlen( filename );
		
		strncpy(filename+l, "_b.log", 7);			device_list[j].beaconoutput_file 		= fopen(filename, "a");
		strncpy(filename+l, "_h.log", 7);			device_list[j].hostoutput_file	= fopen(filename, "a");
		strncpy(filename+l, ".dat", 5);			device_list[j].debug_file 		= fopen(filename, "a");
		strncpy(filename+l, "_send.log", 10);		device_list[j].send_file_log 	= fopen(filename, "a");
		strncpy(filename+l, "_recv.log", 10);		device_list[j].recive_file_log 	= fopen(filename, "a");
		
		if(device_list[j].beaconoutput_file==NULL || device_list[j].hostoutput_file==NULL || device_list[j].debug_file==NULL
			|| device_list[j].send_file_log==NULL || device_list[j].recive_file_log==NULL) {
			printf("Dateien[%s] konnten nicht erstellt werden\n", filename);
			exit(-1);
		}
		
		pthread_mutex_init( &device_list[j].usb_read_mutex,  NULL);
		pthread_mutex_init( &device_list[j].usb_write_mutex,  NULL);
		
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
/*
		device_list[j].threadResult = pthread_create(  &(device_list[j].writeOBdThread )
									     ,  (pthread_attr_t*)NULL
									     ,(void *)&write_to_obd_thread
									     ,(void*)&device_list[j]);
*/

		// WICHTIG ab hier sollten keine �nderungen mehr an device_list[j] gemacht werden.
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
		bytes_per_intervall = atoi(argv[0]);
		packet_intervall =  floor(1000000/( bytes_per_intervall/packet_size ) );
		printf("packet_interval = %d\n", packet_intervall);
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
int set_hw_send_rate(int argc, char** argv){
	if(argc==1) {
		hw_send_rate = atoi(argv[0]);
		return 0;
	}
	return -1;
}
int set_channel(int argc, char** argv){
	if(argc==1) {
		wireless_channel = atoi(argv[0]);
		return 0;
	}
	return -1;
}
int set_power(int argc, char** argv){
	if(argc==1) {
		wireless_power = atoi(argv[0]);
		return 0;
	}
	return -1;
}
int set_rate(int argc, char** argv){
	if(argc==1) {
		wireless_rate = atoi(argv[0]);
		return 0;
	}
	return -1;
}
int use_path(int argc, char** argv) {
	if(argc==1) {
		// TODO: prüfen, ob das verzeichniss existiert
		path = argv[0];
		return 0;
	}
	return -1;
}
int stop_c2ob(int argc, char** argv) {
	noclick = TRUE;
	return 0;
}

static struct param2func pam[16] = {
					{"--help",  use_help, "\t\t\t- print this help text\n" }
					, {"-O",  use_dev, "[O1] [O2] ... [On]\t- USB Device for OpenBeacon HW\n\t\t\t\tsample: berg_odb -d 0 1 - for device ttyACM0 und ttyACM1" }
					, {"-Q", use_exittime, "[TIME]\t\t- Exittime (0 for no terminate)"} 
					, {"-D", use_printinterval, "[microseconds]\t- time for display status infos "}
					, {"-g", use_generate, "\t\t\t- send data to openbeacon"}
					, {"-e", use_echo, "\t\t\t- with echo from openbeacon"}
					, {"-p", use_packetsize, "[PACKET_SIZE]\t\t- size of a packet (5...95)"} 
					, {"-I", use_packetintv, "[bytes per seconds]\t- rate for sending data to openbeacon"}
					, {"-r", use_random, "\t\t\t- random data activate "}
					, {"-C", set_channel, "[channel]\t\t- channel for wireless "}
					, {"-R", set_rate, "[rate]\t\t- bitrate for wireless "}
					, {"-P", set_power, "[power]\t\t- power for wireless "}
					, {"-t", set_hw_send_rate, "[DATA_RATE]\t\t- data rate for test (wireless only) "}
					, {"-d", use_daemon_mode, "\t\t\t- daemon mode activate "}
					, {"-path", use_path, "\t\t\t- directory for output-files "}
					, {"-noclick", stop_c2ob, "\t\t- deaktiviert Verbindung Click <-> OBd "}};
					
static struct hListe plist = { (int)sizeof(pam)/sizeof(struct param2func), (struct param2func *)&pam };

void read_from_usb_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int ret = 0, i;
	unsigned char buff[4] = {0, 0, 0, 0};
	unsigned long rfu_sleep_time = THREAD_SLEEP_TIME;
	
	while(1) {
		if(exit_time>0 && exit_time<time(0)) break;

		if(ret==0) {
			ret = read_obd_serial(dev->fd, (char*)dev->usb_read_tmp_buffer, 100 );
			if(ret<0) ret = 0;
			fflush( stdout );
		}
		if(ret>0) {
			pthread_mutex_lock(&dev->usb_read_mutex);
				if(10000-dev->usb_read_buffer_length>ret ) {
					memcpy(dev->usb_read_buffer+dev->usb_read_buffer_length, dev->usb_read_tmp_buffer, ret);
					dev->usb_read_buffer_length +=ret;
					usb_channel_counter1 += ret;
					ret=0;
					rfu_sleep_time = THREAD_SLEEP_TIME;
				}
			pthread_mutex_unlock(&dev->usb_read_mutex);
		}

		if(rfu_sleep_time>THREAD_SLEEP_TIME) usleep( rfu_sleep_time );
		if(rfu_sleep_time<THREAD_MAX_SLEEP_TIME) rfu_sleep_time += THREAD_SLEEP_TIME;
	}
	printf("exit: usb_read\n");
	pthread_exit(p);
}

void read_from_click_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int ret = 0, j;
	unsigned char buff[4] = {0, 0, 0, 0};
	unsigned long rfc_sleep_time = THREAD_SLEEP_TIME;
	
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
					rfc_sleep_time = THREAD_SLEEP_TIME;
				}
			pthread_mutex_unlock(&dev->click_read_mutex);
		}

		usleep( rfc_sleep_time );
		if(rfc_sleep_time<THREAD_MAX_SLEEP_TIME) rfc_sleep_time += rfc_sleep_time;
	}
	printf("exit: click read\n");
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
	unsigned long tCtoO_sleep_time = THREAD_SLEEP_TIME;
	
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
				
				// printf("generate packet\n");
				// Time/PacketID in Datei1 packen
				gettimeofday(&c_time, 0);
				fprintf(dev->send_file_log, "%d.%.6d: %.6d\t%.3d\t%.3d\t%.3d \n", (unsigned int)c_time.tv_sec, (unsigned int)c_time.tv_usec, PacketID, coding_h, packet_size, coding_d );
				fflush(dev->send_file_log);
				
				PacketID++;
				usb_channel_counter3 += coding_h+coding_d;
				usb_channel_counter6++; //  =  sizeof(OBD2HW_Header)+ph->length;
			}
			gettimeofday(&se_time, 0);

			if( packet_intervall > time_diff(sb_time, se_time)) {
				usleep(  packet_intervall-time_diff(sb_time, se_time) );
			}
		} else {
			if(dev->click_read_buffer_length>sizeof(Click2OBD_header) ) { // read from click and send to beacon
				pthread_mutex_lock(&dev->click_read_mutex);
					p_obdh = (Click2OBD_header*)dev->click_read_buffer;
					packet_len = p_obdh->length + sizeof(Click2OBD_header);
				
					if( dev->click_read_buffer_length>=packet_len) {
					
						memcpy(buffer+ sizeof(OBD2HW_Header), dev->click_read_buffer, packet_len);
						p_hwh =   (OBD2HW_Header*)buffer;
						p_hwh->start 		= 0;
						p_hwh->length 		= packet_len;
						p_hwh->type 		= PACKET_DATA;
						p_hwh->reserved 	= 0xFF;


						// HEXDUMP:
						// printf("DATEN: %d, %d, %d\n", p_obdh->channel,  p_obdh->power,  p_obdh->rate);
						// for(i=0; i<p_hwh->length; i++) printf("%.2X ", buffer[i]);
						// printf("\n\n");

						dev->click_read_buffer_length -= packet_len;
						if(dev->click_read_buffer_length>0) memcpy(dev->click_read_buffer, dev->click_read_buffer+packet_len, dev->click_read_buffer_length);

						//printf("Click to ob ...\n");
						if(!noclick) {
							putDataToUSBChannel(dev,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
						}
						usb_channel_counter10 += (sizeof(OBD2HW_Header)+p_hwh->length);
						tCtoO_sleep_time = THREAD_SLEEP_TIME;
					}
				pthread_mutex_unlock(&dev->click_read_mutex);
			}
			usleep( tCtoO_sleep_time );
			if( tCtoO_sleep_time<THREAD_MAX_SLEEP_TIME ) tCtoO_sleep_time += THREAD_SLEEP_TIME;
		}
	}

	printf("exit: click -> obd\n");
	pthread_exit(p);
}

unsigned long usb_channel_counter1 = 0;
unsigned long usb_channel_counter2 = 0;
unsigned long usb_channel_counter3 = 0, usb_channel_counter4 = 0, usb_channel_counter5=0, usb_channel_counter6=0;
unsigned long usb_channel_counter7 = 0, usb_channel_counter8 = 0, usb_channel_counter9 = 0, usb_channel_counter10=0;

time_t openbeacon_status_time = 0;

unsigned long arrayToLong(unsigned char *buff, unsigned char len) {
	int i;
	unsigned long ret=0;

	for(i=len-1; i>=0; i--) {
		ret = ret*256+buff[i];
	}
	return ret;
}

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
	unsigned long rOtoC_sleep_time = THREAD_SLEEP_TIME;

	char buffer[10000];
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;

	
	gettimeofday(&c_time, 0);
	gettimeofday(&opb_time, 0);
	fprintf(dev->beaconoutput_file, "OB\tTime\t\t\t\tNetID\tChannel\tRate\tPower\tTX\tFailTX\tRX\tFailRX\n");
	fprintf(dev->beaconoutput_file, "USB\tTime\t\t\tTX\tFailTX\tTXEncBs\tTXDecBs\tRX\tFailRX\tRXEncBs\tRXDecBs\tTXQu\tRXQu\tQuFree\n");
	fflush(dev->beaconoutput_file);
	
	fprintf(dev->hostoutput_file, "time\t\t\trxEnc\ttxEnc\ttxDec\trxDataP\trxStP\tCtxDP\tCrxDP\tCrxSP\tCErrP\n");
	fflush(dev->hostoutput_file);

	unsigned long send_count=0, send_count_fail=0;
	unsigned long recv_count=0, recv_count_fail=0;

	while( dev->rx_running == 1 ) {
		if(exit_time>0 && exit_time<time(0)) break;
		
		hlen = 200;
		status = getDataFromUSBChannel(dev,  buffer,  &hlen, 1 );

		gettimeofday(&tmp_time, 0);		
		if(  time_diff(tmp_time, c_time)>=print_intervall ) {
			fprintf(dev->hostoutput_file, "%d.%.6d:\t%ld\t%ld\t%ld\t%ld\t%ld\t%ld", tmp_time.tv_sec, tmp_time.tv_usec, usb_channel_counter1, usb_channel_counter2, usb_channel_counter3, usb_channel_counter5, usb_channel_counter4, usb_channel_counter6);
			fprintf(dev->hostoutput_file, "\t%ld\t%ld\t%ld\t%ld\n", usb_channel_counter7, usb_channel_counter8, usb_channel_counter9, usb_channel_counter10 );
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
			usb_channel_counter10=0;
			
			gettimeofday(&c_time, 0);
		}
		
		if(status==STATUS_OK && hlen>0) {
			rOtoC_sleep_time = THREAD_SLEEP_TIME;
			if( p_hwh->type==MONITOR_PRINT ) {
				printf("%s>\t", dev->device_name);
				buffer[  sizeof(OBD2HW_Header) + p_hwh->length ] = 0;
				printf("%s\n", buffer+sizeof(OBD2HW_Header) );
				fflush(stdout);
				
				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==MONITOR_HEX_PRINT ) {
				printf("%s>\t", dev->device_name);
				pid=0;
				for(k=sizeof(long); k>=0; k--) {
					pid = pid*256 	+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header)        ];
				}

				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==DEBUG_HEX_PRINT ) {
				usb_channel_counter7++;
				PacketID = 0;
				for(k=sizeof(long); k>=0; k--) {
					PacketID = PacketID*256 	+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header) ];
				}
				gettimeofday(&r_time, 0);
				fprintf(dev->recive_file_log, "%d.%.6d:  %.6d\n", r_time.tv_sec, r_time.tv_usec,  PacketID);
				fflush(dev->recive_file_log);
				
				p_hwh->type=0;
				p_hwh->length=0;				
			} else if( p_hwh->type==STATUS_OPENBEACON_V1 ) {
				/* Statusinformationen: wie aktueller Kanal, Bitrate, Power
				 * 						+ gesendete und empfangene Pakete
				 * 						+ fehlversuche beim Senden 				*/
				StatusOpenbeacon_V1* psob_v1 = (StatusOpenbeacon_V1*)(buffer+sizeof(OBD2HW_Header));
				struct timeval h_time;

				gettimeofday(&h_time, 0);
				fprintf(dev->beaconoutput_file,"OB\t%d.%.6d:\t", h_time.tv_sec, h_time.tv_usec);
				for(k=0; k<OPENBEACON_MACSIZE; k++) {
					fprintf(dev->beaconoutput_file,"%.2X", psob_v1->NetID[k] );
					if(k<OPENBEACON_MACSIZE-1 ) fprintf(dev->beaconoutput_file,":");
				}
				fprintf(dev->beaconoutput_file, "\t%d\t%d\t%d\t"	   , psob_v1->TxChannel, psob_v1->TxRate, psob_v1->TxPowerLevel );
				fprintf(dev->beaconoutput_file, "%ld\t%ld\t", arrayToLong(psob_v1->send_count, 4), arrayToLong(psob_v1->send_fail_count, 4));
				fprintf(dev->beaconoutput_file, "%ld\t%ld\t", arrayToLong(psob_v1->recv_count, 4), arrayToLong(psob_v1->recv_fail_count, 4));
				fprintf(dev->beaconoutput_file, "\n");
				fflush(dev->beaconoutput_file);
			} else if( p_hwh->type==STATUS_OPENBEACON_V2 ) {
				StatusOpenbeacon_V2* psob_v2 = (StatusOpenbeacon_V2*)(buffer+sizeof(OBD2HW_Header));
				struct timeval h_time;

				gettimeofday(&h_time, 0);
				fprintf(dev->beaconoutput_file, "USB\t%d.%.6d:\t", h_time.tv_sec, h_time.tv_usec);
				fprintf(dev->beaconoutput_file, "%ld\t%ld\t"	   , arrayToLong(psob_v2->tx_usb_packets, 4),		arrayToLong(psob_v2->fail_tx_usb_packets, 4) );
				fprintf(dev->beaconoutput_file, 	"%ld\t%ld\t"	   , arrayToLong(psob_v2->tx_usb_enc_bytes, 4),		arrayToLong(psob_v2->tx_usb_dec_bytes, 4) );
				fprintf(dev->beaconoutput_file, 	"%ld\t%ld\t"	   , arrayToLong(psob_v2->rx_usb_packets, 4),		arrayToLong(psob_v2->fail_rx_usb_packets, 4) );
				fprintf(dev->beaconoutput_file, 	"%ld\t%ld\t"	   , arrayToLong(psob_v2->rx_usb_enc_bytes, 4),		arrayToLong(psob_v2->rx_usb_dec_bytes, 4) );
				fprintf(dev->beaconoutput_file, "%d\t%d\t%d\t"  , psob_v2->tx_quse,   psob_v2->rx_quse,   psob_v2->qfree );
				fprintf(dev->beaconoutput_file, "\n");
				fflush(dev->beaconoutput_file);
			} else if(p_hwh->type==PACKET_DATA) {			
				// send to click
				send_to_peer(dev->con, buffer+sizeof(OBD2HW_Header),  p_hwh->length);
			} else {				
				usb_channel_counter9++;
			}
		}
		
		usleep( rOtoC_sleep_time );
		if(rOtoC_sleep_time > THREAD_MAX_SLEEP_TIME) rOtoC_sleep_time += THREAD_SLEEP_TIME;
	}  
	printf("exit: obd -> click\n");
	pthread_exit(p);
}

void exit_function() {
	struct device_data* dev = device_list;
	unsigned int i;

	for(i=0; i<device_list_size; i++) {
		printf("closing connection to %s\n", dev->device_name);
		if(dev->con!=NULL) {
			close_connection(dev->con);
			dev->con = NULL;
		}
		if(dev->fd!=-1 ) {
			close_obd_serial(dev->fd);
			dev->fd=-1;
		}
		if(dev->beaconoutput_file!=NULL) {
			fclose(dev->beaconoutput_file);
			dev->beaconoutput_file=NULL;
		}
		if(dev->debug_file!=NULL) {
			fclose(dev->debug_file);
			dev->debug_file=NULL;
		}
		if(dev->send_file_log!=NULL) {
			fclose(dev->send_file_log);
			dev->send_file_log=NULL;
		}
		if(dev->recive_file_log!=NULL) {
			fclose(dev->recive_file_log);
			dev->recive_file_log=NULL;
		}
		dev++;
	}
	exit(0);
}

unsigned int default_index=0;

#define SEND_CONFIG( type, z )  		if(type!=0) { \
											buffer[ sizeof(OBD2HW_Header) ] = z; \
											sprintf(buffer+sizeof(OBD2HW_Header)+1, "%d", type); \
											p_hwh->length = strlen( buffer+sizeof(OBD2HW_Header) ); \
											while(putDataToUSBChannel(device_list+dev_num,  buffer, sizeof(OBD2HW_Header)+p_hwh->length )!=STATUS_OK) usleep( 10 ); \
											usleep( 2000 ); \
										}



int input_function(void *p) {
	char buffer[100];
	unsigned char len = 0;
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;
	unsigned int dev_num;
		
	p_hwh->start=0;
	p_hwh->length=0;
	p_hwh->type=MONITOR_INPUT;
	p_hwh->reserved=0xFF;

	sleep(1);
	// Absetzen der initialen Parameter
	// behandle es als virtuelle shell eingabe (so könnten auch .config später umgesetzt werden)
	for(dev_num=0; dev_num<device_list_size; dev_num++) {
		// konfiguriere Kanal
		SEND_CONFIG( wireless_channel, 'c' )

		// konfiguriere Power
		SEND_CONFIG( wireless_power, 'p' )

		// konfiguriere Rate
		SEND_CONFIG( wireless_rate, 'r' )

		// konfiguriere Datenrate
		SEND_CONFIG( hw_send_rate, 'r' )
	}
	
	while(1) {
		if(exit_time>0 && exit_time<time(0)) break;

		while( (buffer[sizeof(OBD2HW_Header)+len]=getchar())!='\n' ) len++;

		switch( buffer[sizeof(OBD2HW_Header) ] ) {
			case '\n':  break;
			case 'd':
					dev_num = atoi( buffer+sizeof(OBD2HW_Header)+1);
		
					if(dev_num>=0 && dev_num<device_list_size && default_index != dev_num) {
						default_index = dev_num;
						printf("switch device to: %d\n", default_index);
					}
				
					break;
			case 'x':
					// signal senden
					exit_time = time(0)-1;
					break;
			default:
					p_hwh->length = len;
					putDataToUSBChannel(device_list+default_index,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
					break;
		}
		len=0;

		// feste Schlafenszeit festlegen, um ressourcen zu schonen
		usleep( INPUT_THREAD_SLEEP_TIME );
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
		pthread_join(dev->usbReadThread,&dev->usbThreadJoin);
		pthread_join(dev->clickReadThread,&dev->clickReadThreadJoin);
		dev++; 
	}
	printf("exit finish!\n");
	
	exit_function();
	
	return(0);
}
