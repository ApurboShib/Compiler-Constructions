all:
	gcc question-6.c -o question-6 -std=c99
	gcc -E question-6.c > question-6.i 
	gcc -S -masm=intel question-6.i
	as -o question-6.o question-6.s
	objdump -M intel -d question-6.o > question-6.dump


