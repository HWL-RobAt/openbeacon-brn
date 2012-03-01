#include "parameter.h"
#include <pthread.h>

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_communication.h"

void read_from_click_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int ret = 0, j;
	unsigned char buff[4] = {0, 0, 0, 0};
	unsigned long rfc_sleep_time = THREAD_SLEEP_TIME;

	while(1) {
		if(pCMDValue.exit_time>0 && pCMDValue.exit_time<time(0)) break;

		if(ret==0) {
			ret =  recv_from_peer(dev->con, (char*)dev->click_read_tmp_buffer, 100);
			if(ret<0) ret = 0;
		} else {
			pthread_mutex_lock(&dev->click_read_mutex);
				if(10000-dev->click_read_buffer_length>ret ) {
					memcpy(dev->click_read_buffer+dev->click_read_buffer_length, dev->click_read_tmp_buffer, ret);
					dev->click_read_buffer_length +=ret;
					ret=0;
					rfc_sleep_time = THREAD_SLEEP_TIME;
				}
			pthread_mutex_unlock(&dev->click_read_mutex);
		}

		usleep( rfc_sleep_time );
		if(rfc_sleep_time<THREAD_MAX_SLEEP_TIME) rfc_sleep_time += rfc_sleep_time;
	}
	printf("exit: click read\n");
	pthread_exit(p);
}
