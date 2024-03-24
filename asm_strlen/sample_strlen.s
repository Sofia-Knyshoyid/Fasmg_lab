	.file	"sample_strlen.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Std. strlen: %zu\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Std. strlen called by asm: %zu\n"
	.section	.rodata.str1.1
.LC2:
	.string	"Primitive asm strlen: %zu\n"
.LC3:
	.string	"Advanced asm strlen: %zu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB50:
	.file 1 "sample_strlen.c"
	.loc 1 10 1 view -0
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	.loc 1 11 2 view .LVU1
.LVL0:
	.loc 1 12 2 view .LVU2
	.loc 1 12 15 is_stmt 0 view .LVU3
	mov	edi, 100000001
	call	malloc@PLT
.LVL1:
	mov	rbp, rax
.LVL2:
	.loc 1 13 2 is_stmt 1 view .LVU4
	.loc 1 13 10 is_stmt 0 view .LVU5
	mov	BYTE PTR 100000000[rax], 0
	.loc 1 14 2 is_stmt 1 view .LVU6
.LBB11:
	.loc 1 14 6 view .LVU7
.LVL3:
	.loc 1 14 13 is_stmt 0 view .LVU8
	mov	ebx, 0
.LVL4:
.L2:
	.loc 1 14 20 is_stmt 1 discriminator 1 view .LVU9
	.loc 1 14 2 is_stmt 0 discriminator 1 view .LVU10
	cmp	rbx, 99999999
	ja	.L5
	.loc 1 15 3 is_stmt 1 discriminator 3 view .LVU11
	.loc 1 15 13 is_stmt 0 discriminator 3 view .LVU12
	call	rand@PLT
.LVL5:
	.loc 1 15 19 discriminator 3 view .LVU13
	movsx	rdx, eax
	imul	rdx, rdx, -1240768329
	shr	rdx, 32
	add	edx, eax
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	edx, edx, 90
	sub	eax, edx
	mov	edx, eax
	.loc 1 15 22 discriminator 3 view .LVU14
	add	edx, 32
	.loc 1 15 11 discriminator 3 view .LVU15
	mov	BYTE PTR 0[rbp+rbx], dl
	.loc 1 14 26 is_stmt 1 discriminator 3 view .LVU16
	add	rbx, 1
.LVL6:
	.loc 1 14 26 is_stmt 0 discriminator 3 view .LVU17
	jmp	.L2
.L5:
	.loc 1 14 26 discriminator 3 view .LVU18
.LBE11:
	.loc 1 17 2 is_stmt 1 view .LVU19
	.loc 1 17 15 is_stmt 0 view .LVU20
	mov	rcx, -1
	mov	eax, 0
	mov	rdi, rbp
	repnz scasb
.LVL7:
	.loc 1 17 15 view .LVU21
	mov	rax, rcx
	not	rax
	lea	rdx, -1[rax]
.LVL8:
	.loc 1 18 2 is_stmt 1 view .LVU22
.LBB12:
.LBI12:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 105 1 view .LVU23
.LBB13:
	.loc 2 107 3 view .LVU24
	.loc 2 107 10 is_stmt 0 view .LVU25
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.LVL9:
	.loc 2 107 10 view .LVU26
.LBE13:
.LBE12:
	.loc 1 20 2 is_stmt 1 view .LVU27
	.loc 1 20 15 is_stmt 0 view .LVU28
	mov	rdi, rbp
	call	my_strlen_strlen@PLT
.LVL10:
	mov	rdx, rax
.LVL11:
	.loc 1 21 2 is_stmt 1 view .LVU29
.LBB14:
.LBI14:
	.loc 2 105 1 view .LVU30
.LBB15:
	.loc 2 107 3 view .LVU31
	.loc 2 107 10 is_stmt 0 view .LVU32
	lea	rsi, .LC1[rip]
	mov	edi, 1
	mov	eax, 0
.LVL12:
	.loc 2 107 10 view .LVU33
	call	__printf_chk@PLT
.LVL13:
	.loc 2 107 10 view .LVU34
.LBE15:
.LBE14:
	.loc 1 23 2 is_stmt 1 view .LVU35
	.loc 1 23 15 is_stmt 0 view .LVU36
	mov	rdi, rbp
	call	my_strlen_primitive@PLT
