global ft_strcmp

ft_strcmp:
                            ; rdi = s1
                            ; rsi = s2
    mov rax, 0              ; clear rax register, it will serve the storage
_loop:
    mov al, [rdi]           ; copy the byte from rdi into al
    mov bl, [rsi]           ; copy the byte from rsi into bl
    cmp al, 0               ; check if al == '\0'
    je _done
    cmp al, bl
    jne _done
    inc rdi
    inc rsi
    jmp _loop

_done: 
    sub al, bl
    movsx rax, al           ; copy al into rax using extended movsx to keep the neative value
    ret