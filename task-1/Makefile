all:
	gcc add.c -o add -std=c99
	gcc -E add.c > add.i 
	gcc -S -masm=intel add.i
	as -o add.o add.s
	objdump -M intel -d add.o > add.dump

	gcc sub.c -o sub -std=c99
	gcc -E sub.c > sub.i 
	gcc -S -masm=intel sub.i
	as -o sub.o sub.s
	objdump -M intel -d sub.o > sub.dump

	gcc mul.c -o mul -std=c99
	gcc -E mul.c > mul.i 
	gcc -S -masm=intel mul.i
	as -o mul.o mul.s
	objdump -M intel -d mul.o > mul.dump

	gcc div.c -o div -std=c99
	gcc -E div.c > div.i 
	gcc -S -masm=intel div.i
	as -o div.o div.s
	objdump -M intel -d div.o > div.dump


