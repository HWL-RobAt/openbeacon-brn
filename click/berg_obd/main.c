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
	FILE * output_file;
};

struct device_data * device_list;
unsigned int device_list_size;

int begin_ports = 20000;
unsigned int InOut_Device_id;

// pthread_mutex_t thread_read_lock = PTHREAD_MUTEX_INITIALIZER;
// pthread_mutex_t thread_write_lock = PTHREAD_MUTEX_INITIALIZER;

// create information for usb-devices 
int use_dev(int argc, char** argv) { 
	unsigned int j=0;
	
	if(argc==0) return -1;

	device_list = (struct device_data*) calloc ( argc+1, sizeof(struct device_data) );
	device_list_size = argc;

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
		
		char filename[20];
		int i;
		int l = strlen(device_list[j].device_name);
		
		for(i=l; i>=0 && device_list[j].device_name[i-1]!='/'; i-- )  ;
		strncpy(filename, device_list[j].device_name+i, l-i);
		strncpy(filename+(l-i), ".log", 5);
		
		device_list[j].output_file = NULL;
		device_list[j].output_file = fopen(filename, "a");
		
		if(device_list[j].output_file==NULL) {
			printf("%s konte nicht zum schreiben geöffnet werden\n", filename);
			exit(-1);
		}
		printf("%s wurde zum schreiben erstellt\n", filename);
		
		device_list[j].threadResult = pthread_create(  &(device_list[j].rxThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&rx_from_ob_to_click_thread  // function for ob to click
							     ,(void*)&device_list[j]); //use last arg (pointer) for arguments for thread

		device_list[j].threadResult = pthread_create(  &(device_list[j].txThread)
							     ,  (pthread_attr_t*)NULL
							     ,(void *)&tx_from_click_to_ob_thread  // function for click_to_ob
							     ,(void*)&device_list[j]);

		// WICHTIG ab hier sollten keine änderungen mehr an device_list[j] gemacht werden.
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
	         
		fprintf(dev->output_file, "[SOCKET: Read %d Bytes: ", readbytes); 
		for ( i = 0; i < readbytes; i++) fprintf(dev->output_file, "%d ",buffer[sizeof(struct packet_header) + i]); 		
		fprintf(dev->output_file, "]\n");
		fflush(dev->output_file);

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
	char print_msg[255];
	
	while( dev->rx_running == 1 ) {
		// Empfangsbereitschaft signalisieren
		
		if ( ph == NULL ) { 
			if ( readbytes > 0 ) fprintf(dev->output_file, "[Serial: Wait for new frame]\n");
			readbytes = read_obd_serial(dev->fd, &buffer[index], sizeof(struct packet_header) - index);  //read header
      
			if ( readbytes > 0 ) {
				// for(i=0; i<readbytes; i++) printf("%d", buffer[index+i]);
								
				fprintf(dev->output_file, "[IFrame: Read %d Bytes: ", readbytes);
				for ( i = 0; i < readbytes; i++) fprintf(dev->output_file, "%d ",buffer[index + i]); 
				fprintf(dev->output_file, "]\n");
				fflush(dev->output_file);
				
				index += readbytes;
				if ( index == sizeof(struct packet_header) ) {
					ph = (struct packet_header *)buffer;
					
					if(ph->length==0) ph=NULL;
				}
			}
		} else {
			// Später grössere Datenmengen verarbeiten können
			unsigned int len = ph->length - index + sizeof(struct packet_header);
			if(len>BUFFERSIZE-index) len = BUFFERSIZE-index;
			
			readbytes = read_obd_serial(dev->fd, &buffer[index], len);
      
			if ( readbytes > 0 ) {				
				index+=readbytes;
      
				if ( index == (ph->length + sizeof(struct packet_header)) ) {
					if ( ph->type == PACKET_DATA ) {				
						fprintf(dev->output_file, "[DFrame: Read %d Bytes: ", readbytes);
						for ( i = 0; i < readbytes; i++) fprintf(dev->output_file, "%d ",buffer[sizeof(struct packet_header) + i]); 
						fprintf(dev->output_file, "]\n");
						fflush(dev->output_file);

						send_to_peer(dev->con, &buffer[sizeof(struct packet_header)], ph->length);
					} else if ( ph->type == DEBUG_PRINT ) { // überspringen der Optionen  evtl. späteres Packetformat verbessern
						buffer[sizeof(struct packet_header) + ph->length] = 0;
						fprintf(dev->output_file, "[Debug: Read %d Bytes: %s\n", index, &(buffer[sizeof(struct packet_header) ] ));
						fflush(dev->output_file);
					}else if ( ph->type == MONITOR_PRINT ) {
						// print monitor prints
						unsigned int pos = 0;
						unsigned int hlen = 0;
						
						buffer[sizeof(struct packet_header) + ph->length ] = 0;
						for(pos=0; pos<ph->length; pos++) {
							printf("%c", buffer[sizeof(struct packet_header) + pos]);
							if(buffer[sizeof(struct packet_header) + pos] =='\r') {
								printf("%s#\t\t", dev->device_name );
							}
							fflush(stdout);
						}
					} else {
						printf("BUFFER:\n");
						for(i=0; i<BUFFERSIZE; i++) printf("%d ", buffer[i]);
						printf("\n");
					}						
					index = 0;  
					ph = NULL;
				}
			}	
		}
	}
  
	pthread_exit(NULL);
}

void *input_thread(void *p) 
{
	unsigned int input_exit = 0;
	int ch, i;
	char buffer[BUFFERSIZE];
	struct packet_header *ph = (struct packet_header *)buffer;
	
	while( input_exit==0 ) {
			ch = getchar();
			
			if(ch=='x') {  // exit the Programm
				exit(0);
			} else if(ch=='d') {
				ch = getchar();
				// switch to device
				
				if(ch-'0'<device_list_size) {
					InOut_Device_id = ch-'0';
				}
			} else if(ch=='\n') { 
				printf("\n%s#\t\t", device_list[ InOut_Device_id ].device_name);
			} else {
				// send to OB-HW 
				ph->type    = MONITOR_INPUT;
				ph->length = 1;
				
				buffer[ sizeof(struct packet_header) ] = ch;
				for(i=1; i<10; i++) {
					ch = getchar();
					if(ch=='\r' || ch=='\n') {
						printf("\n%s#\t\t", device_list[ InOut_Device_id ].device_name);
						break;
					}

					buffer[ sizeof(struct packet_header)+i ] = ch;
					ph->length++;
				}
							
				write_obd_serial( device_list[ InOut_Device_id ].fd, buffer, ph->length + sizeof(struct packet_header) );
			}
	}
}

int exit_function() {
	struct device_data* dev = device_list;

	while(dev!=0) {
		printf("closing connection to %s\n", dev->device_name);
		close_connection(dev->con);
		close_obd_serial(dev->fd);
		fclose(dev->output_file);
		dev++;
	}
}

// Thread für Input erstellen und die Eingaben als Nachrichten zur HW schicken
// Ausgaben von der HW nicht in die Log drucken, sondern auf den Bildschirm ausgeben
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
	
	// start input handler
	pthread_t inThread;
	void *inThreadJoin;
	int threadResult = pthread_create(  &inThread,  (pthread_attr_t*)NULL,(void *)&input_thread, NULL); 
	pthread_join(inThread,&inThreadJoin);
	
	// start all threads
	dev = device_list;
	InOut_Device_id = 0;  

	printf("\n%s#\t\t", device_list[ 0 ].device_name);
	fflush(stdout);
	
	while(dev->device_name!=NULL) {
		pthread_join(dev->rxThread,&dev->rxThreadJoin);
		pthread_join(dev->txThread,&dev->txThreadJoin);
		dev++;
	}

	return(0);
}
