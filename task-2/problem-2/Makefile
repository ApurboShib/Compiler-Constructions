all:
	gcc question-2.c -o question-2 -std=c99
	gcc -E question-2.c > question-2.i 
	gcc -S -masm=intel question-2.i
	as -o question-2.o question-2.s
	objdump -M intel -d question-2.o > question-2.dump


