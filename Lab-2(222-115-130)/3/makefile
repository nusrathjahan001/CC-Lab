all:
	gcc -o prime prime.c
	gcc -E prime.c > prime.i 
	gcc -S -masm=intel prime.i
	as -o prime.o prime.s
	objdump -M intel -d prime.o > prime.dump
	gcc -c -o prime.o prime.c
	objdump -M intel -d prime.o > prime2.dump