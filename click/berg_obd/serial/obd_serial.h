#include <termios.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/signal.h>
#include <sys/types.h>

#define BAUDRATE B460800
#define MODEMDEVICE "/dev/ttyACM0"
#define _POSIX_SOURCE 1 /* POSIX compliant source */

int open_obd_serial(char *device);
int close_obd_serial(int fd);
int write_obd_serial(int fd, char *buffer, int size);
int read_obd_serial(int fd, char *buffer, int size);
