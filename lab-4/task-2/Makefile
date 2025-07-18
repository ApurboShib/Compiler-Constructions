input = input.txt
output = output.txt

main:
		bison -d sum.y
		flex sum.l
		gcc sum.tab.c lex.yy.c -o sum
		./sum < $(input) > $(output)