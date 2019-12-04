all: Linka

Linka: exe5.o
	ld exe5.o -e __start -o exe5

exe5.o: exe5.s
	as exe5.s --gstabs -o exe5.o

.PHONY: clean

clean: 
	rm -f exe5.o exe5