;   Windows 32-bit: Win32 API console application. 
;	Can use libc and other dynamical libraries (dll).
;	Needs linking. Using gcc as a linker driver. 
;
; Сompile the source (using MINGW32):
;   INCLUDE=x86/include ./fasmg.exe hello_win32_con_o.asm
;   gcc hello_win32_con_o.o -o hello_win32_con_o.exe -m32
;
; Stripping the executable could be useful too:
;   strip hello_win32_con_o.exe

include 'win32a.inc' 

format ELF

 public main as '_main'
 extrn '_printf' as printf
 extrn '_puts' as puts
 extrn '_exit' as exit
 extrn '_GetCurrentProcessId@0' as GetCurrentProcessId 
 ; Determinde by: nm /mingw32/i686-w64-mingw32/lib/libkernel32.a | grep GetCurrentProcessId
 extrn '_ExitProcess@4' as ExitProcess 

section '.text' executable 
main:	
	call 	GetCurrentProcessId
	; OR -- for WinAPI functions
	; stdcall	GetCurrentProcessId ; Call using the stdcall macro
	
	push	eax			; Result of the GetCurrentProcessId
    push    msg
    call    printf
    add     esp, 2*0x04
    ; OR -- for C functions
    ; ccall printf, msg, eax   ; Call using the ccall macro
    
    ; push    0
    ; call    exit
	; Питання -- чого я тут не коригую стек?
	
    ; OR
    ; ccall exit, 0
	; OR
    ; stdcall ExitProcess, 0
    

section '.data' writeable 

msg db "Current process ID is %u.",0x0D,0x0A,0 ; or: 13,10,0 -- CR, LF, NUL -- \r \n \0

