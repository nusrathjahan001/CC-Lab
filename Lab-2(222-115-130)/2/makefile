all:
	gcc -o even even.c
	gcc -E even.c > even.i 
	gcc -S -masm=intel even.i
	as -o even.o even.s
	objdump -M intel -d even.o > even.dump
	gcc -c -o even.o even.c
	objdump -M intel -d even.o > even2.dump