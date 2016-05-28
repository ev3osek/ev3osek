PROGNAME = test

PREFIX = arm-none-eabi-
CC = $(PREFIX)gcc
AS = $(PREFIX)as
LD = $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy
OBJDUMP = $(PREFIX)objdump

LOADADDR = 0xC1000000
ENTRY = Entry

INCLUDEDIR = -I. -I../ev3/include -I../ev3/include/hw -I../ev3/include/armv5 -I../ev3/include/armv5/am1808 -I../ev3 -I../ev3/ninja
LDFLAGS = -nostdlib -T test.ld
CPUFLAG = -mcpu=arm926ej-s
STATICLIBS = ../../../newlib/libc.a ../ev3/leJOS_EV3.a

ELF = $(PROGNAME).elf
BIN = $(PROGNAME).bin
ASM = $(PROGNAME).asm
BOOT_CMD = boot.cmd
BOOT_SCR = boot.scr

# ehrpwmInitTest.c
SRC_FILES = test.c ../../../newlib/syscalls.c

#ehrpwmInitTest.o ehrpwmInitTest.o
all: test.o ../../../newlib/syscalls.o startup.o exceptionhandler.o leJOS
	@echo "Linking $(ELF)..."
	$(LD) $(LDFLAGS) test.o ../../../newlib/syscalls.o startup.o exceptionhandler.o $(STATICLIBS) -o $(ELF) -lgcc --library-path=../../../newlib
	@echo "Creating $(BIN)..."
	$(OBJCOPY) -O binary $(ELF) $(BIN)
	@echo "Looking for entry point address..."
	$(OBJDUMP) -d $(ELF) > $(ASM)
	@echo "Creating $(BOOT_CMD)..."
	echo "fatload mmc 0 0xC1000000 $(BIN)" > $(BOOT_CMD)
	echo "go 0xC1000000" >> $(BOOT_CMD)
	@echo "Creating $(BOOT_SCR)..."
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n 'Execute $(BIN)' -d $(BOOT_CMD) $(BOOT_SCR)
	@echo "Moving application to SD-Card"
	sudo mount /dev/mmcblk0p1 /mnt/sd
	sudo rm -f /mnt/sd/test.bin
	sudo rm -f /mnt/sd/boot.scr
	sudo cp test.bin /mnt/sd/
	sudo cp boot.scr /mnt/sd/
	sudo umount /mnt/sd

leJOS:
	cd ../ev3/ && make all

%.o: %.S
	@echo "Compiling $<..."
	$(CC) $(CPUFLAG) -c -g -fdata-sections -ffunction-sections -Wall -Dgcc -Dam1808 -O0 $(INCLUDEDIR) -o $@ $<
	
%.o: %.c
	@echo "Compiling $<..." 
	$(CC) $(CPUFLAG) -std=gnu99 -c -g -fdata-sections -ffunction-sections -Wall -Dgcc -Dam1808 -O0 $(INCLUDEDIR) -o $@ $<

clean:
	rm *.o $(ASM) boot.cmd boot.scr $(BIN) $(ELF)
