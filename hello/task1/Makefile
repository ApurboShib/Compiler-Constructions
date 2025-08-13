input = input.txt
output = output.txt

main:
		bison -d check.y
		flex check.l
		gcc check.tab.c lex.yy.c -o check
		./check < $(input) > $(output)