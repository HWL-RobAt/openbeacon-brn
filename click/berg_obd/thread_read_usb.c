#include "parameter.h"
#include <pthread.h>

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_communication.h"
#include "main.h"

void read_from_usb_thread(void *p) {
	struct device_data* dev = (struct device_data*)p;
	unsigned int ret = 0, i;
	unsigned char buff[4] = {0, 0, 0, 0};
	unsigned long rfu_sleep_time = THREAD_SLEEP_TIME;

	while(1) {
		if(pCMDValue.exit_time>0 && pCMDValue.exit_time<time(0)) break;

		if(ret==0) {
			ret = read_obd_serial(dev->fd, (char*)dev->usb_read_tmp_buffer, 100 );
			if(ret<0) ret = 0;
		}
		if(ret>0) {
			pthread_mutex_lock(&dev->usb_read_mutex);
				if(10000-dev->usb_read_buffer_length>ret ) {
					memcpy(dev->usb_read_buffer+dev->usb_read_buffer_length, dev->usb_read_tmp_buffer, ret);
					dev->usb_read_buffer_length +=ret;
					ret=0;
					rfu_sleep_time = THREAD_SLEEP_TIME;
				}
			pthread_mutex_unlock(&dev->usb_read_mutex);
		}

		if(rfu_sleep_time>THREAD_SLEEP_TIME) usleep( rfu_sleep_time );
		if(rfu_sleep_time<THREAD_MAX_SLEEP_TIME) rfu_sleep_time += THREAD_SLEEP_TIME;
	}
	printf("exit: usb_read\n");
	pthread_exit(p);
}
