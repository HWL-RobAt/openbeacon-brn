
#include <pthread.h>
#include "usbshell.h"
#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_communication.h"

unsigned int default_index=0;

#define SEND_CONFIG( type, z )  		if(type!=0) { \
											buffer[ sizeof(OBD2HW_Header) ] = z; \
											sprintf(buffer+sizeof(OBD2HW_Header)+1, "%d\n", type); \
											p_hwh->length = strlen( buffer+sizeof(OBD2HW_Header) ); \
											while(putDataToUSBChannel(inp->device_list+dev_num,  buffer, sizeof(OBD2HW_Header)+p_hwh->length )!=STATUS_OK) usleep( 10 ); \
											usleep( 2000 ); \
										}

int input_function(void *p) {
	struct input_parameter *inp = (struct input_parameter*)p;

	char buffer[100];
	unsigned char len = 0;
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;
	unsigned int dev_num;

	p_hwh->start=0;
	p_hwh->length=0;
	p_hwh->type=MONITOR_INPUT;
	p_hwh->reserved=0xFF;

	// Absetzen der initialen Parameter
	// behandle es als virtuelle shell eingabe (so könnten auch .config später umgesetzt werden)

	for(dev_num=0; dev_num<inp->device_list_size; dev_num++) {
		// konfiguriere Kanal
		SEND_CONFIG( inp->pCMDValue->wireless_channel, 'c' )

		// konfiguriere Power
		SEND_CONFIG( inp->pCMDValue->wireless_power, 'p' )

		// konfiguriere Rate
		SEND_CONFIG( inp->pCMDValue->wireless_rate, 'r' )

		// konfiguriere Datenrate
		SEND_CONFIG( inp->pCMDValue->hw_send_rate, 't' )
	}

	while(1) {
		if(inp->pCMDValue->exit_time>0 && inp->pCMDValue->exit_time<time(0) ) {
			break;
		}
		if( pCMDValue.use_daemon!=1 ) {
			while( (buffer[sizeof(OBD2HW_Header)+len]=getchar())!='\n' ) len++;

			switch( buffer[sizeof(OBD2HW_Header) ] ) {
				case '\n':  break;
				case 'd':
						dev_num = atoi( buffer+sizeof(OBD2HW_Header)+1);

						if(dev_num>=0 && dev_num<inp->device_list_size && default_index != dev_num) {
							default_index = dev_num;
							printf("switch device to: %d\n", default_index);
						}

						break;
				case 'x':
						// send to all devices
						inp->pCMDValue->exit_time = time(0)+2;
						break;
				default:
						p_hwh->length = len;
						putDataToUSBChannel(inp->device_list+default_index,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
						break;
			}
			len=0;
			// feste Schlafenszeit festlegen, um ressourcen zu schonen
			usleep( INPUT_THREAD_SLEEP_TIME );
		} else {
			sleep(1);
		}
	}
	printf("exit: input\n");
	pthread_exit(p);
}
