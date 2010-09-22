all:
	gcc -I./tools -c tools/commandline.c -o tools/tools.o
	gcc -I./socket -c socket/obd_socket.c -o socket/socket.o
	gcc -I./serial -c serial/obd_serial.c -o serial/serial.o
	gcc -I./socket -I./serial -c main.c -o main.o
	gcc tools/tools.o main.o socket/socket.o serial/serial.o -lpthread -o berg_obd

clean:
	rm -f socket/socket.o
	rm -f serial/serial.o
	rm -f tools/tools.o
	rm -f main.o main_test.o
	rm -f berg_obd obd_test
