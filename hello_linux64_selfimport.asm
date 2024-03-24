;   Linux 64-bit self-contained. Does not need linking.
;   Produces dynamic executable which uses libc. 
; 	(Creates structures needed for linking with dynamic libs by itself).
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux64_selfimport.asm
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;	chmod +x hello_linux64_selfimport  # To execute assembled application

include 'format/format.inc' 
include 'macro/lin/import64.inc'

format ELF64 executable 3
entry start


interpreter '/lib64/ld-linux-x86-64.so.2'
needed 'libc.so.6'
import printf,puts,exit,getpid

segment readable executable

start:
    push   rbp        ; Stack should be aligned to 16!

    call    [getpid]
    mov     esi, eax    ; Результат виклику -- в EAX
    lea     rdi, [msg]  ; Увага! Автоматично йде відносно RIP!
                        ; Тому тут lea а не mov. Фактично тут mov rdi, [rip + msg]
                        ; Фрагмент виводу objdump hello_linux64_libc.o -d -M intel
                        ;    8:   48 8d 3d 00 00 00 00    lea    rdi,[rip+0x0]        # f <main+0xf>
						; Лінкер заповнить ці нулі реальним зміщенням на msg відносно RIP.
    xor     rax, rax    ; Кількість використаних XMM регістрів для variadic arg
    call    [printf]    ; "printf rdi, rsi"

    xor     edi, edi    ; exit code
	pop       rbp
    call    [exit]

    ; OR: 
    ; xor     eax, eax    ; exit code
    ; pop       rbp
    ; ret

segment readable writeable

msg db "Current process ID is %d.",0xA,0
