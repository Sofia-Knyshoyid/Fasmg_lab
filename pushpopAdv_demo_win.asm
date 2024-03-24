;Більш складні приклади роботи зі стеком. Відповідає главі "Стек"
; 
include 'win32ax.inc'

.code
    
start:
        mov     eax,12345678h;
        mov     ebx,2000h;
    
        push    eax
        push    ebx
    
        pop         eax
        pop         ebx
    
        push        [first]
        pop     [second]
    
        push        [ds:first]  ;questionably
        pop     [es:third];questionably 

        ;повідомляємо Windows про завершення нашої програми
        invoke  ExitProcess,0

.data
    
first       DD  11h 
second  DD  12h
third       DD  13h
.end start
