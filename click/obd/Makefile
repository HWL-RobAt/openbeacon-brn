all:
	gcc -I./socket -c socket/obd_socket.c -o socket/socket.o
	gcc -I./serial -c serial/obd_serial.c -o serial/serial.o
	gcc -I./socket -I./serial -c main.c -o main.o
	gcc main.o socket/socket.o serial/serial.o -lpthread -o obd


clean:
	rm -f socket/socket.o
	rm -f serial/serial.o
	rm -f main.o
	rm -f obd
