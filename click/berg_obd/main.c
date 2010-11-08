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

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_comunication.h"
#include "tools/commandline.h"

#define BUFFERSIZE 2048

portCHAR b0[ USBCHANNEL_BUFFER_SIZE ], b1[ USBCHANNEL_BUFFER_SIZE ], b2[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b3[ USBCHANNEL_BUFFER_SIZE ], b4[ USBCHANNEL_BUFFER_SIZE ], b5[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b6[ USBCHANNEL_BUFFER_SIZE ], b7[ USBCHANNEL_BUFFER_SIZE ], b8[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b9[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b10[ USBCHANNEL_BUFFER_SIZE ], b11[ USBCHANNEL_BUFFER_SIZE ], b12[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b13[ USBCHANNEL_BUFFER_SIZE ], b14[ USBCHANNEL_BUFFER_SIZE ], b15[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b16[ USBCHANNEL_BUFFER_SIZE ], b17[ USBCHANNEL_BUFFER_SIZE ], b18[ USBCHANNEL_BUFFER_SIZE ];
portCHAR b19[ USBCHANNEL_BUFFER_SIZE ];

portCHAR t0[ 150 ], t1[ 150 ], t2[ 150 ];
portCHAR t3[ 150 ], t4[ 150 ], t5[ 150 ];
portCHAR t6[ 150 ], t7[ 150 ], t8[ 150 ];
portCHAR t9[ 150 ];


static_buffer_info sbi_dev[10] = {	
							 { b0, 0, b10, 0, t0, 0  }
							,{ b1, 0, b11, 0, t1, 0  }
							,{ b2, 0, b12, 0, t2, 0  }
							,{ b3, 0, b13, 0, t3, 0  }
							,{ b4, 0, b14, 0, t4, 0  }
							,{ b5, 0, b15, 0, t5, 0  }
							,{ b6, 0, b16, 0, t6, 0  }
							,{ b7, 0, b17, 0, t7, 0  }
							,{ b8, 0, b18, 0, t8, 0  }
							,{ b9, 0, b19, 0, t9, 0  }
						};

unsigned int write_to_channel( portCHAR* out, portLONG len, int device ) {
	return write_obd_serial( device, (char*)out, len );
}

unsigned int  read_to_channel( portCHAR* out, portLONG len, int device ) {
	return read_obd_serial(device, (char*)out, len );
}

void *tx_from_click_to_ob_thread(void *p);
void *rx_from_ob_to_click_thread(void *p);

struct device_data {
	char device_name[50];
	
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

// create information for usb-devices 
int use_dev(int argc, char** argv) { 
	unsigned int j=0;
	
	if(argc==0) return -1;

	device_list = (struct device_data*) calloc ( argc+1, sizeof(struct device_data) );
	device_list_size = argc;

	for(j=0; j<argc; j++) {
		sprintf(device_list[j].device_name, "/dev/ttyACM%s\0", argv[j] );

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

static struct param2func pam[2] = {	  {"-d",  use_dev, "[DEVICE1] [DEVICE2] ... [DEVICEn] - USB Device for OpenBeacon HW\nsample: berg_odb -d 0 1 - for device ttyACM0 und ttyACM1\n" }
					, {"--help",  use_help, "print this help text\n" } };
static struct hListe plist = { (int)sizeof(pam)/sizeof(struct param2func), (struct param2func *)&pam };

void *tx_from_click_to_ob_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	int readbytes,i;
	int index = 0;
	
	StrukturBuffer usb_buffer;
	OBD2HW_Header *ph = (OBD2HW_Header *)usb_buffer.buffer;

	while( dev->tx_running == 1 ) {
		// Read
		readbytes = recv_from_peer(dev->con, usb_buffer.buffer+sizeof(OBD2HW_Header), sizeof(usb_buffer.buffer) - sizeof(OBD2HW_Header));  //read header
		usb_buffer.length = readbytes+sizeof(OBD2HW_Header);
	         
		// DEBUG:
		fprintf(dev->output_file, "[SOCKET: Read %d Bytes: ", readbytes); 
		for ( i = 0; i < readbytes; i++) fprintf(dev->output_file, "%d ",usb_buffer.buffer[sizeof(OBD2HW_Header) + i]); 		
		fprintf(dev->output_file, "]\n");
		fflush(dev->output_file);
		
		// Send
		ph->type = PACKET_DATA;
		ph->length   = readbytes;
		putDataToUSBChannel(dev->fd,  usb_buffer.buffer, usb_buffer.length );
	}

	pthread_exit(NULL);
}
void debug_msg(char* msg, unsigned portCHAR msg_len) {
	int i;
		
	for(i=0; i<msg_len; i++) {
//		printf("%c", msg[i] );
	}
//	printf("\n");
}
void debug_hex_msg(char* msg, unsigned portCHAR msg_len) {
	int i;
		
	for(i=0; i<msg_len; i++) {
		if(i%2==0) printf("%.2X", msg[i] );
		else printf("%.2X ", msg[i] );
	}
	
	printf("\n");
}

void *rx_from_ob_to_click_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	StrukturBuffer usb_buffer;
	OBD2HW_Header *ph = NULL;
	int i;
	
	while( dev->rx_running == 1 ) {
		usb_buffer.length = STRUKTUR_BUFFER_MAX_LENGTH;
		if( getDataFromUSBChannel(dev->fd, usb_buffer.buffer, &usb_buffer.length) != STATUS_OK ) continue;

		ph = (OBD2HW_Header *)usb_buffer.buffer;
		if ( ph->type == PACKET_DATA ) {				
			fprintf(dev->output_file, "[DFrame: Read %d Bytes: ", usb_buffer.length);
			for ( i = 0; i < usb_buffer.length; i++) fprintf(dev->output_file, "%d ",usb_buffer.buffer[sizeof(OBD2HW_Header) + i]); 
			fprintf(dev->output_file, "]\n");
			fflush(dev->output_file);
			send_to_peer(dev->con, &usb_buffer.buffer[ sizeof(OBD2HW_Header) ], ph->length);
		} else if ( ph->type == DEBUG_PRINT ) { // überspringen der Optionen  evtl. späteres Packetformat verbessern
			usb_buffer.buffer[sizeof(OBD2HW_Header) + ph->length] = 0;
			fprintf(dev->output_file, "[Debug: Read %d Bytes: %s\n", usb_buffer.length, &(usb_buffer.buffer[ sizeof(OBD2HW_Header) ] ));
			fflush(dev->output_file);
		}else if ( ph->type == MONITOR_HEX_PRINT ) { 
			printf("MONITOR_HEX_PRINT:\n\t");
			usb_buffer.buffer[sizeof(OBD2HW_Header) + ph->length] = 0;
			debug_hex_msg(&(usb_buffer.buffer[ sizeof(OBD2HW_Header) + sizeof(Click2OBD_header) - OPENBEACON_MACSIZE] ), usb_buffer.length-sizeof(OBD2HW_Header)-sizeof(Click2OBD_header)+OPENBEACON_MACSIZE );
			fflush(stdout);
		}else if ( ph->type == MONITOR_PRINT ) {
			// print monitor prints
			usb_buffer.buffer[sizeof(OBD2HW_Header) + ph->length ] = 0;
			
			for(i=0; i<ph->length; i++) {
				printf("%c", usb_buffer.buffer[sizeof(OBD2HW_Header) + i]);
				if(usb_buffer.buffer[sizeof(OBD2HW_Header) + i] =='\r') {
					printf("%s#\t\t", dev->device_name );
				}
				fflush(stdout);
			}
		} else {
			printf("BUFFER(%d):\n", usb_buffer.length);
			debug_hex_msg(usb_buffer.buffer, usb_buffer.length);
		}		
	}  
	pthread_exit(NULL);
}

void *input_thread(void *p) 
{
	unsigned int input_exit = 0;
	int ch, i;
	char buffer[BUFFERSIZE];
	OBD2HW_Header *ph = (OBD2HW_Header *)buffer;
	
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
				ph->length   = 1;
				
				buffer[ sizeof(OBD2HW_Header) ] = ch;
				for(i=1; i<10; i++) {
					ch = getchar();
					if(ch=='\r' || ch=='\n') {
						printf("\n%s#\t\t", device_list[ InOut_Device_id ].device_name);
						break;
					}

					buffer[ sizeof(OBD2HW_Header)+i ] = ch;
					ph->length++;
				}
				putDataToUSBChannel(device_list[ InOut_Device_id ].fd,  buffer, ph->length+sizeof(OBD2HW_Header) );
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
