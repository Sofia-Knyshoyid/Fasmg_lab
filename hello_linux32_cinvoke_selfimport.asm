;   Linux 32-bit self-contained (no separate linking) 
;   dynamic executable using libc. 
;   Uses cinvoke macro.
;	Does not needs linking.
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux32_cinvoke_selfimport.asm 
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;	chmod +x hello_linux32_cinvoke_selfimport  # To execute assembled application
	
include 'format/format.inc' 
include 'macro/lin/import32.inc'
include 'macro/proc32.inc'

format ELF executable ELFOSABI_LINUX
entry start

interpreter '/lib/ld-linux.so.2'
needed 'libc.so.6'
import printf,puts,exit,getpid

segment readable executable

start:
    cinvoke getpid
    cinvoke printf,msg,EAX
    cinvoke exit

segment readable writeable

msg db "Current process ID is %d.",0xA,0