.LVL14:
	mov	rdx, rax
.LVL15:
	.loc 1 24 2 is_stmt 1 view .LVU37
.LBB16:
.LBI16:
	.loc 2 105 1 view .LVU38
.LBB17:
	.loc 2 107 3 view .LVU39
	.loc 2 107 10 is_stmt 0 view .LVU40
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	eax, 0
.LVL16:
	.loc 2 107 10 view .LVU41
	call	__printf_chk@PLT
.LVL17:
	.loc 2 107 10 view .LVU42
.LBE17:
.LBE16:
	.loc 1 26 2 is_stmt 1 view .LVU43
	.loc 1 26 15 is_stmt 0 view .LVU44
	mov	rdi, rbp
	call	my_strlen_adv1@PLT
.LVL18:
	mov	rdx, rax
.LVL19:
	.loc 1 27 2 is_stmt 1 view .LVU45
.LBB18:
.LBI18:
	.loc 2 105 1 view .LVU46
.LBB19:
	.loc 2 107 3 view .LVU47
	.loc 2 107 10 is_stmt 0 view .LVU48
	lea	rsi, .LC3[rip]
	mov	edi, 1
	mov	eax, 0
.LVL20:
	.loc 2 107 10 view .LVU49
	call	__printf_chk@PLT
.LVL21:
	.loc 2 107 10 view .LVU50
