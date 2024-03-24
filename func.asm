include 'format/format.inc'
format ELF64
section '.text' executable

; C prototype: void func (uint64_t* input_array, size_t size);
; bubble sort

; Linux x64 calling convention:
; input_array --> RDI
; size --> RSI

    public func

func:
    mov R8, 0
	jmp func1

swapfunc:

    mov [RDI + R9*8], R12
    mov [RDI + R13*8], R11
    jmp continue

; size is in RSI
func1:
    mov R13, 1
    mov R9, 0
    jmp func2

    func2:
        mov R11, [RDI + R9*8]  ; arr[j]
        mov R12, [RDI + R13*8]  ; arr[j+1]
        cmp R11, R12
        ja swapfunc

    continue:
        inc R9
        inc R13
        cmp RSI, R13
        ja func2

	inc R8
	cmp RSI, R8
	ja func1
    jmp endd
    endd:
        xor rax, rax
        ret

