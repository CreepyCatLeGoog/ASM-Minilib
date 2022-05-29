segment .text
global memset:function

memset:
    mov rax, rdi

loop:
    cmp rdx, 0
    je end
    dec rdx
    mov BYTE[rdi + rdx], sil
    jmp loop

end:
    ret