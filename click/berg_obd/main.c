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

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "socket/obd_socket.h"
#include "serial/obd_serial.h"

#include "tools/commandline.h"
#include "parameter.h"
#include "usbshell.h"

#include "openbeacon_communication.h"
#include "tools/helpful.h"
#include "threads.h"
#include "main.h"


void write_to_obd_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned char tmp_buffer[10000];
	unsigned int put_len;
	unsigned int tmp_len;

	while( TRUE ) {
		if(pCMDValue.exit_time>0 && pCMDValue.exit_time<time(0)) break;

		put_len = 0;
		// TODO: häpchen max. 64 (aber ganze Packete) senden
		pthread_mutex_lock(&dev->usb_write_mutex);
			if(dev->usb_write_buffer_length>0) {
				memcpy(tmp_buffer, dev->usb_write_buffer, dev->usb_write_buffer_length);
				put_len = dev->usb_write_buffer_length;
				dev->usb_write_buffer_length = 0;
			}
		pthread_mutex_unlock(&dev->usb_write_mutex);

		if(put_len>0) {
			write_obd_serial( dev->fd, tmp_buffer, put_len );
		}
		usleep( 100 );
	}
	printf("exit: write to ob\n");
}
void reset_stat(struct statistic_data *stat) {
	stat->usb_recive_packets		=	0;
	stat->usb_recive_dec_bytes		=	0;
	stat->usb_recive_enc_bytes		=	0;
	stat->usb_fail_recive_packets 	=	0;

	stat->usb_send_packets			=	0;
	stat->usb_send_dec_bytes		=	0;
	stat->usb_send_enc_bytes		=	0;
	stat->usb_fail_send_packets		=	0;
	stat->usb_generate_send_bytes	=	0;
}

void print_stat(char begin, struct statistic_data *stat, FILE *file) {
	struct timeval tmp_time;

	if(begin==1) {
		fprintf(file, "time\t\t\trxFailP\trxP\trxEnc\trxDec\ttxFailP\ttxP\ttxEnc\ttxDec\ttxGenBytes\n");
		fflush(file);
	} else {
		gettimeofday(&tmp_time, 0);
		fprintf(file, "%d.%.6d:\t%ld\t%ld\t%ld\t%ld\t%ld\t%ld\t%ld\t%ld\t%ld\n", tmp_time.tv_sec, tmp_time.tv_usec
				, stat->usb_fail_recive_packets, stat->usb_recive_packets, stat->usb_recive_enc_bytes, stat->usb_recive_dec_bytes
				, stat->usb_fail_send_packets, stat->usb_send_packets, stat->usb_send_enc_bytes, stat->usb_send_dec_bytes
				, stat->usb_generate_send_bytes );
		fflush(file);
	}
}

int create_dev( struct parameter *pCMDValue, struct device_data** pDevList, unsigned int* pDevSize ) {
	unsigned int j=0;
	struct device_data* device_list;
	
	*pDevList = (struct device_data*) calloc ( pCMDValue->device_list_size +1, sizeof(struct device_data) );
	*pDevSize = pCMDValue->device_list_size;
	device_list = *pDevList;

	for(j=0; j<pCMDValue->device_list_size; j++) {
		device_list[j].index = j;
		
		sprintf(device_list[j].device_name, "/dev/ttyACM%d\0", pCMDValue->device_list[j] );

		device_list[j].rx_running = 1;
		device_list[j].tx_running = 1;
		
		device_list[j].fd = open_obd_serial( device_list[j].device_name );
		if ( device_list[j].fd == -1 ) exit(-2);

		device_list[j].sendPort   = PORT_BEGIN+j*2;
		device_list[j].recivePort = PORT_BEGIN+j*2+1;

		printf("open socket(localhost, %d, %d)\n", device_list[j].sendPort, device_list[j].recivePort );
		device_list[j].con = open_socket_connection("localhost", device_list[j].sendPort, device_list[j].recivePort );
		
		char filename[120];
		
		int i;
		int l = strlen(device_list[j].device_name);
		
		for(i=l; i>=0 && device_list[j].device_name[i-1]!='/'; i-- )  ;

		sprintf(filename,"%s%s", pCMDValue->path, device_list[j].device_name+i);
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
		
		// statistic initialisieren
		reset_stat( &device_list[j].stat_data );

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

		device_list[j].threadResult = pthread_create(  &(device_list[j].writeOBdThread )
									     ,  (pthread_attr_t*)NULL
									     ,(void *)&write_to_obd_thread
									     ,(void*)&device_list[j]);

		// WICHTIG ab hier sollten keine �nderungen mehr an device_list[j] gemacht werden.
	}
	return 0;
}
static struct input_parameter inp;

void exit_function(struct device_data* device_list, unsigned int device_list_size ) {
	struct device_data* dev = device_list;
	unsigned int i;
	char buffer[100];

	// stopping firmware sending
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;
	p_hwh->start=0;
	p_hwh->length=5;
	p_hwh->type=MONITOR_INPUT;
	p_hwh->reserved=0xFF;

	// send to all devices
	inp.pCMDValue->exit_time = time(0)+1;
	memcpy(buffer+sizeof(OBD2HW_Header), "t255\n", 5);
	putDataToUSBChannel(inp.device_list+default_index,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );

	sleep(1);

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

static struct device_data *device_list;
static unsigned int device_list_size;

void signal_callback_handler(int signum) {
	exit_function( device_list, pCMDValue.device_list_size );
}

int main( int argc, char **argv) {
	struct device_data* dev;
	unsigned int i=0;
	pthread_t inputThread;
	void* inputJoin;
	srand ( time(NULL) );

	// Register signal and signal handler
	signal(SIGINT, signal_callback_handler);
	signal(SIGTERM, signal_callback_handler);

	parameter_init( &pCMDValue );
	
	pCMDValue.packet_intervall =  floor( (1000000.0*pCMDValue.packet_size)/pCMDValue.bytes_per_intervall );
	if( argc==1 || processParameter(argc-1,argv+1, plist, &pCMDValue)!=0 ) {
		int i;
		printf("Help for %s\n\n", argv[0] );
		for(i=0; i<plist.size; i++) {
			printf("%s%s\n", plist.func_list[i].param, plist.func_list[i].help);
		}

		return -1;
	}

	// create device
	create_dev( &pCMDValue, &device_list, &device_list_size); //, device_list, device_list_size );
	dev = device_list;

	// Input-Thread
	inp.device_list = device_list;
	inp.device_list_size = pCMDValue.device_list_size;
	inp.pCMDValue = &pCMDValue;
	pthread_create(  &inputThread,  (pthread_attr_t*)NULL, (void *)&input_function, &inp);

	while(TRUE) {
		if(pCMDValue.exit_time>0 && pCMDValue.exit_time<time(0)) {
//			for(i=0; i<device_list_size; i++) {
//				pthread_join(dev->txThread,&dev->txThreadJoin);
//				pthread_join(dev->rxThread,&dev->rxThreadJoin);
//				pthread_join(dev->usbReadThread,&dev->usbThreadJoin);
//				pthread_join(dev->clickReadThread,&dev->clickReadThreadJoin);
//				dev++;
//			}
			break;
		}
	}
	printf("exit finish!\n");
	
	exit_function( device_list, pCMDValue.device_list_size );
	
	return(0);
}
