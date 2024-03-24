;Приклад викликі підпрограм

include 'win32ax.inc'

.code
    

  start:
    
;====>      
        mov     eax,10h
        call        mul_by_3_eax
        mov     [mul_reg_res],eax
        
;====>              
        call        mul_by_3_global
                ;Uses global variable, OBSCURE!!!!
        mov     eax,[global_var]
                ;Забираємо результат :-)
        mov     [mul_global_res],eax
        
;====>      
        push        10h ;Аргумент --- в стек
        call        mul_by_3_stack
        pop     eax ;Результат --- в EAX
        mov     [mul_stack_res],eax
        
;====>      
    
        push        [arg_1]
        push        [arg_2]
        call        add_from_stack
        pop     [add_res]
        
        invoke  ExitProcess,0

mul_by_3_eax:
        imul        eax,eax,3h
        ret

mul_by_3_global:
        push        eax ;Збережемо EAX --- його значення може бути потрібно основній програмі
        mov     eax,[global_var]
        imul        eax,eax,3h
        mov     [global_var], eax
        pop     eax ;Відновлюємо EAX
        ret
        
mul_by_3_stack:
        push        ebp     ;Зберігаємо EBP
        mov         ebp,esp 
        add     ebp,4+4 ;адреса повернення + збережений EBP
                ;В EBP кладемо вершину стека перед викликом 
                                ;підпрограми для доступу до наших параметрів
                                ;щоб не відволікатися на зміни
                                ;вершини стека в процесі роботи підпрограми
        push        eax
        mov         eax,[ebp]
                        ;Це -- найважливіший рядок
                        ;Ми звертаємося до останнього подвійного слова,
                        ;покладеного в стек перед викликом підпрограми.

        imul        eax,eax,3h  ;Нарешті множимо

        mov         [ebp],eax
                        ;Повертаємо результат в стек

        pop         eax     ;Відновлюємо EAX
        pop         ebp     ;Відновлюємо EBP
        ret

add_from_stack:
        push        ebp     ;Зберігаємо EBP
        mov         ebp,esp 
        add     ebp,4+4 ;адреса повернення + збережений EBP
                ;В EBP кладемо вершину стека перед викликом 
                                ;підпрограми для доступу до наших параметрів
                                ;щоб не відволікатися на зміни
                                ;вершини стека в процесі роботи підпрограми
        push        eax
        push        ebx
        mov         eax,[ebp+4]
                        ;Перший аргумент, покладено у стек раніше
                        ;Тому знаходиться глибше, аж на 4 байти.
        mov         ebx,[ebp]
                        ;Другий аргумент

        add         eax,ebx  ;Додаємо

        mov         [ebp+4],eax
                        ;Повертаємо результат в стек

        pop         ebx     ;Відновлюємо EBX
        pop         eax     ;Відновлюємо EAX
        pop         ebp     ;Відновлюємо EBP
        ret         4       ;<== викидаємо зі стеку зайве
                      ;подвійне слово --- другий доданок

.data
global_var          DD          10h

mul_reg_res     DD          ?
mul_global_res      DD          ?
mul_stack_res       DD          ?

arg_1               DD          15h
arg_2               DD          10h
add_res         DD          ?


.end start
