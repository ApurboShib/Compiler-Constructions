main: parser.tab.c lex.yy.c
	gcc parser.tab.c lex.yy.c -o parser
	./parser < input.txt > output.txt

parser.tab.c: parser.y 
	bison -d parser.y 

lex.yy.c: lexer.l
	flex lexer.l 

clean:
	rm -f lex.yy.c parser.tab.c parser.tab.h parser output.txt
