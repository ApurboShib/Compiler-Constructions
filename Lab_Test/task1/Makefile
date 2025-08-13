input = input.txt
output = output.txt

main:
		bison -d prime.y
		flex prime.l
		gcc prime.tab.c lex.yy.c -o prime
		./prime < $(input) > $(output)