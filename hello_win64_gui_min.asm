;   Windows 64-bit: Win64 API GUI application extensively using complex macro features.
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.exe hello_win64_gui_min.asm 

include 'win64ax.inc'

.code

start:
    invoke  MessageBox,HWND_DESKTOP,"Hi! I'm the example program!","Win64 Assembly",MB_OK
    invoke  ExitProcess,0

.end start
