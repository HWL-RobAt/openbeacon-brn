TARGET=openbeacon-recive-pack_1
ARCH=AT91SAM7S
CPU=$(ARCH)64
DEBUG=-g
OPTIM=-O2

APP_CFLAGS=-Iapplication -Wno-unused-parameter
APP_LDFLAGS=-lm

APP_SRC=			\
  application/main.c		\
  application/usbshell.c	\
  $(CORE)/openbeacon/crc32.c	\
  $(CORE)/openbeacon/rnd.c
  
#BOOTLOADER=application/update.s

all: $(TARGET).bin

app_clean:
	find application -name '*.o' -exec rm \{\} \;

include ../core/Makefile.rules
