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

int running;
struct socket_connection *con;

void *from_click_to_click_thread(void *p)
{
//pthread_mutex_lock(&(pluginInfo->pluginInfo_mutex));
//pthread_mutex_unlock(&(pluginInfo->pluginInfo_mutex));
  int readbytes;
  char buffer[BUFFERSIZE];
  int index = 0;
  struct packet_header *ph = (struct packet_header *)buffer;

  while( running == 1 ) {
    readbytes = recv_from_peer(con, &buffer[sizeof(struct packet_header)], BUFFERSIZE - sizeof(struct packet_header));  //read header
    ph->type = PACKET_DATA;
    ph->length = readbytes;
    send_to_peer(con, &buffer[sizeof(struct packet_header)], ph->length);
  }

  pthread_exit(NULL);
}

int exit_function() {
  close_connection(con);
}


int main( int argc, char *argv[])
{	
  pthread_t thread;
  int threadResult;
  void *threadJoin;

  running = 1;

  con = open_socket_connection("localhost", 20000, 20001);

  threadResult = pthread_create(&thread,(pthread_attr_t*)NULL,(void *)&from_click_to_click_thread,(void*)NULL);  //use last arg (pointer) for arguments for thread
  pthread_join(thread,&threadJoin);

  return(0);
}
