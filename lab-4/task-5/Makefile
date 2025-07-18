input = input.txt
output = output.txt

main:
		bison -d ok.y
		flex ok.l
		gcc ok.tab.c lex.yy.c -o ok
		./ok < $(input) > $(output)