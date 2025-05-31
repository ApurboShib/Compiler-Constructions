all:
	gcc question-1.c -o question-1 -std=c99
	gcc -E question-1.c > question-1.i
	gcc -S -masm=intel question-1.i
	as -o question-1.o question-1.s
	objdump -M intel -d question-1.o > question-1.dump