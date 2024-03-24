;Приклади множення

include 'win32ax.inc'

.code

  start:
;=======>   imul
;==>Найпростіша форма, присутня вже в 8086
;1-байтова
            mov     al,5h;
            mov     bl,10h
            
            imul        bl      ;ax:=al*bl=50h
            
            mov     al,5h
            imul        [first_db]  ;ax:=al*[first_db]=5h*2h=0Ah
                            ;CF=0, OF=0
            
            mov     al,-5h  ;al=(-5h)=0FBh
            imul        [first_db]  ;ax:=al*[first_db]=-5h*2h=(-0Ah)=0F6h
                            ;CF=1, OF=1
;4-байтов -- подвіне слово            
            mov     eax,100h
            mov     ebx,200h
            
            imul        ebx     ;eax=20000h, edx=0; CF=0, OF=0

            imul        [first_dw]  ;На вході:   eax=20000h, first_dw=10000h;
                            ;На виході: edx=2,eax=0,CF=1,OF=1
                            ;справді, 20000h*10000h=2_00000000;
;Результат виконання такої форми imul завжди поміститься в цільовому регістрі!

;==>Регістр на безпосереднє значення, результат -- в той же регістр
    ;Множимо на 1-байтову величину
            ;на даний момент EBX=200h
            imul        ebx,10h;    тепер EBX=2000h

    ;Множимо на 4-байтову величину (подвійне слово)
            imul        ebx,100h;   тепер EBX=200000h

    ;Ще раз, тепер результат не вміщається в EBX, CF=1, OF=1, те що не помістилося, відкинуте!
            imul        ebx,10000h;     тепер EBX=0h
    
;==>Регістр на регістр, результат -- в перший аргумет.
            mov     eax,10h
            mov     ebx,20h
            
            imul        eax,ebx ;eax=200h

;==>imul    regDW1, regDW2 | memDW2, immB/immDW   : regDW1 <-- regDW2 | memDW * immB (or immDW)
            ;тут eax=200h
            imul        ebx,eax,20h;    ebx=4000h

;---------------------------------------------------------------------------
;=======>   mul
;Для цієї команди існує лише форма з одним аргументом 
            mov     eax,[first_dw]
            mov     ebx,[second_dw]
            
            mul     ebx     ;10000h*4000h=40000000h => eax=40000000h,edx=0;
                            ;CF=0, OF=0

    invoke  ExitProcess,0

.data
;define bytes
first_db        db  2h;
second_db       db  4h;


;define double words
first_dw        dd  10000h;
second_dw       dd  4000h;

.end start
