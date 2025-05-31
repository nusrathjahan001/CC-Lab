all:
	gcc -o odd odd.c
	gcc -E odd.c > odd.i 
	gcc -S -masm=intel odd.i
	as -o odd.o odd.s
	objdump -M intel -d odd.o > odd.dump
	gcc -c -o odd.o odd.c
	objdump -M intel -d odd.o > odd2.dump