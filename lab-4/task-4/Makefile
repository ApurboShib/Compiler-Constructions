input = input.txt
output = output.txt

main:
		bison -d nested.y
		flex nested.l
		gcc nested.tab.c lex.yy.c -o nested
		./nested < $(input) > $(output)