%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *);
int yylex();
%}

%token DO WHILE LPAREN RPAREN LBRACE RBRACE ID NUM SEMICOLON INC ASSIGN LE PRINT

%%
program: DO LBRACE stmtlist RBRACE WHILE LPAREN condition RPAREN SEMICOLON ;

stmtlist: stmtlist stmt
        | /* empty */ ;

stmt: ID ASSIGN NUM SEMICOLON
    | PRINT ID SEMICOLON
    | ID INC SEMICOLON
    ;

condition: ID LE NUM ;
%%

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}