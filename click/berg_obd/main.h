#ifndef MAIN_h
#define MAIN_h

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

struct statistic_data {
	unsigned long usb_recive_packets;
	unsigned long usb_recive_enc_bytes;
	unsigned long usb_recive_dec_bytes;
	unsigned long usb_fail_recive_packets;

	unsigned long usb_send_packets;
	unsigned long usb_send_enc_bytes;
	unsigned long usb_send_dec_bytes;
	unsigned long usb_fail_send_packets;

	unsigned long usb_generate_send_bytes;
};

void reset_stat(struct statistic_data *stat);
void print_stat(char begin, struct statistic_data *stat, FILE *file);

extern struct device_data *device_list;
extern unsigned int device_list_size;

#endif
