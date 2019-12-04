all: Linka

Linka: exe6.o
	ld exe6.o -e __start -o exe6

exe6.o: exe6.s
	as exe6.s --gstabs -o exe6.o

.PHONY: clean

clean: 
	rm -f exe6.o exe6