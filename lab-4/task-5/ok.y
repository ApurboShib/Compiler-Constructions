%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token INT IF ASSIGN SEMICOLON COMMA LPAREN RPAREN LBRACE RBRACE GREATER LESS AND TRUE
%token NUM ID
%start stmts

%%

stmts:
    decls condition_block
;

decls:
    INT ID ASSIGN NUM SEMICOLON
    INT ID ASSIGN NUM SEMICOLON
    INT ID ASSIGN NUM SEMICOLON
;

condition_block:
    IF LPAREN ID GREATER ID AND ID LESS ID RPAREN LBRACE
        INT ID ASSIGN TRUE SEMICOLON
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