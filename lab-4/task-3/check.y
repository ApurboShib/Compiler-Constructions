%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token INT IF ELSE PRINTF ASSIGN SEMICOLON COMMA LPAREN RPAREN LBRACE RBRACE GREATER
%token NUM ID STRING
%start stmts

%%

stmts:
    declaration conditional
;

declaration:
    INT ID ASSIGN NUM COMMA ID ASSIGN NUM SEMICOLON
;

conditional:
    IF LPAREN ID GREATER ID RPAREN LBRACE PRINTF LPAREN STRING RPAREN SEMICOLON RBRACE
    ELSE LBRACE PRINTF LPAREN STRING RPAREN SEMICOLON RBRACE
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