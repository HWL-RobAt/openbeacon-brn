install_path=/share/projects/berg_studienarbeit/local/bin/



all:
	$(CC) $(CFLAGS) -I./tools -c tools/commandline.c -o tools/tools.o
	$(CC) $(CFLAGS) -I./tools -c tools/obd_config.c -o tools/obd_config.o
	$(CC) $(CFLAGS) -I./socket -c socket/obd_socket.c -o socket/socket.o
	$(CC) $(CFLAGS) -I./serial -c serial/obd_serial.c -o serial/serial.o
	$(CC) $(CFLAGS) -fno-builtin -c parameter.c -o parameter.o
	$(CC) $(CFLAGS) -fno-builtin -c openbeacon_communication.c -o openbeacon_communication.o
	$(CC) $(CFLAGS) -fno-builtin -c usbshell.c -o usbshell.o
	$(CC) $(CFLAGS) -fno-builtin -c thread_click2ob.c -o thread_click2ob.o
	$(CC) $(CFLAGS) -fno-builtin -c thread_ob2click.c -o thread_ob2click.o
	$(CC) $(CFLAGS) -fno-builtin -c thread_read_click.c -o thread_read_click.o
	$(CC) $(CFLAGS) -fno-builtin -c thread_read_usb.c -o thread_read_usb.o
	$(CC) $(CFLAGS) -fno-builtin -I./socket -I./serial -c main.c -o main.o
	$(CC) $(CFLAGS) tools/tools.o main.o socket/socket.o serial/serial.o parameter.o thread_click2ob.o \
					openbeacon_communication.o usbshell.o thread_read_click.o thread_read_usb.o thread_ob2click.o \
					-lpthread -lm -o obd-mips
	$(CC) $(CFLAGS) tools/tools.o tools/obd_config.o socket/socket.o parameter.o -lpthread -lm -o obd-config					

install: obd-mips obd-config
	cp obd-mips $(install_path)
	cp obd-config $(install_path)

clean:
	@rm -f socket/socket.o
	@rm -f serial/serial.o
	@rm -f tools/tools.o
	@rm -f main.o main_test.o
	@rm -f berg_obd obd-mips
