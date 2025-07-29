all:
	gcc -o division division.c
	gcc -E division.c >division.i 
	gcc -S -masm=intel division.i
	as -o division.o division.s
	objdump -M intel -d division.o > division.dump
	gcc -c -o division.o division.c