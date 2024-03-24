;Приклади простих арифметичних операцій - додавання і віднімання
; example of simplified Win32 programming using complex macro features

include 'win32ax.inc'

.code
    
start:  
;Спочатку віднімаємо  
    ;Завантажуємо в eax,ebx молодші частини 64-бітних чисел
    mov     eax,dword [large1arg]   ;dwod qualifier is essential!
    mov     ebx,dword [large2arg]   ;
    ;Завантажуємо в eсx, edx старші частини 64-бітних чисел
    mov     ecx,dword [large1arg+4] ;dwod qualifier is essential!
    mov     edx,dword [large2arg+4] ;
  
    sub     eax,ebx
    sbb     ecx,edx
    ;Тепер в парі eax:ecx --  результат (в eax -- молодша частина!)
    
    mov     dword [large_dif]   ,eax
    mov     dword [large_dif+4],ecx

;а пізніше додаємо
    ;Завантажуємо в eax,ebx молодші частини 64-бітних чисел
    mov     eax,dword [large1arg]   ;dwod qualifier is essential!
    mov     ebx,dword [large2arg]   ;
    ;Завантажуємо в eсx,edx старші частини 64-бітних чисел
    mov     ecx,dword [large1arg+4] ;dwod qualifier is essential!
    mov     edx,dword [large2arg+4] ;
  
    add     eax,ebx
    adc     ecx,edx
    ;Тепер в парі eax:ecx --  результат (в eax -- молодша частина!)
    
    mov     dword [large_sum]   ,eax
    mov     dword [large_sum+4],ecx


    invoke  ExitProcess,0

.data

large1arg   DQ  346586346346h
large2arg   DQ  346586346345h   ;Differs by 1 !!!
large_dif   DQ  ?           ;? means undefined  
large_sum   DQ  ?           ;? means undefined  

.end start
