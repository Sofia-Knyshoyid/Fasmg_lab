format pe64 console

include 'win64axp.inc' 


; Some magic: https://en.cppreference.com/w/c/io/setvbuf
_IONBF  equ 4       ; no buffering
_IOLBF  equ 64      ; line buffering
_IOFBF  equ 0       ; full buffering

cr      equ 0xD ;    13
lf      equ 0xA ;    10

entry start 

section '.data' data readable writeable 

vbyte1          db 0

vint1           dd 0
vint2           dd 0
vint3           dd 0
vint4           dd 0
vint5           dd 0

le_demo         dd 0x12345678

vlong1          dq 0
vlong2          dq 0
vlong3          dq 0
vlong4          dq 0
vlong5          dq 0

vdouble1        dq  1.23
vdouble2        dq  4.56
vdouble3        dq  0.0
vdouble4        dq  0.0
vdouble5        dq  0.0

        align   16
vect_double_1   dq 1.23, 3.45       
vect_double_2   dq 1.11, 2.22
vect_double_3   dq 0.0 , 0.0


res_str_int     db '%i + %i = %i',cr,lf,0 
; lld -- Windows specific printf modifier for 64 bit integer
res_str_long    db '%lld + %lld = %lld',cr,lf,0 

res_int         db '%i',cr,lf,0

get_2_ints_str  db ' %i %i'

sample_str      db '1234', 0

section '.text' code executable readable 

start:
        sub     rsp, 0x8              ; 40d
        call    setup_std_files
        ; Якщо не вимкнути буферизацію, часто буде 
        ; погано. А fflush кожен раз робити -- лінь.
        cinvoke setvbuf, [stdout], 0, _IONBF, 0
        ;cinvoke fflush, [stdout]
        
        
        mov     eax, 13
        mov     ebx, 42
        add     eax, ebx
        
        ; Небезпечний код! Див. комент нижче! 
        cinvoke printf, res_int, eax 

        mov     [vbyte1], 0xF0
        movzx    EAX, byte [vbyte1]
        ; Небезпечний код! Див. комент нижче! 
        cinvoke printf, res_int, eax 

        movsx    EAX, byte [vbyte1]
        ; Небезпечний код! Див. комент нижче! 
        cinvoke printf, res_int, eax 

        
        mov     eax, 13
        mov     [vint1], eax    ; save eax
        mov     ebx, 42
        add     eax, ebx
        mov     [vint2], ebx    ; copy
        mov     [vint3], eax    ; copy
        
        cinvoke printf, res_str_int, [vint1], [vint2], [vint3]
        ; Так буде сміття на виході -- cinvoke 
        ; записує в rcx вказівник на res_str_int     
        ; cinvoke printf, res_str_int, ecx, ebx, eax
        
        
        mov     rax, 13
        mov     [vlong1], rax   ; copy
        mov     rbx, 42
        add     rax, rbx
        mov     [vlong2], rbx   ; copy
        mov     [vlong3], rax   ; copy
        
        cinvoke printf, res_str_long, [vlong1], [vlong2], [vlong3]
        
;-----------------------------------------
        
        cinvoke puts, "Enter two numbers:"
        cinvoke scanf, ' %i %i', vint1, vint2
        cinvoke printf, 'Entered %i and %i', [vint1], [vint2]
        cinvoke puts, ""
        
        mov     eax, [vint1]
        add     eax, [vint2]
        mov     [vint3], eax
        
        cinvoke printf, 'Sum = %i', [vint3]
        cinvoke puts, ""
        
        mov     eax, [vint1]
        cmp     eax, [vint2]    ; Робить sub, виставляє rflags, відкидає результа
        jb      second_is_less; Jump if below  -- CF=1      
        cinvoke printf, 'Max = %i', [vint1]     
        jmp     end_of_if_1
second_is_less:     
        cinvoke printf, 'Max = %i', [vint2]     
end_of_if_1:        
        cinvoke puts, ""
