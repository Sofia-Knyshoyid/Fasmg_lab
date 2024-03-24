# Detect OS/platform:
include makefile_os.inc

LINKER ?= gcc


ALL_TARGETS_LIN = hello_linux64_libc hello_linux64_libc_pic hello_linux32_libc hello_linux32_libc_pic \
				  hello_linux32_selfimport hello_linux32_cinvoke_selfimport hello_linux64_selfimport \
				  hello_linux32_syscall hello_linux64_syscall 
ALL_TARGETS_WIN32 = hello_win32_con_selfimport.exe hello_win32_con_o.exe \
				  hello_win32_gui_min.exe hello_win32_gui_selfimportPE.exe
ALL_TARGETS_WIN64 = hello_win64_con_selfimport.exe hello_win64_con_o.exe \
					hello_win64_gui_min.exe hello_win64_gui_selfimportPE.exe
ALL_TARGETS_WIN_DEMO = $(patsubst %.asm,%.exe,$(wildcard *_demo_win.asm))


# Select targets for platform being compiled for:
ALL_TARGETS = 
ifeq ($(USED_OS),WIN32)
ALL_TARGETS += ${ALL_TARGETS_WIN32} ${ALL_TARGETS_WIN_DEMO}
FASM ?= ./fasmg.exe
endif
ifeq ($(USED_OS),WIN64)
# Win64 always supports Win32 Apps, but Mingw64 to Mingw32 cross-compiling setup is nontrivial.
# So ${ALL_TARGETS_WIN32} are excluded here.
ALL_TARGETS +=  ${ALL_TARGETS_WIN64} ${ALL_TARGETS_WIN_DEMO}
FASM ?= ./fasmg.exe
endif
ifeq ($(USED_OS),LINUX)
ALL_TARGETS += ${ALL_TARGETS_LIN}
FASM ?= ./fasmg.x64
endif


all: ${ALL_TARGETS}
	@echo ${ALL_TARGETS}

hello_linux64_libc: hello_linux64_libc.o
	${LINKER} $^ -static -o $@		
#	${LINKER} $^ -no-pie -o $@		
	
hello_linux64_libc_pic: hello_linux64_libc_pic.o
	${LINKER} $^ -o $@

hello_linux32_libc: hello_linux32_libc.o
	${LINKER} $^ -static -o $@ -m32
#	${LINKER} $^ -no-pie -o $@	
	
hello_linux32_libc_pic: hello_linux32_libc_pic.o
	${LINKER} $^ -o $@ -m32

hello_win32_con_o.exe: hello_win32_con_o.o
	${LINKER} $^ -o $@ -m32 

hello_win32_con_selfimport.exe: hello_win32_con_selfimport.asm
	INCLUDE=${CURDIR}/x86/include ${FASM} $<

hello_win64_con_selfimport.exe: hello_win64_con_selfimport.asm
	INCLUDE=${CURDIR}/x86/include ${FASM} $<

hello_win64_con_o.exe: hello_win64_con_o.o
	${LINKER} $^ -o $@ -m64
	
%.o: %.asm 
	INCLUDE=${CURDIR}/x86/include ${FASM} $<

%.exe: %.asm 
	INCLUDE=${CURDIR}/x86/include ${FASM} $<	

%_selfimport: %_selfimport.asm 
	INCLUDE=${CURDIR}/x86/include ${FASM} $<
	chmod ugo+x $@

%_syscall: %_syscall.asm 
	INCLUDE=${CURDIR}/x86/include ${FASM} $<
	chmod ugo+x $@
	
.PHONY: clean
clean:
	@rm *.o ${ALL_TARGETS}  || true
		