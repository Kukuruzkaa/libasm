global ft_strcpy

ft_strcpy:
    mov rcx, 0             ; clear rcx register, it will serve the index
.loop: 
    mov bl, [rsi + rcx]     ; copy the sring to al (lower byte of rax) from rsi - source pointer
    mov [rdi + rcx], bl     ; copy al to rdi - destination pointer
    cmp bl, 0               ; check if al == '\0'
    je .done                ; if al == '\0' - end of funcion, jump to done 
    inc rcx
    jmp .loop
           
.done:
    mov rax, rdi
    ret                     ; return the dest pointer in rdi

    