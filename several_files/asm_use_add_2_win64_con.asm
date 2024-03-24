; See Makefile for build instructions

include 'format/format.inc' 
format ELF64

include 'win64a.inc' 

public main as 'main'
; libc
 extrn 'printf' as printf
 extrn 'puts' as puts
 extrn 'exit' as exit
; our function
 extrn 'add_2' as add_2

section '.data' writeable 
msg db "%i + %i = %i",0xD,0xA,0

section '.text' executable
main:
    sub     rsp, 0x28 ; Align stack and reserve shadow space.
		
	mov		ecx, 5
	mov		edx, 7
	call	add_2
	
	mov		rcx, msg
	mov		edx, 5
	mov		r8d, 7
	mov		r9d, eax	; Результат add_2
	call	printf

	xor		ecx, ecx
	call    exit
	; або cinvoke exit
