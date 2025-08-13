input = input.txt
output = output.txt

main:
	bison -d if-else.y
	flex if-else.l
	gcc if-else.tab.c lex.yy.c -o if-else
	./if-else < $(input) > $(output)

