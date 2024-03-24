; See Makefile for build instructions

include 'format/format.inc'

format ELF64
extrn printf
extrn func

section '.text' executable

public main

; C prototype: void func (uint64_t* input_array, size_t size);
; bubblesort
; Linux x64 calling convention:
; arr1 --> RDI
; size --> RSI

main:
	push rbp
	MOV RDI, arr1
	MOV RSI, [size]

	call func
	lea RDI, [msg]
	MOV R9, 0
	;MOV RCX, [size]

	;mov RCX, 3
pr_func:
     push RDI
     push RSI
     push R9

     sub rsp, 8
     mov R8, [RDI + R9*8]
     ;MOV RAX, 0
     mov RSI, R8
     call plt.printf
     add rsp, 8

     pop R9
     pop RSI
     pop RDI

     MOV RDI, arr1
     MOV RSI, [size]
     lea RDI, [msg]
     inc R9
     cmp R9, RSI
     jl pr_func
     pop rbp
     ret



section '.data' writeable
arr1 dq 3, 5, 6, 2
size dq 4
msg db "%lu ",0xA,0