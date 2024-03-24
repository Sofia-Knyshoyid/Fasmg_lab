;   Linux 32-bit dynamic executable using libc. 
;	Can use dynamical libraries (so).
;	Needs linking. Using gcc as a linker driver. 
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux32_libc_pic.asm  
;   gcc hello_linux32_libc_pic.o -o hello_linux32_libc_pic -m32
;
; Stripping the executable could be useful too:
;   strip hello_linux32_libc_pic
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;
; Note: -m32 потрібен на 64-бітних системах, щоб скомпілювати 32-бітний код.

include 'format/format.inc' 

format ELF

section '.text' executable

 public main
 extrn printf
 extrn puts
 extrn exit
 extrn getpid

main:
    sub     esp, 8  ; Stack should be aligned to 16!

    call    getpid  ; Результат виклику -- в EAX
    push    eax     
    push    msg 
    call    printf      ; "printf msg, eax"
    add     esp, 8

    push    0
    call    exit
    
    ; OR:
    ; add     esp, 8  ; Restore stack
    ; ret     

section '.data' writeable

msg db "Current process ID is %d.", 0x0A, 0
