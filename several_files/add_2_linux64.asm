; See Makefile for build instructions

include 'format/format.inc' 

format ELF64

section '.text' executable

public add_2

; C prototype: int add(int a, int b)
; Linux x64 calling convention: 
; a --> EDI
; b --> ESI
; res --> EAX
; 
add_2:
; We do not call other functions so stack aligning and 
; stack frame are unnecessary.
	; push	rbp		    ; Stack should be alinged to 16.
	
	add 	ESI, EDI
	mov		EAX, ESI
	; pop		rbp
	ret

section '.data' writeable

