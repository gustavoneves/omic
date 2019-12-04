all: Linka

Linka: exe6.o
	gcc exe6.o -no-pie -o exe6

exe4.o: exe6.s
	as exe6.s --gstabs -o exe6.o

.PHONY: clean

clean: 
	rm -f exe6.o exe6