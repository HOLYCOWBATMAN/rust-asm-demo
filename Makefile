VPATH ?= src

RUSTC ?= rustc
NASM ?= nasm

all: run

run: demo-asm~
	./$<

demo-asm~: demo-asm.rs asm.o
	$(RUSTC) $< -o $@

asm.o: asm.asm
	$(NASM) -f elf64 $< -o $@

clean:
	$(RM) *~ *.o

