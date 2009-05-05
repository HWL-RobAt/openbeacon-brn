#include <termios.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/signal.h>
#include <sys/types.h>

//#define BAUDRATE B115200
#define BAUDRATE B460800
#define MODEMDEVICE "/dev/ttyACM0"
#define _POSIX_SOURCE 1 /* POSIX compliant source */
#define FALSE 0
#define TRUE 1

volatile int STOP=FALSE; 

void signal_handler_IO (int status);   /* definition of signal handler */
int wait_flag=TRUE;                    /* TRUE while no signal received */

main() {
	int fd,c, res;
	struct termios oldtio,newtio;
	struct sigaction saio;           /* definition of signal action */
	char buf[5000];

	/* open the device to be non-blocking (read will return immediatly) */
	fd = open(MODEMDEVICE, O_RDWR /*| O_NONBLOCK | O_NDELAY | O_NOCTTY*/);
	if (fd <0) {perror(MODEMDEVICE); exit(-1); }

	/* install the signal handler before making the device asynchronous */
	saio.sa_handler = signal_handler_IO;
//	saio.sa_mask = 0;
	saio.sa_flags = 0;
	saio.sa_restorer = NULL;
	sigaction(SIGIO,&saio,NULL);
	  
	/* allow the process to receive SIGIO */
	fcntl(fd, F_SETOWN, getpid());

	/* Make the file descriptor asynchronous (the manual page says only 
	   O_APPEND and O_NONBLOCK, will work with F_SETFL...) */
	fcntl(fd, F_SETFL, FASYNC);

	tcgetattr(fd,&oldtio); /* save current port settings */
	
	/* set new port settings for canonical input processing */
//	newtio.c_cflag = BAUDRATE | CS8 | CLOCAL | CREAD;//| CRTSCTS ;

	newtio.c_iflag = IGNPAR | IGNBRK; //| ICRNL;
	newtio.c_oflag = IGNPAR | IGNBRK;
	newtio.c_lflag = 0;
	newtio.c_cc[VMIN]=1;
	newtio.c_cc[VTIME]=0;
	
    cfsetispeed (&newtio, B115200); //B115200
    cfsetospeed (&newtio, B115200); //B115200

	tcflush(fd, TCIFLUSH);
	tcsetattr(fd,TCSANOW,&newtio);
	 
	/* loop while waiting for input. normally we would do something
	   useful here */ 
	int readbytes = 0;
	int packet_crc = 0;
	int packet_size = 0;
	int do_request = 1;
    int p_all = 0;
    int p_ok = 0;
 
    int runs;
    for ( runs = 0; runs < 1000; runs++ ) {
  //  while (STOP == FALSE) {


      if ( do_request == 1 ) {
      	printf("Request Packet\n");
      	write(fd,"fire\n",6);
      	do_request = 0;
      }

	  if ( wait_flag==FALSE) { 
		res = read(fd,buf,4000);
		
		printf("ReadBlock: Size : %d New Size: %d Content: ",res,(packet_size+res));
		readbytes += res;
		int i;		
		for ( i = 0; i < res; i++ ) {
		  printf("%d",buf[i]);
		  packet_size++;
		  packet_crc += buf[i];
		  if ( buf[i] == -1 ) {
		  	printf("\nPacket end. Size: %d CRC: %d\n",packet_size,packet_crc);
		  	p_all++;
		  	if ( packet_crc == /*45 *//*4850*/7250 ) p_ok++;
		  	packet_crc = 0;
			packet_size = 0;
			do_request = 1;
	      }
	    }
	    
	    if ( ( buf[res - 1] == 0 ) || ( ( packet_size >= 96 ) && ( buf[res-1] != ( packet_size -1 ) ) ) || ( buf[res - 1] == 32 )) {
		  	printf("\nPacket end. Size: %d CRC: %d\n",packet_size,packet_crc);
		  	packet_crc = 0;
			packet_size = 0;
			do_request = 1;
	    }
	    	
	    printf("\n");   
	  }
	}
	
	fprintf(stderr,"Overall: %d pa: %d po: %d\n",readbytes,p_all,p_ok);
	/* restore old port settings */
	tcsetattr(fd,TCSANOW,&oldtio);
}

/***************************************************************************
* signal handler. sets wait_flag to FALSE, to indicate above loop that     *
* characters have been received.                                           *
***************************************************************************/

void signal_handler_IO (int status)
{
//  printf("received SIGIO signal.\n");
  wait_flag = FALSE;
}
