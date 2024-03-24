include 'format/format.inc' 

format ELF64

public my_strlen_primitive as 'my_strlen_primitive'
public my_strlen_adv1 as 'my_strlen_adv1'
public my_strlen_strlen as 'my_strlen_strlen'

extrn strlen

;-----------------------------------------
; Хак, щоб не дати заінлайнити.
my_strlen_strlen:	
		call strlen
		ret 

;-----------------------------------------
; Calling convention: x86-64, Windows
; In:
; 	rcx -- pointer to string
; Out
; 	rax -- size

my_strlen_primitive:	
		pushf
		push	rdi
		cld
		mov 	rdi, rcx
		mov		rcx, -1
		xor 	al, al
		repne	scasb
		not		rcx
		dec 	rcx	
		mov 	rax, rcx;
		pop		rdi
		popf
		ret
		
;-----------------------------------------
; Взято за основу: https://gist.github.com/faissaloo/e28b55b0e4671132f522
; 
my_strlen_adv1:
	push	rdi
	mov		rdx, rcx
    mov rdi, rcx            ;Initialise scasw with the value passed to us in ecx
    ;We're not getting the coder to send it directly to edi because we're still
    ;going to need to get the difference between them later to determine the
    ;actual length
    xor	ecx, ecx            ;Fast way to set ecx to 0
_s:
    mov ecx,[rdi]           ;edi holds the pointer to the word in memory, so copy that word in memory to ecx so we can use it
    add rdi,4               ;Move to the next 'word'+1 (because we'll be decreasing from it)
    and ecx, 0x7F7F7F7F     ;Masks out the highest bit of each byte (char), to ENSURE that byte level overflows from the subtraction will not propagate beyond the highest bit.
    ;These are the 'magic numbers' ripped from glibc
    sub ecx, 0x01010101
    and ecx, 0x80808080
    xor ecx, 0              ;Compare ecx with 0, if ecx is 0 it means that there are no NULL characters in it
    jz _s ;If none of them were zeros loops back to s
    ;otherwise let's track down the one that was zero which will be represented a 0x80
    sub rdi, 4      ;Remove the 'add edi, 4' that we did before
    ; mov edx again, so that we can test the actual value, since our cool magic
    ; number stuff that we did before destroys edx, which means that character
    ; 128 will cause misfires
    mov ecx,[rdi]
    test ecx, 0xFF
    jz _strlenEnd


    inc rdi
    test ecx, 0xFF00
    jz _strlenEnd


    inc rdi
    test ecx, 0xFF0000
    jz _strlenEnd

    inc rdi
    test ecx, 0xFF000000
    jnz _strlenEnd ;If it was a misfire, go back and continue
    
_strlenEnd:	
	mov rax, rdi
	sub rax, rdx
	pop rdi	
    ret		
	
;=============================================

