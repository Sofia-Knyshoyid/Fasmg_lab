; See Makefile for build instructions

include 'format/format.inc' 
format ELF64

section '.text' executable

public add_2

; C prototype: int add(int a, int b)
; Windows x64 calling convention: 
; a --> ECX
; b --> EDX
; res --> EAX
; 
add_2:
; We do not call other functions so stack aligning  
; and stack frame are unnecessary. Looks like shadow space 
; should be reserved so we also align the stack
	sub     rsp, 0x20 + 0x08
		
	add 	ECX, EDX
	mov		EAX, ECX
	
	add     rsp, 0x20 + 0x08
	ret

section '.data' writeable

