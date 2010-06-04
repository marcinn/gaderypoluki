.PHONY: all

ASM = nasm
ASMFLAGS = -f elf64 -I ../include/
CC = gcc
CCFLAGS =
objects = translate.o
asmsources = translate.asm
csources = main.c

all: clean compile clean

clean:
	rm -f *.o
	rm -f *.s

compile:
	$(ASM) $(asmsources) $(ASMFLAGS)
	$(CC) $(CCFLAGS) -o ../../bin/gaderyfilter $(csources) $(objects)

asm:
	$(ASM) $(asmsources) $(ASMFLAGS)
	$(CC) $(CCFLAGS) -S $(csources) $(objects)

