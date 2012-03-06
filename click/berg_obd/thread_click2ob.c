#include <sys/time.h>
#include <stdio.h>

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_communication.h"
#include "parameter.h"
#include "main.h"

char* textnachricht = "Hallo, das ist ein Text aus dem openbeacon.Bitte gut behandeln und bearbeiten.Dann machen wir weiter. ";

void *tx_from_click_to_ob_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	unsigned char readbytes, i, rj;
	struct timeval c_time, se_time, sb_time;
	int ret=0, coding_d, coding_h, packet_len;
	unsigned long tCtoO_sleep_time = THREAD_SLEEP_TIME;

	char buffer[10000];
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;
	Click2OBD_header* p_obdh;

	memcpy(buffer+sizeof(OBD2HW_Header), textnachricht, 100);

	long PacketID=0;

	sleep(1);

	while( dev->tx_running == 1) {
		if(pCMDValue.exit_time>0 && pCMDValue.exit_time<time(0)) break;

		if(pCMDValue.use_gen==1) {
			p_hwh =   (OBD2HW_Header*)buffer;
			memcpy(buffer+sizeof(OBD2HW_Header), textnachricht, 100);

			p_hwh->start=0;
			p_hwh->length=pCMDValue.packet_size;

			if(pCMDValue.use_ech==1) p_hwh->type=TEST_DATA_ECHO;
			else p_hwh->type=TEST_DATA;

			p_hwh->reserved=0xFF;

			gettimeofday(&sb_time, 0);
			for(i=0; i<1 && dev->stat_data.usb_generate_send_bytes<pCMDValue.bytes_per_intervall; i++) {
				coding_h = sizeof(OBD2HW_Header);
				if(p_hwh->length<ENCODING_PARAMETER) coding_h++;

				coding_d = 0;
				for(rj=0; rj<pCMDValue.packet_size; rj++) {
					coding_d++;
					if(pCMDValue.use_rand==1) buffer[  sizeof(OBD2HW_Header) + rj ] = rand()%255;
					if(buffer[  sizeof(OBD2HW_Header) + rj ]<ENCODING_PARAMETER) coding_d++;
				}

				insertLONG(buffer+sizeof(OBD2HW_Header), PacketID);
				putDataToUSBChannel(dev,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );

				// printf("generate packet\n");
				// Time/PacketID in Datei1 packen
				gettimeofday(&c_time, 0);
				fprintf(dev->send_file_log, "%d.%.6d: %.6d\t%.3d\t%.3d\t%.3d \n", (unsigned int)c_time.tv_sec, (unsigned int)c_time.tv_usec, PacketID, coding_h, pCMDValue.packet_size, coding_d );
				fflush(dev->send_file_log);

				PacketID++;
				dev->stat_data.usb_generate_send_bytes += coding_h+coding_d;
			}
			gettimeofday(&se_time, 0);

			if( pCMDValue.packet_intervall > time_diff(sb_time, se_time)) {
				usleep(  pCMDValue.packet_intervall-time_diff(sb_time, se_time) );
			} else printf(".");
		} else {
			if(dev->click_read_buffer_length>sizeof(Click2OBD_header) ) { // read from click and send to beacon
				pthread_mutex_lock(&dev->click_read_mutex);
					p_obdh = (Click2OBD_header*)dev->click_read_buffer;
					packet_len = p_obdh->length + sizeof(Click2OBD_header);

					if( dev->click_read_buffer_length>=packet_len) {

						memcpy(buffer+ sizeof(OBD2HW_Header), dev->click_read_buffer, packet_len);
						p_hwh =   (OBD2HW_Header*)buffer;
						p_hwh->start 		= 0;
						p_hwh->length 		= packet_len;
						p_hwh->type 		= PACKET_DATA;
						p_hwh->reserved 	= 0xFF;

						dev->click_read_buffer_length -= packet_len;
						if(dev->click_read_buffer_length>0) memcpy(dev->click_read_buffer, dev->click_read_buffer+packet_len, dev->click_read_buffer_length);

						if(!pCMDValue.noclick) {
							putDataToUSBChannel(dev,  buffer, sizeof(OBD2HW_Header)+p_hwh->length );
						}
						tCtoO_sleep_time = THREAD_SLEEP_TIME;
					}
				pthread_mutex_unlock(&dev->click_read_mutex);
			}
			if( tCtoO_sleep_time > THREAD_SLEEP_TIME) usleep( tCtoO_sleep_time );
			if( tCtoO_sleep_time < THREAD_MAX_SLEEP_TIME ) tCtoO_sleep_time += THREAD_SLEEP_TIME;
		}
	}

	printf("exit: click -> obd\n");
	pthread_exit(p);
}
