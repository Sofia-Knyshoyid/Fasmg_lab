FASM ?= ../fasmg.exe
LINKER ?= gcc
CC = gcc
CFLAGS += -D__USE_MINGW_ANSI_STDIO=1 # Important for MinGW, indifferent for others
CFLAGS += -g -save-temps -masm=intel -Og
LDFLAGS += -g -Og
SUFFIX = .exe

all: sample_strlen

sample_strlen: sample_strlen.o strlen.o
	$(LINKER) $^ -o $@ $(LDFLAGS)
	objdump -d -M intel $@$(SUFFIX) > $@.disasm 

strlen.o: strlen.asm
	INCLUDE=${CURDIR}/../x86/include $(FASM) $<

sample_strlen.o: sample_strlen.c	
	$(CC) -c $< -o $@ $(CFLAGS)

PHONY: clean

clean:
	@rm -rf *.o *.exe *.disasm || true
