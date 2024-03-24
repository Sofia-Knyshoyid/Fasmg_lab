;   Linux 32-bit self-contained -- uses only syscalls. 
;	Does not need linking.
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux32_syscall.asm 
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;	chmod +x hello_linux32_selfimport  # To execute assembled application

include 'format/format.inc' 

format ELF executable 3
segment readable executable

entry $ 
    mov eax,4       ; __NR_write (sys_write) == 4

    mov ebx,1       
    lea ecx,[msg] ;
    mov edx,msg_size 
    int 0x80

    mov eax,1       ; __NR_exit (sys_exit) == 1 
    xor ebx,ebx     ; exit code 0
    int 0x80

segment readable writeable

msg db 'Hello 32-bit Linux world!',0xA
msg_size = $-msg 
