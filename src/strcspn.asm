segment .text
global strcspn:function

strcspn:
    mov rax, 0
    mov rcx, 0
    cmp rdi, 0x00
    je .end

.get_length:
    cmp BYTE[rdi + rax], 0
    je .end
    inc rax
    jmp .get_length

.loop
    cmp rsi, 0x00
    je .get_length
    jmp .end

.end:
    ret