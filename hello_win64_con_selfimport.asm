;   Windows 64-bit: Win64 API console application. Does not need linking.
; 	(Creates structures needed for linking with dynamic libs by itself).
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.exe hello_win64_con_selfimport.asm

include 'win64a.inc' 

format PE64 console

entry start 

section '.text' code executable readable 
start:
        sub     rsp, 0x8    	; Stack should be aligned to 16 = 0x10
								; This and the next command of course can 
								; be replaced by the "sub rsp, 0x28"        
        sub     rsp, 0x20     	; Reserve shadow space!
		
		call 	[GetCurrentProcessId]
		
        mov     rcx, msg
		mov		rdx, rax 		; rax == result of the GetCurrentProcessId
        call    [printf]
        add     rsp, 0x20
        ; або 
        ; invoke printf, msg, rax
        ; гляньте також, які інструкції вставить такий виклик:
        ; invoke printf, msg, 1, 2, 3, 4, 5, 6, 7
        
        sub     rsp, 0x20     
        xor     ecx, ecx
        call    [exit]
        ; або cinvoke exit

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
