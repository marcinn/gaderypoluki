.DEFAULT_GOAL = build
.PHONY = build clean

ASM = nasm
ASMFLAGS = -f elf64
LD = ld
LDFLAGS = 
objects := $(wildcard *.o)

help:
	@echo "  build "
	@echo "	 clean - rm compiled/object files"

build: clean
	$(ASM) gaderytest.asm $(ASMFLAGS)
	$(LD) $(LDFLAGS) -o bin/gaderytest gaderytest.o
	rm -f $(objects)
	@echo

clean:
	rm -f $(objects) 
	@echo
