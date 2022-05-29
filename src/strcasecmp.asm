section:text
global strcasecmp:function

strcasecmp:
    xor rcx, rcx

.loop:
    mov al, BYTE[rdi + rcx]
    mov r8b, BYTE[rsi + rcx]
    inc rcx
    jmp .increment

.put_lower_second:
    add r8b, 32
    cmp al, r8b
    je .loop
    jmp .end

.check_lower_second:
    cmp r8b, 0x00
    je .end
    cmp r8b, 64
    jle .end
    cmp r8b, 97
    jge .end
    jmp .put_lower_second

.put_lower_first:
    add al, 32
    cmp al, r8b
    je .loop
    jmp .check_lower_second

.check_lower_first:
    cmp al, 64
    jle .check_lower_second
    cmp al, 97
    jge .check_lower_second
    jmp .put_lower_first

.increment:
    cmp al, 0x00
    je .check_lower_second
    cmp r8b, 0x00
    je .end
    cmp al, r8b
    jne .check_lower_first
    jmp .loop

.end:
    sub al, r8b
    movsx rax, al
    ret