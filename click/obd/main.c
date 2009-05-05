#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dlfcn.h>
#include <pthread.h>
#include <dirent.h>
#include <string.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>

#include "socket/obd_socket.h"
#include "serial/obd_serial.h"
#include "usbpacket/usbpacket.h"

#define BUFFERSIZE 2048

int rx_running;
int tx_running;
int fd;
struct socket_connection *con;

void *tx_from_click_to_ob_thread(void *p)
{
//pthread_mutex_lock(&(pluginInfo->pluginInfo_mutex));
//pthread_mutex_unlock(&(pluginInfo->pluginInfo_mutex));
  int readbytes;
  char buffer[BUFFERSIZE];
  int index = 0;
  struct packet_header *ph = (struct packet_header *)buffer;

  while( tx_running == 1 ) {
    readbytes = recv_from_peer(con, &buffer[sizeof(struct packet_header)], BUFFERSIZE - sizeof(struct packet_header));  //read header
    ph->type = PACKET_DATA;
    ph->length = readbytes;
    write_obd_serial(fd, buffer, ph->length + sizeof(struct packet_header));
  }

  pthread_exit(NULL);
}

void *rx_from_ob_to_click_thread(void *p)
{
//pthread_mutex_lock(&(pluginInfo->pluginInfo_mutex));
//pthread_mutex_unlock(&(pluginInfo->pluginInfo_mutex));

  int readbytes;
  char buffer[BUFFERSIZE];
  int index = 0;
  struct packet_header *ph = NULL;

  int i;
/*
  while( rx_running == 1 ) {
    readbytes = read_obd_serial(fd, buffer, 2000);
    send_to_peer(con, buffer, readbytes);
  }
 */
  while( rx_running == 1 ) {
  	if ( ph == NULL ) {
  	  printf("Start reading\n");
      readbytes = read_obd_serial(fd, &buffer[index], sizeof(struct packet_header) - index);  //read header
      
      for ( i = 0; i < readbytes; i++) printf("%d ",buffer[index + i]); 
	
      printf("\n");
      
      index += readbytes;
      if ( index == sizeof(struct packet_header) ) {
        ph = (struct packet_header *)buffer;
      }
    } else {
      readbytes = read_obd_serial(fd, &buffer[index], (ph->length - index + sizeof(struct packet_header)));
      for ( i = 0; i < readbytes; i++) printf("%d ",buffer[index + i]); 
      printf("\n");

      index+=readbytes;
      
      if ( index == (ph->length + sizeof(struct packet_header)) ) {
      	if ( ph->type == PACKET_DATA ) {
          send_to_peer(con, &buffer[sizeof(struct packet_header)], ph->length);
      	} else if ( ph->type == DEBUG_PRINT ) {
      	  buffer[sizeof(struct packet_header) + ph->length] = 0;
      	  printf("%s",buffer);
	    }	
          
        index = 0;  
        ph = NULL;
      }
    }
  }
  
  pthread_exit(NULL);
}


int exit_function() {
  close_connection(con);
  close_obd_serial(fd);
}


int main( int argc, char *argv[])
{	
  pthread_t rxThread,txThread;
  int threadResult;
  void *rxThreadJoin,*txThreadJoin;

  rx_running = 1;
  tx_running = 1;
  fd = open_obd_serial("/dev/ttyACM0");
  if ( fd == -1 ) exit(0);
  con = open_socket_connection("localhost", 20000, 20001);

  threadResult = pthread_create(&rxThread,(pthread_attr_t*)NULL,(void *)&rx_from_ob_to_click_thread,(void*)NULL);  //use last arg (pointer) for arguments for thread
  threadResult = pthread_create(&txThread,(pthread_attr_t*)NULL,(void *)&tx_from_click_to_ob_thread,(void*)NULL);

  sleep(2);	
  printf("Fire\n");
  write_obd_serial(fd, "fire\n", 6);

  pthread_join(rxThread,&rxThreadJoin);
  pthread_join(txThread,&txThreadJoin);

  return(0);
}
