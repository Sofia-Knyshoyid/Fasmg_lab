;   Windows 64-bit: Win64 API GUI application.
;	Does not need linking.
; 	(Creates structures needed for linking with dynamic libs by itself).
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.exe hello_win64_gui_selfimportPE.asm 

format PE64 GUI
entry start

include 'win64ax.inc'

section '.code' code readable executable

  start:

	sub     rsp, 0x28  ; Align stack + 0x20 shadow space
		
    mov 	rcx, HWND_DESKTOP
    mov 	rdx, _message
    mov		r8,  _caption
    mov		r9,  MB_OK
    call    [MessageBox]

	;OR
    invoke  MessageBox,HWND_DESKTOP,_message,_caption,MB_OK
    
    xor		rcx, rcx
    call    [ExitProcess]

section '.data' data readable writeable

  _caption db 'Win64 assembly program',0
  _message db 'Hello World!',0

section '.idata' import data readable writeable

  dd 0,0,0,RVA kernel_name,RVA kernel_table
  dd 0,0,0,RVA user_name,RVA user_table
  dd 0,0,0,0,0

  kernel_table:
    ExitProcess dq RVA _ExitProcess
    dq 0
  user_table:
    MessageBox dq RVA _MessageBoxA
    dq 0

  kernel_name db 'KERNEL32.DLL',0
  user_name db 'USER32.DLL',0

  _ExitProcess dw 0
    db 'ExitProcess',0
  _MessageBoxA dw 0
    db 'MessageBoxA',0

section '.reloc' fixups data readable discardable
