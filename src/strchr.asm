segment .text
global strchr:function

strchr:
    mov rax, rdi

loop:
    cmp BYTE[rax], sil
    je found
    cmp BYTE[rax], 0
    je end
    inc rax
    jmp loop

end:
    xor rax, rax

found:
    ret