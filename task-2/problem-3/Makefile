all:
	gcc question-3.c -o question-3 -std=c99
	gcc -E question-3.c > question-3.i 
	gcc -S -masm=intel question-3.i
	as -o question-3.o question-3.s
	objdump -M intel -d question-3.o > question-3.dump


