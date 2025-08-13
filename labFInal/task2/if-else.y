%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token INCLUDE STDIO INT CHAR FOR IF ELSE RETURN PRINTF SCANF FACTORIAL MAIN CHOICE MENU
%token ASSIGN LE GE LESS GREATER EQ NE AND INC MUL_ASSIGN PLUS MINUS MUL AMPERSAND QUESTION COLON
%token COMMA SEMICOLON LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token NUM ID STRING

%start program

%%

program:
    /* empty */
    | program token
;

token:
    INCLUDE | STDIO | INT | CHAR | FOR | IF | ELSE | RETURN | PRINTF | SCANF | FACTORIAL | MAIN | CHOICE | MENU
    | ASSIGN | LE | GE | LESS | GREATER | EQ | NE | AND | INC | MUL_ASSIGN | PLUS | MINUS | MUL | AMPERSAND | QUESTION | COLON
    | COMMA | SEMICOLON | LPAREN | RPAREN | LBRACE | RBRACE | LBRACKET | RBRACKET
    | NUM | ID | STRING
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
