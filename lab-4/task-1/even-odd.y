
%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex();
%}

%token INT_NUM
%start stmts

%%

stmts : INT_NUM {
    if ($1 % 2 == 0)
        printf("Parsing Finished
\n");
    else
        printf("Parsing Finished
\n");
};

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}