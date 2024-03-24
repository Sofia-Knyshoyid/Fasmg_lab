; Приклад встановлення прапорців.
; Початкова версія взята зі статті
;"Перенос и переполнение - что они представляют
;собой на самом деле?" Чугайнова Н.Г. %
;(\verb http://www.wasm.ru/article.php?article=carry_overflow  )

include 'win32ax.inc'

.code
start:

;===>   Додавання

    mov al, 00111111b   ;//Перенос і переповнення відсутні 
    mov bl, 00000001b   ;//7-й біт: набув значення 0
                ; перенос в 7-й біт: ні   
    add al, bl          ;//Перенос за розрядну сітку - ні 

    mov al, 11111101b   ;//Перенос є, переповнення відсутнє 
    mov bl, 00000101b   ;//7-й біт: набув значення  0
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;//  253 + 5 = 2 (неправильно)
    ; або  -3 + 5 = 2 (правильно) 

    mov al, 11111100b   ;//Перенос є, переповнення відсутнє 
    mov bl, 00000101b   ;//7-й біт: набув значення  0
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 252 + 5 = 1 (неправильно) або   -4 + 5 = 1 (правильно) 

    mov al, 01000000b   ;//Перенос є, переповнення відсутнє 
    mov bl, 11000000b   ;//7-й біт: набув значення  0
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 64 + 192 = 0 (неправильно) або  64 - 64 = 0 (правильно) 

    mov al, 11100000b   ;//Перенос є, переповнення відсутнє 
    mov bl, 01100000b   ;//7-й біт: набув значення  0
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 224 + 96 = 64 (неправильно) або  -32 + 96 = 64 (правильно) 

    mov al, 01100000b   ;//Перенос є, переповнення відсутнє 
    mov bl, 11100000b   ;//7-й біт: набув значення  0
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так  
    ;// 96 + 224 = 64 (неправильно) або  96 - 32 = 64 (правильно) 

    mov al, 11100000b   ;//Перенос є, переповнення відсутнє 
    mov bl, 11100000b   ;//7-й біт: набув значення  1; перенос в 7-й біт:так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 224 + 224 = 192 (неправильно) або  -32 - 32 = -64(правильно) 

    mov al, 11000000b   ;//Перенос є, переповнення відсутнє 
    mov bl, 11000000b   ;//7-й біт: набув значення  1
                ; перенос в 7-й біт: так 
    add al, bl         ;//Перенос за розрядну сітку - так 
    ;// 192 + 192 = 128 (неправильно) або -64 - 64 = -128(правильно) 

    mov al, 11111111b   ;//Перенос є, переповнення відсутнє 
    mov bl, 00000001b   ;//7-й біт: набув значення  0
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 255 + 1 = 0 (неправильно) або -1 + 1 = 0 (правильно) 

    mov al, 11111111b   ;//Перенос є, переповнення відсутнє 
    mov bl, 10000001b   ;//7-й біт: набув значення  1
                ; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 255 + 129 = 128 (неправильно) або -1 - 127 = -128 (правильно) 

    mov al, 11111111b   ;//Перенос є, переповнення відсутнє 
    mov bl, 11000001b   ;//7-й біт: набув значення  1; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 255 + 193 = 192 (неправильно) або -1 - 63 = -64 (правильно) 

    mov al, 11111111b   ;//Перенос є, переповнення відсутнє 
    mov bl, 01000001b   ;//7-й біт: набув значення  0; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 255 + 65 = 64 (неправильно) або  -1 + 65 = 64 (правильно) 

    mov al, 01000000b   ;//Переповнення є, переносу немає 
    mov bl, 01000000b   ;//7-й біт: набув значення  1; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - ні 
    ;// 64 + 64 = 128 (правильно) або  +64 + +64 = -128(неправильно) 

    mov al, 01100000b   ;//Переповнення є, переносу немає 
    mov bl, 01100000b   ;//7-й біт: набув значення  1; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - нет 
    ;// 96 + 96 = 192 (правильно) або +96 + +96 = -64 (неправильно) 

    mov al, 01111111b   ;//Переповнення є, переносу немає 
    mov bl, 00000001b   ;//7-й біт: набув значення  1; перенос в 7-й біт: так 
    add al, bl          ;//Перенос за розрядну сітку - нет 
    ;// 127 + 1 = 128 (правильно) або +127 + +1 = -128 (неправильно) 

    mov al, 10000000b   ;//Есть и перенос,и переполнение 
    mov bl, 10000000b   ;//7-й біт: набув значення  0; перенос в 7-й біт: нет 
    add al, bl          ;//Перенос за розрядну сітку - так 
    ;// 128 + 128 = 0 (неправильно) або -128 - 128 = 0 (неправильно)

;===>   Віднімання

    mov al, 11100000b   ;//Перенос і переповнення відсутні  
    mov bl, 00100000b   ;//Позичання в 7-й біт: нет; Позичання з 7-го біта: нет
    sub al, bl  

    mov al, 00111111b   ;//Перенос є, переповнення відсутнє  
    mov bl, 11111111b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: так  
    sub al, bl  

    mov al, 10000011b   ;//Перенос є, переповнення відсутнє  
    mov bl, 10011010b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: так  
    sub al, bl  

    mov al, 10000000b   ;//Перенос є, переповнення відсутнє  
    mov bl, 10000001b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: так  
    sub al, bl  

    mov al, 10000000b   ;//Перенос є, переповнення відсутнє  
    mov bl, 11000000b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: так  
    sub al, bl  

    mov al, 10001010b   ;//Перенос є, переповнення відсутнє  
    mov bl, 10100101b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: так  
    sub al, bl  

    mov al, 10000000b   ;//Переповнення є, переносу немає  
    mov bl, 01000000b   ;//Позичання в 7-й біт: нет; Позичання з 7-го біта: так     
    sub al, bl  

    mov al, 10000000b   ;//Переповнення є, переносу немає  
    mov bl, 00000001b   ;//Позичання в 7-й біт: нет; Позичання з 7-го біта: так  
    sub al, bl  

    mov al, 01000000b   ;//Відбулося і переповнення і перенос 
    mov bl, 11000000b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: нет  
    sub al, bl  

    mov al, 01100000b   ;//Відбулося і переповнення і перенос 
    mov bl, 10100000b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: нет  
    sub al, bl  

    mov al, 01111111b   ;//Відбулося і переповнення і перенос 
    mov bl, 11111111b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: нет  
    sub al, bl  

    mov al, 01110011b   ;//Відбулося і переповнення і перенос 
    mov bl, 10110111b   ;//Позичання в 7-й біт: так; Позичання з 7-го біта: нет  
    sub al, bl


    invoke  ExitProcess,0

.data
;define bytes
dummy       db  55h;

.end start