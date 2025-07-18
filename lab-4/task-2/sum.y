%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token FOR INT ASSIGN PLUS LESS INC SEMICOLON LPAREN RPAREN LBRACE RBRACE PRINTF
%token NUM ID
%start stmts

%%

stmts:
    loop
;

loop:
    FOR LPAREN INT ID ASSIGN NUM SEMICOLON ID LESS NUM SEMICOLON ID INC RPAREN LBRACE
        INT ID ASSIGN NUM SEMICOLON
        ID ASSIGN ID PLUS ID SEMICOLON
        PRINTF LPAREN ID RPAREN SEMICOLON
    RBRACE
;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}