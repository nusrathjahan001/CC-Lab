all:
	gcc -o fac fac.c
	gcc -E fac.c > fac.i 
	gcc -S -masm=intel fac.i
	as -o fac.o fac.s
	objdump -M intel -d fac.o > fac.dump
	gcc -c -o fac.o fac.c
	objdump -M intel -d fac.o > fac2.dump