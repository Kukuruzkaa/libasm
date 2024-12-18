global ft_strlen

ft_strlen:
    mov rax, 0              ; initialize rax register (clear), it will store the length
_loop:
    cmp byte [rdi + rax], 0 ; rdi - pointer to the string address in rax, compare the byte address with NULL
    je _done                ; break the loop, if end of sring (0) and jump to done instruction
    inc rax                 ; inrement rax (length)
    jmp _loop               ; repeat
_done:
    ret                     ; return length (stored in rax)
