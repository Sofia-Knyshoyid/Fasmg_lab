; See Makefile for build instructions

include 'format/format.inc' 
format ELF64

section '.text' executable

public main
; libc
extrn printf
extrn puts
extrn exit
extrn getpid
; our function
extrn add_2 

main:
	push	rbp		    ; Stack should be alinged to 16!

	mov		edi, 5
	mov		esi, 7
	call	add_2

	lea		rdi, [msg] 	; Увага! Автоматично йде відносно RIP!
						; Тому тут lea а не mov. 
						; Фактично тут fasm підставить mov rdi, [rip + msg]
	mov		esi, 5		
	mov		edx, 7		
	mov		ecx, eax	; Результат add_2.
	xor     rax, rax	; Кількість використаних XMM регістрів для variadic arg
	call	plt.printf 		; "printf rdi, esi, edx, ecx"

	xor		edi, edi	; exit code
	call	plt.exit

	; OR: 
	; xor		eax, eax	; exit code
	; pop		rbp
	; ret

section '.data' writeable

msg db "%i + %i = %i",0xA,0
