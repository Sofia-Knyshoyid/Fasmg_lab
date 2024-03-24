;   Linux 64-bit executable, which uses 
;	only static or no-pie libraries.
;	Needs linking. Using gcc as a linker driver. 
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux64_libc.asm 
;   gcc hello_linux64_libc.o -o hello_linux64_libc -static -m64
;
; or:
;	INCLUDE=x86/include ./fasmg.x64  hello_linux64_libc.asm 
;   gcc hello_linux64_libc.o -o hello_linux64_libc -no-pie -m64
;
; Stripping the executable could be useful too:
;   strip hello_linux64_libc
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;
; -m64 -- generate 64-bit code, default for the x86-64 GCC.

include 'format/format.inc' 

format ELF64

section '.text' executable

 public main
 extrn printf
 extrn puts
 extrn exit
 extrn getpid

 main:
    push    rbp        ; Stack should be aligned to 16!

    call    getpid  
    mov     esi, eax    ; Результат виклику -- в EAX
    lea     rdi, [msg]  ; Увага! Автоматично йде відносно RIP!
                        ; Тому тут lea а не mov. Фактично тут mov rdi, [rip + msg]
                        ; Фрагмент виводу objdump hello_linux64_libc.o -d -M intel
                        ;    8:   48 8d 3d 00 00 00 00    lea    rdi,[rip+0x0]        # f <main+0xf>
                        ; Лінкер заповнить ці нулі реальним зміщенням на msg відносно RIP.
    xor     rax, rax    ; Кількість використаних XMM регістрів для variadic arg
    call    printf      ; "printf rdi, rsi"

    xor     edi, edi    ; exit code
    call    exit        ; "exit (0)" ==> "exit edi"

    ; OR: 
    ; xor     eax, eax    ; exit code
    ; pop     rbp
    ; ret

section '.data' writeable

msg db "Current process ID is %d.",0xA,0
