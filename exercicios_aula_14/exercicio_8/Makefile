all: Linka

Linka: exe8.o
	gcc exe8.o -no-pie -o exe8

exe8.o: exe8.s
	as exe8.s --gstabs -o exe8.o

.PHONY: clean

clean: 
	rm -f exe8.o exe8