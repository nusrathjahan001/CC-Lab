all:
	gcc -o sub sub.c
	gcc -E sub.c > sub.i 
	gcc -S -masm=intel sub.i
	as -o sub.o sub.s
	objdump -M intel -d sub.o > sub.dump
	gcc -c -o sub.o sub.c