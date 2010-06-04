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
	@make -C src/test/
	@make -C src/gaderypoluki/
	@make -C src/gaderyfilter/
clean:
	@make -C src/test/ clean
	@make -C src/gaderypoluki/ clean
	@make -C src/gaderyfilter/ clean
	@echo
