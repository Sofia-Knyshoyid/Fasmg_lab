;Прості приклади роботи зі стеком. Відповідає главі "Стек"
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
    
        ;повідомляємо Windows про завершення нашої програми
        invoke  ExitProcess,0

.end start
