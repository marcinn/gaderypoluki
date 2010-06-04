section .text

; strlen - calc len of ascii string
;
; IN:
;   rsi: pointer to 0-terminated string
; 
; OUT:
;   rax: string length in bytes

strlen:
    push rsi
    xor rax, rax
.count0:
    cmp BYTE [rsi], 0
    je .exit
    inc rax
    inc rsi
    jmp .count0
.exit:
    pop rsi
    ret



; print - print tekst to stdout
;
; IN:
;   rsi: pointer to 0-terminated string


_print:
    push rax
    push rcx
    push rdx
    call strlen     ; obliczenie dlugosci ciagu, zwrot w rax

    mov rdx, rax    ; SYS_write rdx: dlugosc ciagu
    mov rcx, rsi    ; SYS_write rcx: adres ciagu
    syscall SYS_write
    pop rdx
    pop rcx
    pop rax
    ret

print:
    push rbx
    mov ebx, stdout ; SYS_write rbx: wyjscie
    call _print
    pop rbx
    ret

printerr:
    push rbx
    mov ebx, stderr ; SYS_write rbx: wyjscie
    call _print
    pop rbx
    ret

%macro print_text 1
    push rsi
    mov rsi, %1
    call print
    pop rsi
%endmacro

