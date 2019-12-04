all: Linka

Linka: exe4.o
	gcc exe4.o -no-pie -o exe4

exe2.o: exe4.s
	as exe4.s --gstabs -o exe4.o

.PHONY: clean

clean: 
	rm -f exe4.o exe4