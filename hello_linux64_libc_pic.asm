;   Linux 64-bit dynamic executable using libc. 
;	Can use dynamical libraries (so).
;	Needs linking. Using gcc as a linker driver. 
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux64_libc_pic.asm  
;   gcc hello_linux64_libc_pic.o -o hello_linux64_libc_pic -m64 -fPIC
;
; Stripping the executable could be useful too:
;   strip hello_linux64_libc_pic
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;
; -m64 -- generate 64-bit code, default for the x86-64 GCC. -fPIC is default too.

include 'format/format.inc' 

format ELF64

section '.text' executable

 public main
 extrn printf
 extrn puts
 extrn exit
 extrn getpid

 main:
    push    rbp         ; Stack should be aligned to 16!

    call    plt.getpid  
    mov     esi, eax    ; Результат виклику -- в EAX
    lea     rdi, [msg]  ; Увага! Автоматично йде відносно RIP!
    xor     rax, rax    ; Кількість використаних XMM регістрів для variadic arg
    call    plt.printf      ; "printf rdi, rsi"

    xor     edi, edi    ; exit code
    call    plt.exit

    ; OR: 
    ; xor     eax, eax    ; exit code
    ; pop     rbp
    ; ret

section '.data' writeable

msg db "Current process ID is %d.",0xA,0
