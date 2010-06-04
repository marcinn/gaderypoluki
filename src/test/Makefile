.PHONY: all clean

ASM = nasm
ASMFLAGS = -f elf64 -I ../include/
LD = ld
LDFLAGS = 
objects = gaderytest.o
sources = gaderytest.asm

all: link

link: compile
	@echo "Linking..."
	$(LD) $(LDFLAGS) -o ../../bin/gaderytest $(objects)

compile: clean
	@echo "Assembling source files"
	$(ASM) $(sources) $(ASMFLAGS)
	@echo

clean:
	rm -f *.o
	@echo
