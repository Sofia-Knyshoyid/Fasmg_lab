;   Windows 32-bit: Win32 API GUI application extensively using complex macro features.
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.exe hello_win32_gui_min.asm 

include 'win32ax.inc'

.code

start:
    invoke  MessageBox,HWND_DESKTOP,"Hi! I'm the example program!","Win32 Assembly",MB_OK
    invoke  ExitProcess,0

.end start
