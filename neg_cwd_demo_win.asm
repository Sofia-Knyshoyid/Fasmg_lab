;Приклади використання команди neg та cwd

include 'win32ax.inc'

.code

  start:
    mov     al,11h
    neg         al                  ;al=EFh=(-11h)
    neg         al                  ;al=11h

    mov     eax,0ABCDh  
    neg         eax                 ;eax=0FFFF5433h

    neg         byte [first_b]      ;[first_b]=(-2h)=0FEh

    
    mov     ax, 0FFF0h
    cwd                 ;ax=0FFF0h, dx=0FFFFh
    mov     ax, 010h
    cwd                 ;ax=010h, dx=00h

    mov     ax,0FFF0h
    cwde                ;eax=0FFFFFFF0h 
    
    invoke  ExitProcess,0

.data
;define bytes
first_b     db  2h;
.end start
