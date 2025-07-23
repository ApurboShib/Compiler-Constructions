all : 
	gcc check.c -o check -std=c99
	gcc -E check.c > check.i 
	gcc -S -masm=intel check.i
	as -o check.o check.s
	objdump -M intel -d check.o > check.dump

	gcc even-odd.c -o even-odd -std=c99
	gcc -E even-odd.c > even-odd.i
	gcc -S -masm=intel even-odd.i
	as -o even-odd.o even-odd.s
	objdump -M intel -d even-odd.o > even-odd.dump

	gcc prac.c -o prac -std=c99
	gcc -E prac.c > prac.i
	gcc -S -masm=intel prac.i
	as -o prac.o prac.s
	objdump -M intel -d prac.o > prac.dump
