/*
 * parameter.h
 *
 *  Created on: 27.02.2012
 *      Author: gambit
 */

#ifndef PARAMETER_H_
#define PARAMETER_H_

#include <time.h>
#include "tools/commandline.h"

#define INPUT_THREAD_SLEEP_TIME 	100L
#define THREAD_SLEEP_TIME 			100L
#define THREAD_MAX_SLEEP_TIME	  50000L
#define MAX_GENERATOR_SLEEP_TIME 	300

#define PORT_BEGIN					20000
#define PORT_CONFIG					20100

#define PARAM_SET_PACKETSIZE		  0x0001
#define PARAM_SET_PACKETINTERVALL	  0x0002
#define PARAM_SET_PRINTINTERVALL	  0x0004
#define PARAM_SET_BYTESPERINTERVALL	  0x0008
#define PARAM_SET_USERAND			  0x0010
#define PARAM_SET_USEGEN			  0x0020
#define PARAM_SET_USEECHO			  0x0040
#define PARAM_SET_DEAMON			  0x0080
#define PARAM_SET_HWSENDRATE		  0x0100
#define PARAM_SET_WIRELESS_POWER	  0x0200
#define PARAM_SET_WIRELESS_RATE		  0x0400
#define PARAM_SET_WIRELESS_CHANNEL	  0x0800
#define PARAM_SET_PATH				  0x1000
#define PARAM_SET_NOCLICK			  0x2000

struct parameter {
	time_t exit_time;
	unsigned char packet_size;
	unsigned long packet_intervall;
	unsigned long print_intervall;
	unsigned long bytes_per_intervall;
	char use_rand;
	char use_gen;
	char use_ech;
	char use_daemon;
	unsigned char hw_send_rate;
	unsigned char wireless_channel;
	unsigned char wireless_rate;
	unsigned char wireless_power;
	char default_path[6];
	char path[1000];
	char noclick;

	int* device_list;
	unsigned int device_list_size;
	unsigned int status;
};

void parameter_init( struct parameter *pValue );

extern struct parameter pCMDValue;
extern struct hListe plist;

#endif /* PARAMETER_H_ */
