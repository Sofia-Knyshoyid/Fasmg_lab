;   Windows 64-bit: Win64 API console application. 
;	Can use libc and other dynamical libraries (dll).
;	Needs linking. Using gcc as a linker driver. 
;
; Сompile the source (using MINGW64):
;   INCLUDE=x86/include ./fasmg.exe hello_win64_con_o.asm
;   gcc hello_win64_con_o.o -o hello_win64_con_o.exe -m64
;
; Stripping the executable could be useful too:
;   strip hello_win64_con_o.exe

include 'win64a.inc' 

format ELF64

 public main as 'main'
 extrn 'printf' as printf
 extrn 'puts' as puts
 extrn 'exit' as exit
 extrn 'GetCurrentProcessId' as GetCurrentProcessId

section '.text' executable
main:
    sub     rsp, 0x8      ; Stack should be aligned to 16 = 0x10
						  ; This and the next command of course can 
					      ; be replaced by the "sub rsp, 0x28"
    
	sub     rsp, 0x20     ; Reserve shadow space
	call 	GetCurrentProcessId
	; add     rsp, 0x20	  ; Free shadow space -- commented because we are reusing shadow space
	
    ; sub     rsp, 0x20   ; Reserve shadow space -- commented because we are reusing shadow space
    mov     rcx, msg
    mov     rdx, rax	  ; rax == result of the GetCurrentProcessId
    call    printf
    add     rsp, 0x20	  ; Free shadow space
    ; OR
    ; fastcall printf, msg, rax	; call using the fastcall macro
    ; гляньте також, які інструкції вставить такий виклик:
    ; fastcall printf, msg, 1, 2, 3, 4, 5, 6, 7
    
    sub     rsp, 0x20     ; Reserve shadow space
    xor     ecx, ecx
    call    exit
    ; OR 
	; fastcall exit
	
section '.data' writeable 

msg db "Current process ID is %u.",0x0D,0x0A,0 ; or: 13,10,0 -- CR, LF, NUL -- \r \n \0