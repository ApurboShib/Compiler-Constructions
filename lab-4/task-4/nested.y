%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token FOR INT PRINTF ASSIGN LESS INC PLUS COMMA SEMICOLON LPAREN RPAREN LBRACE RBRACE
%token NUM ID
%start stmts

%%

stmts:
    loop
;

loop:
    FOR LPAREN INT ID ASSIGN NUM SEMICOLON ID LESS NUM SEMICOLON ID INC RPAREN LBRACE
        FOR LPAREN INT ID ASSIGN ID PLUS NUM SEMICOLON ID LESS NUM SEMICOLON ID INC RPAREN LBRACE
            PRINTF LPAREN ID COMMA ID RPAREN SEMICOLON
        RBRACE
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