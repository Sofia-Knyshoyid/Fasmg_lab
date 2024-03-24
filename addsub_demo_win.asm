; Приклад встановлення прапорців.
; Початкова версія взята зі статті
;"Перенос и переполнение - что они представляют
;собой на самом деле?" Чугайнова Н.Г. %
;(\verb http://www.wasm.ru/article.php?article=carry_overflow  )

include 'win32ax.inc'

.code
    

  start:
        mov     al, 1h
        mov     bl, 2h
        add     al, bl
        mov     [res_b], al
        
        mov     eax, [first_dw]
        add     eax, [second_dw]

;---------------------------------------------------------
        mov     ax,0FFF0h
        mov     bx,0FFFFh
        sub     ax,bx   ;ax=0FFF1h, CF,SF,AF Are Set

        sub     al,al   ;Set ZF=1, SF=0
        
        mov         al, 10000000b ;//Перенос есть,переполнения нет  
        mov         bl, 10000001b ;//Заем в 7-й бит: есть; заем из 7-го бита: есть  
        sub         al, bl  
        
        sub     al,al   ;Set ZF=1, SF=0

        mov         al, 11111110b ;//Перенос есть,переполнения нет  
        mov         bl, 11111111b ;//Заем в 7-й бит: есть; заем из 7-го бита: есть  
        sub         al, bl  

        
    ;invoke MessageBox,HWND_DESKTOP,"Hi! I'm the example program!","Win32 Assembly",MB_OK
    invoke  ExitProcess,0

.data
;define bytes
first_b     db  55h;
second_b        db  66h;
third_b     db  77h;
res_b           db  ?

;define words
first_w     dw  2929h;
second_w        dw  4848h;
third_w     dw  2425h;
res_w       dw  ?

;define double words
first_dw        dd  33333333h;
second_dw       dd  44444444h;
third_dw        dd  99999999h;
res_dw      dd  ?

.end start
