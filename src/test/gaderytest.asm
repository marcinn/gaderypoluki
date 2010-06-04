%include "asm/syscalls.asm"
%include "asm/text.asm"
%include "asm/gaderypoluki.asm"

section .data
	hello:     db 'Ok, to dziala, jak fabryka chciala!',0 
    newline:   db 10,0

    msg_original:       db 'Original message: ',0
    msg_translated:     db 'Translated message: ',0

    buffer:    times 255 db 0

section .text
    ; etykieta _start zadeklarowana jako globalna
    ; aby linker prawidlowo ustawil entrypoint (poczatek programu)
    global _start

_start:
    
    print_text msg_original
    print_text hello
    print_text newline

    mov rsi, hello
    mov rdi, buffer
    call gaderypoluki

    print_text msg_translated
    print_text buffer
    print_text newline

    mov ebx,0
    syscall SYS_exit
