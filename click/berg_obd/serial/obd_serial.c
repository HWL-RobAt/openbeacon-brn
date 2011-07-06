#include <termios.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/signal.h>
#include <sys/types.h>

#include "obd_serial.h"

void signal_handler_IO (int status)
{
}

int open_obd_serial(char *device) {
  int fd;
  struct termios oldtio,newtio;
  struct sigaction saio;           /* definition of signal action */
  
  fd = open( device, O_RDWR);
  if (fd <0) {
    perror(device);
    return -1;
  }
  
  /* install the signal handler before making the device asynchronous */
  saio.sa_handler = signal_handler_IO;
//saio.sa_mask = 0;
  saio.sa_flags = 0;
  saio.sa_restorer = NULL;
  sigaction(SIGIO,&saio,NULL);
  
  /* allow the process to receive SIGIO */
  fcntl(fd, F_SETOWN, getpid());

  /* Make the file descriptor asynchronous (the manual page says only O_APPEND and O_NONBLOCK, will work with F_SETFL...) */
  fcntl(fd, F_SETFL, FASYNC);

  tcgetattr(fd,&oldtio); /* save current port settings */

  cfmakeraw(&newtio);
  
   /* set new port settings for canonical input processing */
  newtio.c_iflag = IGNPAR | IGNBRK;
  newtio.c_oflag = IGNPAR | IGNBRK;
  newtio.c_lflag = 0;
  newtio.c_cc[VMIN]=1;
  newtio.c_cc[VTIME]=0;
    	
  cfsetispeed (&newtio, B115200);
  cfsetospeed (&newtio, B115200);

  tcflush(fd, TCIFLUSH);
  tcsetattr(fd,TCSAFLUSH,&newtio);
  
  return fd;
}

int close_obd_serial(int fd) {
  //tcsetattr(fd,TCSANOW,&oldtio);
  close(fd);
  
  return 0;
}

int write_obd_serial(int fd, char *buffer, int size) {
  int ret = write(fd, buffer, size);
  
  if( ret != size ) {
	ret = write(fd, buffer, size);
	if( ret != size ) {
		ret = write(fd, buffer, size);
		if(ret != size) printf("writeodb:  ret(%d), size(%d)\n", ret, size);
	}
  }
  return 0;
}

int read_obd_serial(int fd, char *buffer, int size) {
  int readbytes;
  readbytes = read(fd, buffer, size);
  return readbytes;
}
