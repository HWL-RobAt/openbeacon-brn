#ifndef USBSHELL_h
#define USBSHELL_h

#include "parameter.h"

struct input_parameter {
	struct parameter* pCMDValue;
	struct device_data * device_list;
	unsigned int device_list_size;
};

int input_function(void *p);


#endif
