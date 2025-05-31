all:
	gcc question-5.c -o question-5 -std=c99
	gcc -E question-5.c > question-5.i 
	gcc -S -masm=intel question-5.i
	as -o question-5.o question-5.s
	objdump -M intel -d question-5.o > question-5.dump


