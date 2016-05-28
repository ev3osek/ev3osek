PROGNAME = ECRobot

PREFIX = arm-none-eabi-
CC = $(PREFIX)gcc
AR = $(PREFIX)ar

C_OPTIMISATION_FLAGS = -O0

CFLAGS = $(C_OPTIMISATION_FLAGS) -c -std=gnu99 -mcpu=arm926ej-s -g -Dgcc -Dam1808 -Winline -Wall -Werror-implicit-function-declaration \
	-I. -I../leJOS_EV3/src/ev3/ -I../leJOS_EV3/src/ev3/ninja/ -ffreestanding -fomit-frame-pointer

LIB = $(PROGNAME).a

all: $(LIB)

$(LIB): leJOS ecrobot_interface.o
	@echo "Building $(LIB)"
	$(AR) rcs -o $@ ecrobot_interface.o
	
%.o: %.c
	@echo "Compiling $< to $@" 
	$(CC) $(CFLAGS) -o $@ $<
	
leJOS:
	cd ../leJOS_EV3/src/ev3/ && make all

clean:
	rm $(PROGNAME).a *.o
