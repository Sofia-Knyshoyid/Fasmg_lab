;   Windows 32-bit: Win32 API console application. Does not need linking.
; 	(Creates structures needed for linking with dynamic libs by itself).
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.exe hello_win32_con_selfimport.asm

format PE console

entry start 

include 'win32axp.inc' 

section '.text' code executable readable 
start:
		call 	[GetCurrentProcessId]
		; OR -- for WinAPI functions
		; invoke 	GetCurrentProcessId  ; Call using the invoke macro
		
		push	eax			; Result of the GetCurrentProcessId
        push    msg
        call    [printf]
        add     esp, 2*0x04
        ; OR -- for C functions
        ; ccall printf, msg, eax	; Call using the ccall macro -- 
        ; гляньте також, які інструкції вставить такий виклик:
        ; ccall printf, msg, 1, 2, 3, 4, 5, 6, 7
        
        push    0
        call    [exit]
        ; OR 
        ; ccall exit, 0
		; OR 
		; invoke 	ExitProcess, 0
        ; Питання -- чого я тут не коригую стек?

section '.data' data readable writeable 
msg db "Current process ID is %u.",0x0D,0x0A,0 ; or: 13,10,0 -- CR, LF, NUL -- \r \n \0

section '.import' import data readable 

library msvcrt,'msvcrt.dll',\  ; C Runtime code from MS. This is always 
						    \  ; present on every windows machine 							
		kernel,'kernel32.dll'

import msvcrt,\
          printf,'printf',\ 
          exit,'exit'

import kernel,\
          GetCurrentProcessId,'GetCurrentProcessId',\
		  ExitProcess,'ExitProcess'
		  