global ft_write
extern __errno_location

section .text
ft_write:
    mov rax, 1          ; 1 - syscall number for sysem write 
    syscall 
    cmp rax, 0        ; check if the negatve value is returned (on error -1 for write)
    jl .error
    ret

.error:
    neg rax
    mov rbx, rax
    call __errno_location wrt ..plt ; get the errno address
    mov [rax], rbx
    mov rax, -1
    ret
