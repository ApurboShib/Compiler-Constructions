%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token INT_TYPE INT_NUM FLOAT_TYPE FLOAT_NUM SEMI ID ASSIGN
%start stmts

%%

stmts:
    stmts stmt
  | /* empty */
  ;

stmt:
    dclr_stmt
  | ass_stmt
  ;

dclr_stmt:
    type ID SEMI
  | type ID ASSIGN num SEMI
  ;

ass_stmt:
    ID ASSIGN num SEMI
  ;

num:
    FLOAT_NUM
  | INT_NUM
  ;

type:
    FLOAT_TYPE
  | INT_TYPE
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