input = input.txt
output = output.txt

main:
		bison -d even-odd.y
		flex even-odd.l
		gcc even-odd.tab.c lex.yy.c -o even-odd
		./even-odd < $(input) > $(output)