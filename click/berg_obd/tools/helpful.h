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

unsigned long time_diff(struct timeval v1, struct timeval v2) {
	if(v1.tv_sec>= v2.tv_sec) {
		return (v1.tv_sec-v2.tv_sec)*1000000+(v1.tv_usec-v2.tv_usec);
	}
	return (v2.tv_sec-v1.tv_sec)*1000000+(v2.tv_usec-v1.tv_usec);
}


#endif
