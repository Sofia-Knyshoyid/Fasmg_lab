; See Makefile for build instructions

include 'format/format.inc' 

format ELF64

section '.text' executable

public main

; C prototype: void foo(double* a, double* b, double* x, size_t size);
; a*x + b = 0
; Linux x64 calling convention:
; a --> RDI
; b --> RSI
; x --> RDX
; size --> RCX

main:
	mov R8, 0
	MOVSD XMM0, qword [RDI]
	MOVSD XMM1, qword [RSI]
	MOVSD XMM2, qword [RDX]
	call func
func:
	mov RCX, RCX ;cycle

	myloop:
		MOVSD XMM0, qword [RDI + R8*8]
		MOVSD XMM1, qword [RSI + R8*8]

		DIVPD XMM1, XMM0 ;devision
		inc R8

		MOVSD [RDX + R8*8], XMM1
		loop myloop
	ret


