all:
	gcc -I./socket -c socket/obd_socket.c -o socket/socket.o
	gcc -I./serial -c serial/obd_serial.c -o serial/serial.o
	gcc -I./socket -I./serial -c main.c -o main.o
	gcc -I./socket -I./serial -c main_test.c -o main_test.o
	gcc main.o socket/socket.o serial/serial.o -lpthread -o obd
	gcc main_test.o socket/socket.o serial/serial.o -lpthread -o obd_test


clean:
	rm -f socket/socket.o
	rm -f serial/serial.o
	rm -f main.o main_test.o
	rm -f obd odb_test
