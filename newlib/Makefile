PROGNAME = test

PREFIX = arm-none-eabi-
CC = $(PREFIX)gcc
AS = $(PREFIX)as
LD = $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy
OBJDUMP = $(PREFIX)objdump

LOADADDR = 0xC1000000
ENTRY = _Reset

INCLUDEDIR = -I. -I../TexasInstruments/include -I../TexasInstruments/include/hw -I../TexasInstruments/include/armv5 -I../TexasInstruments/include/armv5/am1808
LDFLAGS = -nostdlib -T test.ld 
CPUFLAG = -mcpu=arm926ej-s
STATICLIBS = libc.a libgcc.a

ELF = $(PROGNAME).elf
BIN = $(PROGNAME).bin
ASM = $(PROGNAME).asm
BOOT_CMD = boot.cmd
BOOT_SCR = boot.scr

SRC_FILES = test.c syscalls.c

FIND_ENTRY = $(shell grep '<$(ENTRY)>' $(ASM) | head -n1 | cut -d' ' -f1)

all: test.o syscalls.o startup.o
	@echo "Linking $(ELF)..."
	$(LD) $(LDFLAGS) $+ $(STATICLIBS) -o $(ELF)
	@echo "Creating $(BIN)..."
	$(OBJCOPY) -O binary $(ELF) $(BIN)
	@echo "Looking for entry point address..."
	$(OBJDUMP) -d $(ELF) > $(ASM)
	@echo "Creating $(BOOT_CMD)..."
	echo "fatload mmc 0 $(LOADADDR) $(BIN)" > $(BOOT_CMD)
	echo "go $(LOADADDR)" >> $(BOOT_CMD)
	@echo "Creating $(BOOT_SCR)..."
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n 'Execute $(BIN)' -d $(BOOT_CMD) $(BOOT_SCR)

startup.o: startup.s
	@echo "Compiling startup.s..."
	$(AS) $(CPUFLAG) -o $@ $<

%.o: %.c
	@echo "Compiling $<..." 
	$(CC) $(CPUFLAG) $(INCLUDEDIR) -c -o $@ $<

clean:
	rm *.o $(ASM) boot.cmd boot.scr $(BIN) $(ELF)
