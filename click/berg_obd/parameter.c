#include "parameter.h"

int use_dev(int argc, char** argv, void* data) {
	int j;
	struct parameter* pCMDValue = (struct parameter*)data;

	if(argc==0) return -1;

	pCMDValue->device_list = (int*)malloc( sizeof(int)*argc);

	for(j=0; j<argc; j++) {
		pCMDValue->device_list[j] = atoi( argv[j] );
	}

	pCMDValue->device_list_size = argc;

	return 0;
}

struct parameter pCMDValue;

int use_help(int argc, char** argv, void* data) { return -1; }

int use_exittime(int argc, char** argv, void* data){
	if( argc==1 ) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->exit_time = time(0) + atoi( argv[0] );

		return 0;
	}
	return -1;
}
int use_packetsize(int argc, char** argv, void* data){
	if( argc==1 ) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->packet_size = atoi( argv[0] );
		if( !(pCMDValue->packet_size>=5 && pCMDValue->packet_size<96) ) return -1;
		pCMDValue->status = pCMDValue->status | PARAM_SET_PACKETSIZE;
		return 0;
	}
	return -1;
}
int use_packetintv(int argc, char** argv, void* data){
	if( argc==1 ) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->bytes_per_intervall = atoi(argv[0]);
		pCMDValue->packet_intervall =  floor(1000000/( pCMDValue->bytes_per_intervall/pCMDValue->packet_size ) );
		printf("packet_interval = %ld\n", pCMDValue->packet_intervall);
		pCMDValue->status = pCMDValue->status | PARAM_SET_PACKETINTERVALL;
		return 0;
	}
	return -1;
}
int use_printinterval(int argc, char** argv, void* data){
	if( argc==1 ) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->print_intervall = atoi(argv[0]);
		pCMDValue->status = pCMDValue->status | PARAM_SET_PRINTINTERVALL;
		return 0;
	}
	return -1;
}
int use_random(int argc, char** argv, void* data){
	struct parameter* pCMDValue = (struct parameter*)data;

	pCMDValue->use_rand = 1;
	pCMDValue->status = pCMDValue->status | PARAM_SET_USERAND;
	return 0;
}

int use_generate(int argc, char** argv, void* data){
	struct parameter* pCMDValue = (struct parameter*)data;

	pCMDValue->use_gen = 1;
	pCMDValue->status = pCMDValue->status | PARAM_SET_USEGEN;
	return 0;
}

int use_echo(int argc, char** argv, void* data){
	struct parameter* pCMDValue = (struct parameter*)data;

	pCMDValue->use_ech = 1;
	pCMDValue->status = pCMDValue->status | PARAM_SET_USEECHO;
	return 0;
}
int use_daemon_mode(int argc, char** argv, void* data){
	struct parameter* pCMDValue = (struct parameter*)data;

	pCMDValue->use_daemon = 1;
	pCMDValue->status = pCMDValue->status | PARAM_SET_DEAMON;
	return 0;
}
int set_hw_send_rate(int argc, char** argv, void* data){
	if(argc==1) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->hw_send_rate = atoi(argv[0]);
		pCMDValue->status = pCMDValue->status | PARAM_SET_HWSENDRATE;
		return 0;
	}
	return -1;
}
int set_channel(int argc, char** argv, void* data){
	if(argc==1) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->wireless_channel = atoi(argv[0]);
		pCMDValue->status = pCMDValue->status | PARAM_SET_WIRELESS_CHANNEL;
		return 0;
	}
	return -1;
}
int set_power(int argc, char** argv, void* data){
	if(argc==1) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->wireless_power = atoi(argv[0]);
		pCMDValue->status = pCMDValue->status | PARAM_SET_WIRELESS_POWER;
		return 0;
	}
	return -1;
}
int set_rate(int argc, char** argv, void* data){
	if(argc==1) {
		struct parameter* pCMDValue = (struct parameter*)data;

		pCMDValue->wireless_rate = atoi(argv[0]);
		pCMDValue->status = pCMDValue->status | PARAM_SET_WIRELESS_RATE;
		return 0;
	}
	return -1;
}
int use_path(int argc, char** argv, void* data) {
	if(argc==1) {
		struct parameter* pCMDValue = (struct parameter*)data;

		// TODO: prüfen, ob das verzeichniss existiert
		sprintf(pCMDValue->path, "%s", argv[0]);
		pCMDValue->status = pCMDValue->status | PARAM_SET_PATH;
		return 0;
	}
	return -1;
}
int stop_c2ob(int argc, char** argv, void* data) {
	struct parameter* pCMDValue = (struct parameter*)data;

	pCMDValue->noclick = TRUE;
	pCMDValue->status = pCMDValue->status | PARAM_SET_NOCLICK;
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

struct hListe plist = { (int)sizeof(pam)/sizeof(struct param2func), (struct param2func *)&pam };

void parameter_init( struct parameter *pValue ) {
		pValue->exit_time				=		0;
		pValue->packet_size				=		20;
		pValue->packet_intervall		=		0;
		pValue->print_intervall			=  1000000;
		pValue->bytes_per_intervall		= 	63000;
		pValue->use_rand				= 		0;
		pValue->use_gen					=		0;
		pValue->use_ech					=		0;
		pValue->use_daemon				=		0;
		pValue->hw_send_rate			=	  	0;
		pValue->wireless_channel		=	  	0;
		pValue->wireless_rate			=	  	0;
		pValue->wireless_power			=	  	0;
		memcpy(pValue->default_path, "/tmp/", 6);
		sprintf(pValue->path, "%s", pValue->default_path);
		pValue->noclick					= FALSE;
		pValue->device_list				= NULL;
		pValue->device_list_size		= 0;
		pValue->status					= 0;
}

