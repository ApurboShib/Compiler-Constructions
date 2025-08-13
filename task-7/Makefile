input = input.txt
output = output.txt

main:
		bison -d turjo.y
		flex turjo.l
		gcc turjo.tab.c lex.yy.c -o turjo
		./turjo < $(input) > $(output)