;-----------------------------------------  
        mov     eax, [vint1]
        cmp     eax, [vint2]    ; Робить sub, виставляє rflags, відкидає результа
if_2:       
        jb      ._second_is_less; Jump if below  -- CF=1        
        jz      ._are_equal     ; Jump if zero   -- ZF=1        
        cinvoke puts, 'First is larger'
        jmp     ._end_of_if
._are_equal:        
        cinvoke puts, 'Numbers are equal'
        jmp     ._end_of_if
._second_is_less:       
        cinvoke puts, 'Second is larger'
._end_of_if:        


;-----------------------------------------      
    ;   FPU x87
        fld     qword [vdouble1]    ; Load double
        ; ST0 = vdouble1
        fld     qword [vdouble2]    ; Load double
        ; ST0 = vdouble2, ST1 = vdouble1
        faddp   ; ST0 <= ST0 + ST1  
        fst     qword [vdouble3]        
        cinvoke printf, '%f + %f = %f', [vdouble1], [vdouble2], [vdouble3]
        cinvoke puts, ''
        
    ;   SSE2, scalar
        MOVSD   XMM0, [vdouble1]
        MOVSD   XMM1, [vdouble2]
        ADDSD   XMM0, XMM1
        MOVLPD  [vdouble3], XMM0
        cinvoke printf, '%f + %f = %f', [vdouble1], [vdouble2], [vdouble3]
        cinvoke puts, ''
    
    ;   SSE2, vector, aligned
        MOVAPD  XMM0, dqword [vect_double_1]
        MOVAPD  XMM1, dqword [vect_double_2]
        ADDPD   XMM0, XMM1
        MOVAPD  dqword [vect_double_3], XMM0
        cinvoke printf, '[%f, %f] + [%f, %f] = [%f, %f]', \
                [vect_double_1], [vect_double_1 + 8], \
                [vect_double_2], [vect_double_2 + 8], \
                [vect_double_3], [vect_double_3 + 8]
        cinvoke puts, ''
        
;-----------------------------------------
        mov     rdi, sample_str
        call    my_strlen_primitive
        mov     [vlong1], rcx
        mov     [vlong2], rdi
        xor     eax, eax
        mov     al, [rdi]
        mov     [vint1], eax
        mov     al, [rdi-1]
        mov     [vbyte1], al
        cinvoke printf, 'String: |%s| length is %lld, last byte: %i, last char: "%c"', \
                sample_str, [vlong1], [vint1], [vbyte1]
        cinvoke puts, ''
        
;-----------------------------------------

        cinvoke exit, 0

;-----------------------------------------
; In:
;   rdi -- pointer to string
; Out
;   rcx -- size
;   rdi -- pointer to zero byte
my_strlen_primitive:    
        pushf
        cld
        mov     rcx, -1
        xor     al, al
        repne   scasb
        not     rcx
        dec     rcx 
        dec     rdi 
        popf
        ret
;-----------------------------------------

setup_std_files: ; Some windows 64x magic. Fix to be crossplatform!
        mov rdx, [_iob]             ; msvcrt _iob

        lea rax, [rdx+(8*6)*0]      ; stdin
        mov [stdin], rax
        lea rax, [rdx+(8*6)*1]      ; stdout
        mov [stdout], rax
        lea rax, [rdx+(8*6)*2]      ; stderr
        mov [stderr], rax       
        ret 

section '.data' data readable writeable 
stdin   dq 0
stdout  dq 0
stderr  dq 0
    
section '.import' import data readable 

library kernel32,'kernel32.dll',\ 
    msvcrt,'msvcrt.dll'    ;; C-Run time from MS. This is always on every windows machine 

import kernel32,\
          ExitProcess,'ExitProcess' 
import msvcrt,\
          printf,'printf',\ 
          puts,'puts',\ 
          fprintf,'fprintf',\ 
          scanf,'scanf',\ 
          getchar,'getchar', \
          gets,'gets', \
          fflush,'fflush', \
           _iob,'_iob',\
           setvbuf,'setvbuf',\
          exit,'exit', \
          _exit,'_exit'

