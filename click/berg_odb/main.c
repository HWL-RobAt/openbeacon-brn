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
#include "usbpacket/usbpacket.h"
#include "tools/commandline.h"

#define BUFFERSIZE 2048

void *tx_from_click_to_ob_thread(void *p);
void *rx_from_ob_to_click_thread(void *p);

struct device_data {
	char* device_name;
	int rx_running;
	int tx_running;
	int fd;
	struct socket_connection *con;
	
	pthread_t rxThread,txThread;
	int threadResult;
	void *rxThreadJoin,*txThreadJoin;

	int sendPort, recivePort;
};

struct device_data * device_list;
int begin_ports = 20000;

pthread_mutex_t thread_read_lock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t thread_write_lock = PTHREAD_MUTEX_INITIALIZER;

// create information for usb-devices 
int use_dev(int argc, char** argv) { 
	int j=0;
	
	if(argc==0) return -1;

	device_list = (struct device_data*) calloc ( argc+1, sizeof(struct device_data) );

	for(j=0; j<argc; j++) {
		device_list[j].device_name = argv[j];
		device_list[j].rx_running = 1;
		device_list[j].tx_running = 1;
		
		// TODO: check valid device_name
		device_list[j].fd = open_obd_serial( device_list[j].device_name );
		if ( device_list[j].fd == -1 ) exit(-2);

		device_list[j].sendPort   = begin_ports+j*2;    // port for send to click 
		device_list[j].recivePort = begin_ports+j*2+1;  // port for revive from click

		printf("open socket(localhost, %d, %d)\n", device_list[j].sendPort, device_list[j].recivePort );
		device_list[j].con = open_socket_connection("localhost", device_list[j].sendPort, device_list[j].recivePort );
		
		device_list[j].threadResult = pthread_create(  &(device_list[j].rxThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&rx_from_ob_to_click_thread  // function for ob to click
							     ,(void*)&device_list[j]); //use last arg (pointer) for arguments for thread

		device_list[j].threadResult = pthread_create(  &(device_list[j].txThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&tx_from_click_to_ob_thread  // function for click_to_ob
							     ,(void*)&device_list[j]);
	}
	return 0;
}
int use_help(int argc, char** argv) { return -1; }

static struct param2func pam[2] = {	  {"-d",  use_dev, "[DEVICE1] [DEVICE2] ... [DEVICEn] - USB Device for OpenBeacon HW\n" }
					, {"--help",  use_help, "print this help text\n" } };
static struct hListe plist = { (int)sizeof(pam)/sizeof(struct param2func), (struct param2func *)&pam };

void *tx_from_click_to_ob_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	int readbytes,i;
	char buffer[BUFFERSIZE];
	int index = 0;
	struct packet_header *ph = (struct packet_header *)buffer;

	while( dev->tx_running == 1 ) {
		readbytes = recv_from_peer(dev->con, &buffer[sizeof(struct packet_header)], BUFFERSIZE - sizeof(struct packet_header));  //read header
	         
		printf("THREAD: %s|%d [SOCKET: Read %d Bytes: ",dev->device_name, dev->recivePort, readbytes); 
		for ( i = 0; i < readbytes; i++) printf("%d ",buffer[sizeof(struct packet_header) + i]); 
		printf("]\n");

		ph->type = PACKET_DATA;
		ph->length = readbytes;
		write_obd_serial(dev->fd, buffer, ph->length + sizeof(struct packet_header));
	}

	pthread_exit(NULL);
}

void *rx_from_ob_to_click_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;

	int readbytes = 1;
	char buffer[BUFFERSIZE];
	int index = 0;
	struct packet_header *ph = NULL;
	int i;

	while( dev->rx_running == 1 ) {
		if ( ph == NULL ) { 
			if ( readbytes > 0 ) printf("THREAD: %s [Serial: Wait for new frame]\n", dev->device_name);
			readbytes = read_obd_serial(dev->fd, &buffer[index], sizeof(struct packet_header) - index);  //read header
      
			if ( readbytes > 0 ) {
				printf("THREAD: %s|%d [IFrame: Read %d Bytes: ",dev->device_name, dev->sendPort, readbytes);
				for ( i = 0; i < readbytes; i++) printf("%d ",buffer[index + i]); 
				printf("]\n");
      
				index += readbytes;
				if ( index == sizeof(struct packet_header) ) {
					ph = (struct packet_header *)buffer;
					if(ph->length==0) ph=NULL;
				}
			}
		} else {
			readbytes = read_obd_serial(dev->fd, &buffer[index], (ph->length - index + sizeof(struct packet_header)));
      
			if ( readbytes > 0 ) {
				index+=readbytes;
      
				if ( index == (ph->length + sizeof(struct packet_header)) ) {
					if ( ph->type == PACKET_DATA ) {
						// print packet
						
						printf("THREAD: %s|%d [DFRAME: Read %d Bytes: ",dev->device_name, dev->sendPort, readbytes);
						for ( i = 0; i < readbytes; i++) printf("%d ",buffer[sizeof(struct packet_header) + i]); 
						printf("]\n");

						send_to_peer(dev->con, &buffer[sizeof(struct packet_header)], ph->length);
					} else if ( ph->type == DEBUG_PRINT ) {
						// print debug infos
						buffer[sizeof(struct packet_header) + ph->length] = 0;                                                                                                                                                 // überspringen der Optionen  evtl. späteres Packetformat verbessern
						printf("THREAD: %s|%d [DebugFRAME: Read %d Bytes: %s\n",dev->device_name, dev->sendPort, index, &(buffer[sizeof(struct packet_header) + 3 ] ));
					}	
					index = 0;  
					ph = NULL;
				}
			}	
		}
	}
  
	pthread_exit(NULL);
}

int exit_function() {
	struct device_data* dev = device_list;

	while(dev!=0) {
		printf("closing connection to %s\n", dev->device_name);
		close_connection(dev->con);
		close_obd_serial(dev->fd);
		dev++;
	}
}

int main( int argc, char **argv) {
	struct device_data* dev;

	if( argc==1 || processParameter(argc-1,argv+1, plist)!=0 ) {
		int i;
		printf("Help for %s\n\n", argv[0] );
		for(i=0; i<plist.size; i++) {
			printf("%s\t-\t%s\n", plist.func_list[i].param, plist.func_list[i].help);
		}

		return -1;
	}

	// start all threads
	dev = device_list;
	  
	while(dev->device_name!=NULL) {
		printf("\tprocess thread: %s\n", dev->device_name);
		pthread_join(dev->rxThread,&dev->rxThreadJoin);
		pthread_join(dev->txThread,&dev->txThreadJoin);
		dev++;
	}

	return(0);
}
