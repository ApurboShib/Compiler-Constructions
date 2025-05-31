all:
	gcc question-4.c -o question-4 -std=c99
	gcc -E question-4.c > question-4.i 
	gcc -S -masm=intel question-4.i
	as -o question-4.o question-4.s
	objdump -M intel -d question-4.o > question-4.dump


