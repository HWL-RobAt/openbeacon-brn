#ifndef HELPFUL_h
#define HELPFUL_h

#include "../openbeacon_communication.h"

unsigned long arrayToLong(unsigned char *buff, unsigned char len) {
	int i;
	unsigned long ret=0;

	for(i=len-1; i>=0; i--) {
		ret = ret*256+buff[i];
	}
	return ret;
}

void insertLONG(portCHAR* buffer, long l) {
	char i;
	long tmp = l;

	for(i=0; i<sizeof(long); i++) {
		buffer[i] = tmp%256;
		tmp = tmp/256;
	}
}

long time_diff(struct timeval start, struct timeval end) {
	return (end.tv_sec-start.tv_sec)*1000000+(end.tv_usec-start.tv_usec);
}


#endif
