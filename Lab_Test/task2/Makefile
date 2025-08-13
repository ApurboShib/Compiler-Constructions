input = input.txt
output = output.txt

main:
	bison -d switch.y
	flex switch.l
	gcc switch.tab.c lex.yy.c -o switch
	./switch < $(input) > $(output)