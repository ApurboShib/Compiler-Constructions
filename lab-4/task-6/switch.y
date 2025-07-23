%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token SWITCH CASE DEFAULT BREAK LBRACE RBRACE COLON SEMICOLON NUM ID

%%
stmt: SWITCH ID LBRACE caselist RBRACE
    ;

caselist: case caselist
        | /* empty */
        ;

case: CASE NUM COLON stmtlist BREAK SEMICOLON
    | DEFAULT COLON stmtlist BREAK SEMICOLON
    ;

stmtlist: stmt stmtlist
        | /* empty */
        ;
%%

void yyerror(char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    printf("parsing finished.");
    return 0;
}