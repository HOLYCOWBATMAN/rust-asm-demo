VPATH ?= src

RUSTC ?= rustc
NASM ?= nasm
GCC ?= gcc

all: run

run: demo-asm~
	./$<

demo-asm~: demo-asm.rs asm.o c.o
	$(RUSTC) $< -o $@

asm.o: asm.asm
	$(NASM) -f elf64 $< -o $@

c.o: c.c
	$(GCC) -c $<

clean:
	$(RM) *~ *.o

