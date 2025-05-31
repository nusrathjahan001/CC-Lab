all:
	gcc -o first first.c
	gcc -E first.c > first.i 
	gcc -S -masm=intel first.i
	as -o first.o first.s
	objdump -M intel -d first.o > first.dump
	gcc -c -o first.o first.c
	objdump -M intel -d first.o > first2.dump