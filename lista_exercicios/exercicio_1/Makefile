all: Linka

Linka: exe1.o
	gcc exe1.o -no-pie -o exe1

exe1.o: exe1.s
	as exe1.s --gstabs -o exe1.o

.PHONY: clean

clean: 
	rm -f exe1.o exe1