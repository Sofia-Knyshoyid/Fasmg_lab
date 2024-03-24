format ELF64 executable 3
segment readable executable

save_rsp    dq ?

entry $
    push rbp
    mov [save_rsp], rsp
    ;=========================
    mov eax, 0xAB
    add eax, 0xAB
    sub eax, 0xAB
    ;=========================
    mov eax, 0xAB
    mov ebx, 0xAB
    mov ecx, 0xAB
    mov edx, 0xAB
    mov esi, 0xAB
    mov edi, 0xAB
    mov ebp, 0xAB
    mov esp, 0xAB
    mov r8d, 0xAB
    mov r9d, 0xAB
    mov r10d, 0xAB
    mov r11d, 0xAB
    mov r12d, 0xAB
    mov r13d, 0xAB
    mov r14d, 0xAB
    mov r15d, 0xAB

    ;=========================
    mov eax, 0xABCDEF01
    mov ebx, 0xABCDEF01
    mov ecx, 0xABCDEF01
    mov edx, 0xABCDEF01
    mov esi, 0xABCDEF01
    mov edi, 0xABCDEF01
    mov ebp, 0xABCDEF01
    mov esp, 0xABCDEF01
    mov r8d, 0xABCDEF01
    mov r9d, 0xABCDEF01
    mov r10d, 0xABCDEF01
    mov r11d, 0xABCDEF01
    mov r12d, 0xABCDEF01
    mov r13d, 0xABCDEF01
    mov r14d, 0xABCDEF01
    mov r15d, 0xABCDEF01
    
    ;=======================
    mov rax, 0xAB
    mov rbx, 0xAB
    mov rcx, 0xAB
    mov rdx, 0xAB
    mov rsi, 0xAB
    mov rdi, 0xAB
    mov rbp, 0xAB
    mov rsp, 0xAB
    mov r8,  0xAB
    mov r9,  0xAB
    mov r10, 0xAB
    mov r11, 0xAB
    mov r12, 0xAB
    mov r13, 0xAB
    mov r14, 0xAB
    mov r15, 0xAB

    ;=========================
    mov rax, 0xABCDEF01
    mov rbx, 0xABCDEF01
    mov rcx, 0xABCDEF01
    mov rdx, 0xABCDEF01
    mov rsi, 0xABCDEF01
    mov rdi, 0xABCDEF01
    mov rbp, 0xABCDEF01
    mov rsp, 0xABCDEF01
    mov r8,  0xABCDEF01
    mov r9,  0xABCDEF01
    mov r10, 0xABCDEF01
    mov r11, 0xABCDEF01
    mov r12, 0xABCDEF01
    mov r13, 0xABCDEF01
    mov r14, 0xABCDEF01
    mov r15, 0xABCDEF01
    ;=========================
    ;=========================
    ; LEA to avoid real memory access.
    lea rdx, [1234]
    lea rdx, [12345678]
    lea rdx, [RBX + 1*RSI + 0x12345678]
    lea rdx, [RBX + 2*RSI + 0x12345678]
    lea rdx, [RBX + 4*RSI + 0x12345678]
    lea rdx, [RBX + 8*RSI + 0x12345678]
    ; lea   rdx, [RBX + 8*ESI + 0x12345678] <--- error!
    lea rdx, [EBX + 8*ESI + 0x12345678]
    lea edx, [EBX + 8*ESI + 0x12345678]
    ;==================================
    lea rdx, [RBX + 8*RSI + 0x12340000]
    lea rdx, [RBX + 8*RDI + 0x12340000]
    lea rdx, [RBX + 8*RBP + 0x12340000]
    ;==================================
    lea rdx, [RCX + 8*RBP + 0x12340000]
    lea rdx, [RDX + 8*RBP + 0x12340000]
    lea rdx, [RBP + 8*RBP + 0x12340000]
    ;=========================
    mov     al,  0x5
    mov     ax,  0x5
    mov     eax, 0x5
    mov     rax, 0x5
    mov     al,  0x5
    mov     ax,  0x5678
    mov     eax, 0x56789ABC
    mov     rax, 0x56789ABC
    mov     rax, 0x56789ABCDEF01234
    ;=========================

    mov rsp, [save_rsp]
    pop rbp

    mov eax,60      ; __NR_exit (sys_exit) == 0 
    xor edi,edi     ; exit code 0
    syscall

segment readable writeable

msg db 'Hello 64-bit Linux world!',0xA
msg_size = $-msg 