;   Windows 32-bit: Win32 API GUI application.
;	Does not need linking.
; 	(Creates structures needed for linking with dynamic libs by itself).
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.exe hello_win32_gui_selfimportPE.asm 

format PE GUI
entry start

include 'win32ax.inc'

section '.code' code readable executable

  start:

;Method 1
    push    MB_OK
    push    _caption
    push    _message
    push    HWND_DESKTOP
    call    [MessageBox]

;Method 2
    invoke  MessageBox,HWND_DESKTOP,_message,_caption,MB_OK
    
    push    0
    call    [ExitProcess]

section '.data' data readable writeable

  _caption db 'Win32 assembly program',0
  _message db 'Hello World!',0

section '.idata' import data readable writeable

  dd 0,0,0,RVA kernel_name,RVA kernel_table
  dd 0,0,0,RVA user_name,RVA user_table
  dd 0,0,0,0,0

  kernel_table:
    ExitProcess dd RVA _ExitProcess
    dd 0
  user_table:
    MessageBox dd RVA _MessageBoxA
    dd 0

  kernel_name db 'KERNEL32.DLL',0
  user_name db 'USER32.DLL',0

  _ExitProcess dw 0
    db 'ExitProcess',0
  _MessageBoxA dw 0
    db 'MessageBoxA',0

section '.reloc' fixups data readable discardable
