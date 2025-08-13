%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int num;
    char* id;
}

%token INT DO WHILE IF ELSE RETURN SCANF PRINTF
%token <id> ID
%token <num> NUM
%token STRING
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA AMP
%token ASSIGN PLUS MINUS MUL DIV MOD EQ NEQ

%type <num> expr

%left PLUS MINUS
%left MUL DIV MOD
%right ASSIGN

%%
program: INT ID LPAREN RPAREN LBRACE decls stmts RETURN NUM SEMICOLON RBRACE ;

decls: decls decl
     | decl ;

decl: INT idlist SEMICOLON ;

idlist: ID
      | idlist COMMA ID
      | idlist COMMA ID ASSIGN NUM
      | ID ASSIGN NUM ;

stmts: stmts stmt
     | stmt ;

stmt: assign_stmt
    | scanf_stmt
    | print_stmt
    | do_while_stmt
    | if_else_stmt ;

assign_stmt: ID ASSIGN expr SEMICOLON ;

scanf_stmt: SCANF LPAREN STRING COMMA AMP ID RPAREN SEMICOLON ;

print_stmt: PRINTF LPAREN STRING COMMA ID RPAREN SEMICOLON
          | PRINTF LPAREN STRING RPAREN SEMICOLON ;

do_while_stmt: DO block WHILE LPAREN condition RPAREN SEMICOLON ;

if_else_stmt: IF LPAREN condition RPAREN block ELSE block ;

condition: expr EQ expr
         | expr NEQ expr ;

expr: ID                    { $$ = 0; /* placeholder for ID value */ }
    | NUM                   { $$ = $1; }
    | expr PLUS expr        { $$ = $1 + $3; }
    | expr MINUS expr       { $$ = $1 - $3; }
    | expr MUL expr         { $$ = $1 * $3; }
    | expr DIV expr         { $$ = $1 / $3; }
    | expr MOD expr         { $$ = $1 % $3; }
    | LPAREN expr RPAREN    { $$ = $2; } ;

block: LBRACE stmts RBRACE ;
%%
void yyerror(const char *s) {
    printf("Syntax Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished Successfully.\n");
    return 0;
}