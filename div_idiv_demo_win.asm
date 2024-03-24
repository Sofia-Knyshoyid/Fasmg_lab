;Приклади ділення

include 'win32ax.inc'

.code

  start:
;=======>   idiv
;==>Найпростіша форма, присутня вже в 8086
;1-байтова       
            mov     ax,51h;
            mov     bl,10h
            
            idiv        bl      ;al=5h (частка),ah=1h (остача)
            
            mov     ax,15h
            idiv        [first_db]  ;al=0Ah,ah=1h
                            
            
            mov     ax,-5h  ;ax=(-5h)=0FFFBh
            idiv        [first_db]  ;al=(-2h)=0FEh
                            ;ah=(-1h)=0FFh

;4-байтов -- подвіне слово            
            mov     edx,2h
            mov     eax,0h
            mov     ebx,40h
            
            idiv        ebx     ;2 00000000h/40h = 8000000h
                            ;eax=8000000h, edx=0h
;=======>   div
            mov     edx,2h
            mov     eax,0h
            mov     ebx,51h
            
            div     ebx     ;2 00000000h/51h = 06522C3Fh
                            ;eax=06522C3Fh, edx=11h

    invoke  ExitProcess,0
.data
;define bytes
first_db        db  2h;
second_db       db  4h;


;define double words
first_dw        dd  10000h;
second_dw       dd  4000h;

.end start