.LBE19:
.LBE18:
	.loc 1 28 2 is_stmt 1 view .LVU51
	.loc 1 29 1 is_stmt 0 view .LVU52
	mov	eax, 0
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
.LVL22:
	.loc 1 29 1 view .LVU53
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	main, .-main
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 9 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5d1
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF58
	.byte	0xc
	.long	.LASF59
	.long	.LASF60
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd1
	.byte	0x1b
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x98
	.byte	0x12
	.long	0x6c
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x99
	.byte	0x12
	.long	0x6c
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x91
	.uleb128 0x8
	.long	.LASF61
	.byte	0xd8
	.byte	0x5
	.byte	0x31
	.byte	0x8
	.long	0x224
	.uleb128 0x9
	.long	.LASF11
	.byte	0x5
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x5
	.byte	0x36
	.byte	0x9
	.long	0x8b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x5
	.byte	0x37
	.byte	0x9
	.long	0x8b
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x5
	.byte	0x38
	.byte	0x9
	.long	0x8b
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x5
	.byte	0x39
	.byte	0x9
	.long	0x8b
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.long	0x8b
	.byte	0x28
	.uleb128 0x9
	.long	.LASF17
	.byte	0x5
	.byte	0x3b
	.byte	0x9
	.long	0x8b
	.byte	0x30
	.uleb128 0x9
	.long	.LASF18
	.byte	0x5
	.byte	0x3c
	.byte	0x9
	.long	0x8b
	.byte	0x38
	.uleb128 0x9
	.long	.LASF19
	.byte	0x5
	.byte	0x3d
	.byte	0x9
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF20
	.byte	0x5
	.byte	0x40
	.byte	0x9
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.byte	0x42
	.byte	0x9
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.byte	0x44
	.byte	0x16
	.long	0x23d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.byte	0x46
	.byte	0x14
	.long	0x243
	.byte	0x68
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.byte	0x4a
	.byte	0xb
	.long	0x73
	.byte	0x78
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.long	0x249
	.byte	0x83
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.byte	0x51
	.byte	0xf
	.long	0x259
	.byte	0x88
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.byte	0x59
	.byte	0xd
	.long	0x7f
	.byte	0x90
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.byte	0x5b
	.byte	0x17
	.long	0x264
	.byte	0x98
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.byte	0x5c
	.byte	0x19
	.long	0x26f
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.byte	0x5d
	.byte	0x14
	.long	0x243
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.long	0x275
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x6
	.byte	0x7
	.byte	0x19
	.long	0x9d
	.uleb128 0xa
	.long	.LASF62
	.byte	0x5
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF41
	.uleb128 0x6
	.byte	0x8
	.long	0x238
	.uleb128 0x6
	.byte	0x8
	.long	0x9d
	.uleb128 0xc
	.long	0x91
	.long	0x259
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x230
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x6
	.byte	0x8
	.long	0x25f
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x6
	.byte	0x8
	.long	0x26a
	.uleb128 0xc
	.long	0x91
	.long	0x285
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF44
	.byte	0x7
	.byte	0x89
	.byte	0xe
	.long	0x291
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xe
	.long	.LASF45
	.byte	0x7
	.byte	0x8a
	.byte	0xe
	.long	0x291
	.uleb128 0xe
	.long	.LASF46
	.byte	0x7
	.byte	0x8b
	.byte	0xe
	.long	0x291
	.uleb128 0xe
	.long	.LASF47
	.byte	0x8
	.byte	0x1a
	.byte	0xc
	.long	0x65
	.uleb128 0xc
	.long	0x2d1
	.long	0x2c6
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x2bb
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0x7
	.long	0x2cb
	.uleb128 0x10
	.long	0x2cb
	.uleb128 0xe
	.long	.LASF48
	.byte	0x8
	.byte	0x1b
	.byte	0x1a
	.long	0x2c6
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0x11
	.long	.LASF63
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.long	0x65
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x56b
	.uleb128 0x12
	.string	"sz"
	.byte	0x1
	.byte	0xb
	.byte	0x9
	.long	0x2d
	.long	0x5f5e100
	.uleb128 0x13
	.long	.LASF51
	.byte	0x1
	.byte	0xc
	.byte	0x8
	.long	0x8b
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x14
	.string	"sz0"
	.byte	0x1
	.byte	0x11
	.byte	0x9
	.long	0x2d
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x14
	.string	"sz1"
	.byte	0x1
	.byte	0x14
	.byte	0x9
	.long	0x2d
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x14
	.string	"sz2"
	.byte	0x1
	.byte	0x17
	.byte	0x9
	.long	0x2d
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x14
	.string	"sz3"
	.byte	0x1
	.byte	0x1a
	.byte	0x9
	.long	0x2d
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x15
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x3bf
	.uleb128 0x14
	.string	"i"
	.byte	0x1
	.byte	0xe
	.byte	0xd
	.long	0x2d
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x16
	.quad	.LVL5
	.long	0x58a
	.byte	0
	.uleb128 0x17
	.long	0x56b
	.quad	.LBI12
	.byte	.LVU23
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.long	0x412
	.uleb128 0x18
	.long	0x57c
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x19
	.quad	.LVL9
	.long	0x597
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	0x56b
	.quad	.LBI14
	.byte	.LVU30
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.long	0x465
	.uleb128 0x18
	.long	0x57c
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x19
	.quad	.LVL13
	.long	0x597
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	0x56b
	.quad	.LBI16
	.byte	.LVU38
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.long	0x4b8
	.uleb128 0x18
	.long	0x57c
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x19
	.quad	.LVL17
	.long	0x597
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	0x56b
	.quad	.LBI18
	.byte	.LVU46
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.long	0x50b
	.uleb128 0x18
	.long	0x57c
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x19
	.quad	.LVL21
	.long	0x597
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LVL1
	.long	0x5a3
	.long	0x526
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0xc
	.long	0x5f5e101
	.byte	0
	.uleb128 0x1b
	.quad	.LVL10
	.long	0x5b0
	.long	0x53e
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.quad	.LVL14
	.long	0x5bc
	.long	0x556
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.quad	.LVL18
	.long	0x5c8
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF64
	.byte	0x2
	.byte	0x69
	.byte	0x1
	.long	0x65
	.byte	0x3
	.long	0x58a
	.uleb128 0x1d
	.long	.LASF65
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.long	0x2d6
	.uleb128 0x1e
	.byte	0
	.uleb128 0x1f
	.long	.LASF52
	.long	.LASF52
	.byte	0x9
	.value	0x1c5
	.byte	0xc
	.uleb128 0x20
	.long	.LASF53
	.long	.LASF53
	.byte	0x2
	.byte	0x5a
	.byte	0xc
	.uleb128 0x1f
	.long	.LASF54
	.long	.LASF54
	.byte	0x9
	.value	0x21b
	.byte	0xe
	.uleb128 0x20
	.long	.LASF55
	.long	.LASF55
	.byte	0x1
	.byte	0x7
	.byte	0x8
	.uleb128 0x20
	.long	.LASF56
	.long	.LASF56
	.byte	0x1
	.byte	0x5
	.byte	0x8
	.uleb128 0x20
	.long	.LASF57
	.long	.LASF57
	.byte	0x1
	.byte	0x6
	.byte	0x8
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS0:
	.uleb128 .LVU4
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU21
.LLST0:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL4-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU22
	.uleb128 .LVU26
