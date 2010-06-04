.PHONY: all clean

ASM = nasm
ASMFLAGS = -f elf64 -I ../
LD = ld
LDFLAGS = 
objects := $(wildcard *.o)
sources := $(wildcard *.asm)

all: link

link: compile
	@echo "Linking..."
	$(LD) $(LDFLAGS) -o ../../bin/gaderytest $(objects)

compile: clean
	@echo "Assembling source files"
	$(ASM) $(sources) $(ASMFLAGS)
	@echo

clean:
	rm -f $(objects) 
	@echo
