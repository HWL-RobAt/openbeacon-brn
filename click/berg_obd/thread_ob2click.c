#include <sys/time.h>
#include <stdio.h>

#define __OPENBEACON_COMUNICATION_H__WITH_ENCODING
#include "openbeacon_communication.h"
#include "parameter.h"
#include "main.h"

void *rx_from_ob_to_click_thread(void *p)
{
	struct device_data* dev = (struct device_data*)p;
	unsigned int i, index=0;
	int k;
	unsigned char hlen, recive_spezial=0;
	unsigned int blen, status;
	long txc_dec, txc_max_dec, rxc_dec, rxc_max_dec, txq, rxq, freeb, pid, idle_thread_counter;
	long txc_enc, txc_max_enc, rxc_enc, rxc_max_enc;
    struct timeval c_time, r_time, tmp_time, opb_time;
	long PacketID=0;
	unsigned long rOtoC_sleep_time = THREAD_SLEEP_TIME;

	char buffer[10000];
	OBD2HW_Header* p_hwh =   (OBD2HW_Header*)buffer;


	gettimeofday(&c_time, 0);
	gettimeofday(&opb_time, 0);

	fprintf(dev->beaconoutput_file, "OB\tTime\t\t\tNetID\t\tChannel\tRate\tPower\tTX\tFailTX\tRX\tFailRX\n");
	fprintf(dev->beaconoutput_file, "USB\tTime\t\t\tTX\tFailTX\tTXEncBs\tTXDecBs\tRX\tFailRX\tRXEncBs\tRXDecBs\tTXQu\tRXQu \tQuFree\n");
	fflush(dev->beaconoutput_file);

	print_stat(1, &main_stat_data, dev->hostoutput_file);

	unsigned long send_count=0, send_count_fail=0;
	unsigned long recv_count=0, recv_count_fail=0;

	while( dev->rx_running == 1 ) {
		if(pCMDValue.exit_time>0 && pCMDValue.exit_time<time(0)) break;

		hlen = 200;
		status = getDataFromUSBChannel(dev,  buffer,  &hlen, 1 );

		gettimeofday(&tmp_time, 0);
		if(  time_diff(tmp_time, c_time)>=pCMDValue.print_intervall ) {
			print_stat(0, &main_stat_data, dev->hostoutput_file);
			reset_stat( &main_stat_data );
			gettimeofday(&c_time, 0);
		}

		if(status==STATUS_OK && hlen>0) {
			rOtoC_sleep_time = THREAD_SLEEP_TIME;
			if( p_hwh->type==MONITOR_PRINT ) {
				printf("%s>\t", dev->device_name);
				buffer[  sizeof(OBD2HW_Header) + p_hwh->length ] = 0;
				printf("%s\n", buffer+sizeof(OBD2HW_Header) );
				fflush(stdout);

				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==MONITOR_HEX_PRINT ) {
				printf("%s>\t", dev->device_name);
				pid=0;
				for(k=sizeof(long); k>=0; k--) {
					pid = pid*256 	+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header)        ];
				}

				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==DEBUG_HEX_PRINT ) {
				PacketID = 0;
				for(k=sizeof(long); k>=0; k--) {
					PacketID = PacketID*256 	+ (unsigned char)buffer[  k+sizeof(OBD2HW_Header) ];
				}
				gettimeofday(&r_time, 0);
				fprintf(dev->recive_file_log, "%d.%.6d:  %.6d\n", r_time.tv_sec, r_time.tv_usec,  PacketID);
				fflush(dev->recive_file_log);

				p_hwh->type=0;
				p_hwh->length=0;
			} else if( p_hwh->type==STATUS_OPENBEACON_V1 ) {
				/* Statusinformationen: wie aktueller Kanal, Bitrate, Power
				 * 						+ gesendete und empfangene Pakete
				 * 						+ fehlversuche beim Senden 				*/
				StatusOpenbeacon_V1* psob_v1 = (StatusOpenbeacon_V1*)(buffer+sizeof(OBD2HW_Header));
				struct timeval h_time;

				gettimeofday(&h_time, 0);
				fprintf(dev->beaconoutput_file,"OB\t%d.%.6d:\t", h_time.tv_sec, h_time.tv_usec);
				for(k=0; k<OPENBEACON_MACSIZE; k++) {
					fprintf(dev->beaconoutput_file,"%.2X", psob_v1->NetID[k] );
					if(k<OPENBEACON_MACSIZE-1 ) fprintf(dev->beaconoutput_file,":");
				}
				fprintf(dev->beaconoutput_file, "\t%d\t%d\t%d\t"	   , psob_v1->TxChannel, psob_v1->TxRate, psob_v1->TxPowerLevel );
				fprintf(dev->beaconoutput_file, "%ld\t%ld\t", arrayToLong(psob_v1->send_count, 4), arrayToLong(psob_v1->send_fail_count, 4));
				fprintf(dev->beaconoutput_file, "%ld\t%ld\t", arrayToLong(psob_v1->recv_count, 4), arrayToLong(psob_v1->recv_fail_count, 4));
				fprintf(dev->beaconoutput_file, "\n");
				fflush(dev->beaconoutput_file);
			} else if( p_hwh->type==STATUS_OPENBEACON_V2 ) {
				StatusOpenbeacon_V2* psob_v2 = (StatusOpenbeacon_V2*)(buffer+sizeof(OBD2HW_Header));
				struct timeval h_time;
				gettimeofday(&h_time, 0);
				fprintf(dev->beaconoutput_file, "USB\t%d.%.6d:\t", h_time.tv_sec, h_time.tv_usec);
				fprintf(dev->beaconoutput_file, "%ld\t%ld\t"	   , arrayToLong(psob_v2->tx_usb_packets, 4),		arrayToLong(psob_v2->fail_tx_usb_packets, 4) );
				fprintf(dev->beaconoutput_file, 	"%ld\t%ld"	   , arrayToLong(psob_v2->tx_usb_enc_bytes, 4),		arrayToLong(psob_v2->tx_usb_dec_bytes, 4) );
				fprintf(dev->beaconoutput_file, 	"\t%ld\t%ld\t"	   , arrayToLong(psob_v2->rx_usb_packets, 4),		arrayToLong(psob_v2->fail_rx_usb_packets, 4) );
				fprintf(dev->beaconoutput_file, 	"%ld\t%ld\t"	   , arrayToLong(psob_v2->rx_usb_enc_bytes, 4),		arrayToLong(psob_v2->rx_usb_dec_bytes, 4) );
				fprintf(dev->beaconoutput_file, "%d\t%d\t%d\t"  , psob_v2->tx_quse,   psob_v2->rx_quse,   psob_v2->qfree );
				fprintf(dev->beaconoutput_file, "\n");
				fflush(dev->beaconoutput_file);
			} else if(p_hwh->type==PACKET_DATA) {
				// send to click
				send_to_peer(dev->con, buffer+sizeof(OBD2HW_Header),  p_hwh->length);
			} else {
				main_stat_data.usb_fail_recive_packets++;
			}
		}

		usleep( rOtoC_sleep_time );
		if(rOtoC_sleep_time > THREAD_MAX_SLEEP_TIME) rOtoC_sleep_time += THREAD_SLEEP_TIME;
	}
	printf("exit: obd -> click\n");
	pthread_exit(p);
}
