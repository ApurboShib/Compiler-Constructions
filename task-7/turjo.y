%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *);
int yylex();
%}

%token FOR LPAREN RPAREN LBRACE RBRACE ID NUM SEMICOLON ASSIGN LE INC PRINT

%%
program: FOR LPAREN assign SEMICOLON condition SEMICOLON increment RPAREN LBRACE stmtlist RBRACE ;

assign: ID ASSIGN NUM ;

condition: ID LE NUM ;

increment: ID INC ;

stmtlist: stmtlist stmt
        | /* empty */ ;

stmt: PRINT ID SEMICOLON ;
%%

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}