;Приклади використання умовних переходів
;Тривіальні випадки та іллюстрація встановлення прапорців
;
;1.)Порівняння з константою
;1.)Порівняння регістрів
;1.)Перенос
;1.)Поведінка inc i dec по відношенню до CF
;1.)Переповнення
;Принципи встановлення прапорців, зокрема пари CF - OF, див у відповідну главу та приклад

include 'win32ax.inc'

.code
    
start:
            ;Тривіальний випадок
            mov         eax,10h         
            cmp     eax,0
            ;Значення арифметичних прапорців після команди порівняння:
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  0 |  0 |  0 |  0 |  0 |  0 |
            
            ;також для іллюстрації можна було зробити ось так наприклад:
            ;xor    ebx,ebx ; <== обнуляємо ebx
            ;cmp    eax,ebx
            
            jne     The_eax_is_not_0
            ;Ми не повинні потрапити сюди.
            ;Вставимо тут команду, яка звернеться до Windows з проханням сказати про це користувачу
            ;Якщо це все ж таки сталося:
            
            invoke  MessageBox,HWND_DESKTOP,Serious_err_msg1,"Win32 Assembly",MB_ICONERROR+MB_OK
            ;Serious_err_msg1 --- адрес стрічки з повідомленням про помилку, див. секцію .data 
            invoke  ExitProcess,1001h

The_eax_is_not_0:
            
            mov     ebx,10h
            cmp     eax,ebx
            ;Значення арифметичних прапорців після команди порівняння:
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  0 |  1 |  0 |  1 |  0 |  0 |
            
            jz      The_a_n_b_equal
            ;інша мнемоніка je
            invoke  MessageBox,HWND_DESKTOP,Serious_err_msg1,"Win32 Assembly",MB_ICONERROR+MB_OK
            invoke  ExitProcess,1002h

The_a_n_b_equal:
            ;А тепер зробимо перенос:
            xor         eax,eax     ;eax==0
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  0 |  1 |  0 |  1 |  0 |  0 |
            not     eax     ;eax==0FFFFFFFFh - всі біти дорівнюють 1
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  0 |  1 |  0 |  1 |  0 |  0 |
            add     eax,1h      ;створюємо перенос за межі розрядної сітки
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  1 |  1 |  1 |  1 |  0 |  0 |
            ; Зверніть увагу:
            ;cf встановлено - відбувся перенос з передостаннього (30-го при нумерації з нуля!)
            ;         біта в останній 31-й
            ;pf встановлено - кількість отриманих одиничок - 0, є парною            
            ;af встановлено - відбувся перенос з перших 3-го біта в 4-тий
            ;zf встановлено - результат дорівнює нулю
            ;sf дорівнює нулю - знака немає
            ;of дорівнює нулю - так як відбувся і перенос за межі розрядної сітки і перенос в біт знаку
            jc      The_carry_1

            invoke  MessageBox,HWND_DESKTOP,Serious_err_msg1,"Win32 Assembly",MB_ICONERROR+MB_OK
            invoke  ExitProcess,1002h

The_carry_1:
            ;Перевіримо чи справді inc i dec не ствновлюють CF
            xor         eax,eax     ;eax==0
            not     eax     ;eax==0FFFFFFFFh - всі біти дорівнюють 1
            inc     eax     ;створюємо перенос за межі розрядної сітки          
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  0 |  1 |  1 |  1 |  0 |  0 |
            jnc     The_no_carry_1 ; переносу не має бути
            
            invoke  MessageBox,HWND_DESKTOP,Serious_err_msg1,"Win32 Assembly",MB_ICONERROR+MB_OK
            invoke  ExitProcess,1003h
            
The_no_carry_1:     
            jz      The_zero_2 ; але результат має дорівнювати нулю

            invoke  MessageBox,HWND_DESKTOP,Serious_err_msg1,"Win32 Assembly",MB_ICONERROR+MB_OK
            invoke  ExitProcess,1004h
            
The_zero_2:     
            ;і на остаток, встановимо прапорець переповнення
            mov     eax,07FFFFFFFh;Всі біти крім старшого дорівнюють нулеві.
            add     eax,1;
            ;| CF | PF | AF | ZF | SF | OF |  
            ;|  0 |  1 |  1 |  0 |  1 |  1 |
            jo      The_overflow_1

            invoke  MessageBox,HWND_DESKTOP,Serious_err_msg1,"Win32 Assembly",MB_ICONERROR+MB_OK
            invoke  ExitProcess,1004h

The_overflow_1:         
            
            
            invoke  ExitProcess,0

.data

dummy_byte      db  2h;

Serious_err_msg1    db  "Увага! Поява цього вікна свідчить про серйозні проблеми з Вашим процесором!!!\n",\
                "Насправді, дивно як він взагалі зміг вивести дане вікно...",0
.end start
