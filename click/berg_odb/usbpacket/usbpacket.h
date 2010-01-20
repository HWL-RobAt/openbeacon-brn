#include <stdio.h>
#include <stdlib.h>


#define UNKNOWN_DATA 0
#define PACKET_DATA 1
#define CONFIG_DATA 2
#define DEBUG_PRINT 3

struct packet_header {
  uint16_t length;
  uint8_t  type;
  uint8_t  reserved;
} __packed__;
