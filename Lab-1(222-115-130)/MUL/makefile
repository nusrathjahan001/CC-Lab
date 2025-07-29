all:
	gcc -o mul mul.c
	gcc -E mul.c > mul.i 
	gcc -S -masm=intel mul.i
	as -o mul.o mul.s
	objdump -M intel -d mul.o > mul.dump
	gcc -c -o mul.o mul.c