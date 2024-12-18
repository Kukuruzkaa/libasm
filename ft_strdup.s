global ft_strdup

extern ft_strlen
extern ft_strcpy
extern __errno_location
extern malloc

section .text
ft_strdup:
    
    push rdi
    call ft_strlen
    add rax, 1                      ; +1 for the NULL

    mov rdi, rax
    call malloc wrt ..plt           ; use rdi for length
    cmp rax, 0
    je .error

    mov rdi, rax                    ; ft_strcpy(rdi, rsi)
    pop rsi
    call ft_strcpy
    ret

.error:
    mov rdi, 12                     ; 12  ENOMEM out of memory
    call __errno_location wrt ..plt ; get the errno address
    mov [rax], rdi
    mov rax, 0
    ret
