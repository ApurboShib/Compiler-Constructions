input = input.txt
output = output.txt

main:
	bison -d dowhile.y 
	flex dowhile.l 
	gcc dowhile.tab.c lex.yy.c -o dowhile
	./dowhile < $(input) > $(output) 