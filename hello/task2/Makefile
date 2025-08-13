input = input.txt
output = output.txt

main:
		bison -d check2.y
		flex check2.l
		gcc check2.tab.c lex.yy.c -o check2 -lm
		./check2 < $(input) > $(output)