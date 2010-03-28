#include "debug.h"

/* Standard includes. */
#include <stdio.h>
#include <string.h>

#include "usbshell.h"
#include <FreeRTOS.h>
#include <board.h>
#include <task.h>
#include <semphr.h>
#include <beacontypes.h>
#include "openbeacon.h"
#include "env.h"
#include "USB-CDC.h"
#include "usbshell.h"
#include "main.h"

void printDebug(unsigned char* packet, char* msg) {
        struct packet_header *ph = (struct packet_header *) &packet;
        ph->type    = DEBUG_PRINT;
        ph->high_length = 0;

        sprintf((portCHAR*)(packet+sizeof(struct packet_header) + 3), msg);
        ph->low_length = strlen( (portCHAR*)(packet+sizeof(struct packet_header) + 3) ) + 3 + 1;

        usb_send_buffer_zero_copy(packet, ph->low_length+sizeof(struct packet_header), NULL, NULL, portMAX_DELAY);
}

