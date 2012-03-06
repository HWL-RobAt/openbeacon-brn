#ifndef MAIN_h
#define MAIN_h

struct statistic_data {
	unsigned long usb_recive_packets;
	unsigned long usb_recive_enc_bytes;
	unsigned long usb_recive_dec_bytes;
	unsigned long usb_fail_recive_packets;

	unsigned long usb_send_packets;
	unsigned long usb_send_enc_bytes;
	unsigned long usb_send_dec_bytes;
	unsigned long usb_fail_send_packets;

	unsigned long usb_generate_send_bytes;
};

void reset_stat(struct statistic_data *stat);
void print_stat(char begin, struct statistic_data *stat, FILE *file);

#endif
