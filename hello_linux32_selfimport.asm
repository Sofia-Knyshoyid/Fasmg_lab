;   Linux 32-bit self-contained. Does not need linking.
;   Produces dynamic executable which uses libc. 
; 	(Creates structures needed for linking with dynamic libs by itself).
;
; Сompile the source:
;   INCLUDE=x86/include ./fasmg.x64 hello_linux32_selfimport.asm
;
; Sometimes you will needed:
;	chmod +x fasmg.x64 # Before using fasmg.x64
;	chmod +x hello_linux32_selfimport  # To execute assembled application

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
    call    [getpid]
    push    eax     
    push    msg 
    call    [printf]
    push    0
    call    [exit]

segment readable writeable

msg db "Current process ID is %d.",0xA,0
