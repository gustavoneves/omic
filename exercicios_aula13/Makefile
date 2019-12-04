all: Linka

Linka: exe2.o
	ld exe2.o -e __start -o exe2

exe2.o: exe2.s
	as exe2.s --gstabs -o exe2.o

.PHONY: clean

clean: 
	rm -f exe2.o exe2