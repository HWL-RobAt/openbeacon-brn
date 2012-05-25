#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "../socket/obd_socket.h"
#include "../parameter.h"
#include "commandline.h"

int main( int argc, char **argv) {
	int i;

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

	struct socket_connection *config;
	config = (struct socket_connection *)open_socket_connection("localhost", PORT_CONFIG+1, PORT_CONFIG );
	char buffer[1000];

	if( config<=0 ) return -1;

	for(i=0; i<20; i++) {
		usleep(10);
		// sende die Parameter zum obd-mips
		#define SLEEP_PARM 100

		if( pCMDValue.status&PARAM_SET_WIRELESS_CHANNEL ) {
			sprintf(buffer, "c%d\n", pCMDValue.wireless_channel );
			send_to_peer(config, buffer,  strlen(buffer) );
			usleep(SLEEP_PARM);
//			printf("* Config Channel\n");
		}

		if( pCMDValue.status&PARAM_SET_WIRELESS_POWER ) {
			sprintf(buffer, "p%d\n", pCMDValue.wireless_power );
			send_to_peer(config, buffer,  strlen(buffer) );
			usleep(SLEEP_PARM);
//			printf("* Config Power\n");
		}
		if( pCMDValue.status&PARAM_SET_WIRELESS_RATE ) {
			sprintf(buffer, "r%d\n", pCMDValue.wireless_rate );
			send_to_peer(config, buffer,  strlen(buffer) );
			usleep(SLEEP_PARM);
//			printf("* Config Bitrate\n");
		}

		if( pCMDValue.status&PARAM_SET_PATH ) {
			sprintf(buffer, "k%s\n", pCMDValue.path );
			send_to_peer(config, buffer,  strlen(buffer) );
			usleep(SLEEP_PARM);
//			printf("* Config Path\n");
		}

		if( pCMDValue.status&PARAM_SET_HWSENDRATE ) {
			sprintf(buffer, "t%d\n", pCMDValue.hw_send_rate );
			send_to_peer(config, buffer,  strlen(buffer) );
			usleep(SLEEP_PARM);
//			printf("* Config HW Send Rate\n");
		}
	}
}