.LLST1:
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU29
	.uleb128 .LVU33
	.uleb128 .LVU33
	.uleb128 .LVU34
.LLST2:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU37
	.uleb128 .LVU41
	.uleb128 .LVU41
	.uleb128 .LVU42
.LLST3:
	.quad	.LVL15-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL16-.Ltext0
	.quad	.LVL17-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 .LVU45
	.uleb128 .LVU49
	.uleb128 .LVU49
	.uleb128 .LVU50
.LLST4:
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU8
	.uleb128 .LVU9
	.uleb128 .LVU9
	.uleb128 .LVU53
.LLST5:
	.quad	.LVL3-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL4-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU23
	.uleb128 .LVU26
.LLST6:
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU30
	.uleb128 .LVU34
.LLST7:
	.quad	.LVL11-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS8:
	.uleb128 .LVU38
	.uleb128 .LVU42
.LLST8:
	.quad	.LVL15-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 .LVU46
	.uleb128 .LVU50
.LLST9:
	.quad	.LVL19-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC3
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF64:
	.string	"printf"
.LASF8:
	.string	"__off_t"
.LASF12:
	.string	"_IO_read_ptr"
.LASF54:
	.string	"malloc"
.LASF24:
	.string	"_chain"
.LASF7:
	.string	"size_t"
.LASF30:
	.string	"_shortbuf"
.LASF18:
	.string	"_IO_buf_base"
.LASF50:
	.string	"long long unsigned int"
.LASF33:
	.string	"_codecvt"
.LASF49:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF25:
	.string	"_fileno"
.LASF13:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF11:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_cur_column"
.LASF42:
	.string	"_IO_codecvt"
.LASF53:
	.string	"__printf_chk"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF41:
	.string	"_IO_marker"
.LASF44:
	.string	"stdin"
.LASF1:
	.string	"unsigned int"
.LASF36:
	.string	"_freeres_buf"
.LASF56:
	.string	"my_strlen_primitive"
.LASF0:
	.string	"long unsigned int"
.LASF52:
	.string	"rand"
.LASF16:
	.string	"_IO_write_ptr"
.LASF47:
	.string	"sys_nerr"
.LASF3:
	.string	"short unsigned int"
.LASF20:
	.string	"_IO_save_base"
.LASF31:
	.string	"_lock"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF45:
	.string	"stdout"
.LASF17:
	.string	"_IO_write_end"
.LASF62:
	.string	"_IO_lock_t"
.LASF61:
	.string	"_IO_FILE"
.LASF55:
	.string	"my_strlen_strlen"
.LASF48:
	.string	"sys_errlist"
.LASF23:
	.string	"_markers"
.LASF2:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF43:
	.string	"_IO_wide_data"
.LASF29:
	.string	"_vtable_offset"
.LASF40:
	.string	"FILE"
.LASF10:
	.string	"char"
.LASF51:
	.string	"text"
.LASF9:
	.string	"__off64_t"
.LASF14:
	.string	"_IO_read_base"
.LASF22:
	.string	"_IO_save_end"
.LASF65:
	.string	"__fmt"
.LASF60:
	.string	"/mnt/d/WorkTeaching/UCU/lectures/code/asm/sample_projects3/asm_strlen"
.LASF37:
	.string	"__pad5"
.LASF39:
	.string	"_unused2"
.LASF46:
	.string	"stderr"
.LASF57:
	.string	"my_strlen_adv1"
.LASF21:
	.string	"_IO_backup_base"
.LASF58:
	.string	"GNU C17 9.3.0 -masm=intel -mtune=generic -march=x86-64 -g -Og -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF35:
	.string	"_freeres_list"
.LASF34:
	.string	"_wide_data"
.LASF59:
	.string	"sample_strlen.c"
.LASF63:
	.string	"main"
.LASF15:
	.string	"_IO_write_base"
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
