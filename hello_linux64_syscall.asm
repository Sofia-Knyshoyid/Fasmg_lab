;   Linux 64-bit self-contained -- uses only syscalls. 
;	Does not need linking.
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux64_syscall.asm 
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;	chmod +x hello_linux64_syscall  # To execute assembled application

include 'format/format.inc' 
format ELF64 executable 3

segment readable executable

entry $
    mov eax,1       ; __NR_write (sys_write) == 1

    mov edi,1       ; Zero extension -- верхня частина 
					; RAX, RDI і т.д.
                    ; зануляється
    lea rsi,[msg] ;
    mov edx,msg_size 
    syscall

    mov eax,60      ; __NR_exit (sys_exit) == 0 
    xor edi,edi     ; exit code 0
    syscall

segment readable writeable

msg db 'Hello 64-bit Linux world!',0xA
msg_size = $-msg 

