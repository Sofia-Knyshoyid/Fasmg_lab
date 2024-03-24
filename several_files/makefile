# Detect OS/platform:
include makefile_os.inc

LINKER ?= gcc
OUR_СС ?= gcc

ALL_TARGETS_LIN64 = asm_use_add_2_linux64_libc_pic c_use_add_2_linux64
ALL_TARGETS_WIN64 = asm_use_add_2_win64_con c_use_add_2_win64

ALL_TARGETS = 
ifeq ($(USED_OS),WIN64)
ALL_TARGETS += ${ALL_TARGETS_WIN64}
FASM ?= ../fasmg.exe
endif
ifeq ($(USED_OS),LINUX)
ALL_TARGETS += ${ALL_TARGETS_LIN64}
FASM ?= ../fasmg.x64
endif


all: ${ALL_TARGETS}
	echo ${ALL_TARGETS}

asm_use_add_2_linux64_libc_pic: asm_use_add_2_linux64_libc_pic.o add_2_linux64.o
	${LINKER} $^ -o $@
	
c_use_add_2_linux64: c_use_add_2.o add_2_linux64.o
	${LINKER} $^ -o $@

asm_use_add_2_win64_con: asm_use_add_2_win64_con.o add_2_win64.o
	${LINKER} $^ -o $@
	
c_use_add_2_win64: c_use_add_2.o add_2_win64.o 
	${LINKER} $^ -o $@
	

%.o: %.c
	${OUR_СС} $^ -o $@ -c
	
%.o: %.asm 
	INCLUDE=${CURDIR}/../x86/include ${FASM} $<

.PHONY: clean
clean:
	@rm *.o ${ALL_TARGETS} || true
		