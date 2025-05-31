all:
	gcc -o small small.c
	gcc -E small.c > small.i 
	gcc -S -masm=intel small.i
	as -o small.o small.s
	objdump -M intel -d small.o > small.dump
	gcc -c -o small.o small.c
	objdump -M intel -d small.o > small2.dump