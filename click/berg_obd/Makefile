all:
	$(CC) $(CFLAGS) -I./tools -c tools/commandline.c -o tools/tools.o
	$(CC) $(CFLAGS) -I./socket -c socket/obd_socket.c -o socket/socket.o
	$(CC) $(CFLAGS) -I./serial -c serial/obd_serial.c -o serial/serial.o
	$(CC) $(CFLAGS) -fno-builtin -I./socket -I./serial -c main.c -o main.o
	$(CC) $(CFLAGS) tools/tools.o main.o socket/socket.o serial/serial.o -lpthread -lm -o berg_obd 

clean:
	@rm -f socket/socket.o
	@rm -f serial/serial.o
	@rm -f tools/tools.o
	@rm -f main.o main_test.o
	@rm -f berg_obd obd_test
