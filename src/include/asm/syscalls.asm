section .text

; input/output streams

%define stdin 0
%define stdout 1
%define stderr 2

; useful system calls
%define SYS_exit 1
%define SYS_read 3
%define SYS_write 4
%define SYS_open 5
%define SYS_close 6
%define SYS_pause 29

_kernelcall:
    int 80h
    ret

%macro syscall 1
    mov eax, %1
    call _kernelcall
%endmacro
