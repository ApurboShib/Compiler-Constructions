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

%token INT FOR IF BREAK PRINTF RETURN MAIN
%token <id> ID STRING
%token <num> NUM
%token LPAREN RPAREN LBRACE RBRACE COMMA SEMICOLON
%token ASSIGN PLUS MINUS MUL DIV MOD EQ NEQ LT GT LE GE INC PLUSEQ

%type <num> expr

%left PLUS MINUS
%left MUL DIV MOD
%nonassoc UMINUS

%%

program: INT MAIN LPAREN RPAREN block ;

block: LBRACE stmts RBRACE ;

stmts: /* empty */
     | stmts stmt ;

stmt: decl_stmt
    | assign_stmt
    | for_stmt
    | if_stmt
    | break_stmt
    | print_stmt
    | return_stmt ;

decl_stmt: INT idlist SEMICOLON ;

idlist: ID
      | idlist COMMA ID
      | idlist COMMA ID ASSIGN NUM
      | ID ASSIGN NUM ;

assign_stmt: ID ASSIGN expr SEMICOLON
           | ID PLUSEQ expr SEMICOLON ;

break_stmt: BREAK SEMICOLON ;

return_stmt: RETURN NUM SEMICOLON ;

print_stmt: PRINTF LPAREN STRING COMMA ID RPAREN SEMICOLON ;

if_stmt: IF LPAREN condition RPAREN block ;

for_stmt: FOR LPAREN for_init condition SEMICOLON incr_stmt RPAREN block ;

for_init: ID ASSIGN NUM SEMICOLON ;

incr_stmt: ID INC ;

condition: expr relop expr ;

relop: EQ | NEQ | LT | GT | LE | GE ;

expr: ID                    { $$ = 0; /* placeholder */ }
    | NUM                   { $$ = $1; }
    | expr PLUS expr        { $$ = $1 + $3; }
    | expr MINUS expr       { $$ = $1 - $3; }
    | expr MUL expr         { $$ = $1 * $3; }
    | expr DIV expr         { $$ = $1 / $3; }
    | expr MOD expr         { $$ = $1 % $3; }
    | MINUS expr %prec UMINUS     { $$ = -$2; }
    | LPAREN expr RPAREN    { $$ = $2; }

%%

void yyerror(const char *s) {
   
}

int main() {
    yyparse();
    printf("Parsing Finished Successfully.\n");
    return 0;
}