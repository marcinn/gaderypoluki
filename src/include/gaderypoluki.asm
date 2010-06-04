section .text


translate:
    ; IN:
    ; rsi - source 
    ; rdi - destination 
    ; rdx - pointer to cipher
    ; 
    ; OUT:
    ; al - error code (0: ok)


    push rbx
    push rcx

    ; dlugosc szyfru musi byc podzielna przez 2
    push rsi
    mov rsi, rdx
    call strlen
    pop rsi
    mov bl, 2
    div bl          ; zakladam dosyc krotkie szyfry ;)
    or ah, ah       ; AH: AL mod BL  
    jne .exit       ; jesli nie, zakoncz (error code = reszta z dzielenia)
    mov cl, al      ; AL - wynik dzielenia przez 2
    mov ch, al

   
.loop:
    push rdx
    mov bl, [rsi] ; bl: znak zrodlowy
    or bl, bl
    jz .exitc ; koniec ciagu

.loopc:
    mov ax, [rdx] ; al: pierwszy znak szyfru, ah: drugi znak szyfru
    cmp bl, al
    jne .check2
    
    mov bl, ah  ; zamiana znakow
    jmp .store  ; koniec szyfrowania znaku, zapamietanie

.check2:
    cmp bl, ah
    jne .nextc
    mov bl, al ; zamiana znakow
    jmp .store ; koniec szyfr. znaku, zapamietanie

.nextc:
    add rdx, 2  ; adres kolejnej dwojki znakow
    dec cl      ; zmniejszenie licznika
    jnz .loopc
.store:
    mov [edi], bl   ; zapamietanie znaku zmodyfikowanego
    mov cl, ch      ; reset licznika szyfru
    pop rdx         ; odtworzenie adresu szyfru
    inc edi         ; kolejny znak ciagu
    inc esi         ; kolejny znak
    jmp .loop
.exitc:
    pop rdx
    xor al, al
    mov [edi], al   ; zapisanie konczacego zera

.exit:
    pop rcx
    pop rbx
    ret

gaderypoluki:
    push rdx
    mov rdx, .gaderypolukicipher
    call translate
    pop rdx
    ret


section .data
    .gaderypolukicipher   db 'gaderypolukiGADERYPOLUKI',0
