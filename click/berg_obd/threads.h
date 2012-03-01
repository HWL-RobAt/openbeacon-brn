#ifndef THREADS_h
#define THREADS_h

void read_from_click_thread(void *p);
void read_from_usb_thread(void *p);

void *tx_from_click_to_ob_thread(void *p);
void *rx_from_ob_to_click_thread(void *p);

#endif
