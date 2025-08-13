%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    double num;
    char* id;
}

%token INT CHAR DOUBLE SCANF PRINTF POW
%token SWITCH CASE DEFAULT BREAK IF ELSE RETURN
%token <id> ID
%token <num> NUM
%token CHARLIT STRING
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA AMP COLON
%token ASSIGN PLUS MINUS MUL DIV CARET EQ NEQ

%type <num> expr

%left PLUS MINUS
%left MUL DIV
%right ASSIGN

%%
program: INT ID LPAREN RPAREN LBRACE decls stmts RETURN NUM SEMICOLON RBRACE ;

decls: decls decl
     | decl ;

decl: type idlist SEMICOLON ;

type: INT | DOUBLE | CHAR ;

idlist: ID
      | idlist COMMA ID ;

stmts: stmts stmt
     | stmt ;

stmt: assign_stmt
    | scanf_stmt
    | print_stmt
    | switch_stmt
    | if_stmt
    | break_stmt ;

assign_stmt: ID ASSIGN expr SEMICOLON ;

scanf_stmt: SCANF LPAREN STRING COMMA AMP ID RPAREN SEMICOLON ;

print_stmt: PRINTF LPAREN STRING RPAREN SEMICOLON
          | PRINTF LPAREN STRING COMMA expr RPAREN SEMICOLON ;

switch_stmt: SWITCH LPAREN ID RPAREN LBRACE case_list default_case RBRACE ;

case_list: case_list CASE CHARLIT COLON stmts BREAK SEMICOLON
         | CASE CHARLIT COLON stmts BREAK SEMICOLON ;

default_case: DEFAULT COLON stmts ;

if_stmt: IF LPAREN condition RPAREN block
       | IF LPAREN condition RPAREN block ELSE block ;

break_stmt: BREAK SEMICOLON ;

condition: expr NEQ expr
         | expr EQ expr ;

expr: ID                                    { $$ = 0; /* placeholder for ID value */ }
    | NUM                                   { $$ = $1; }
    | expr PLUS expr                        { $$ = $1 + $3; }
    | expr MINUS expr                       { $$ = $1 - $3; }
    | expr MUL expr                         { $$ = $1 * $3; }
    | expr DIV expr                         { $$ = $1 / $3; }
    | POW LPAREN expr COMMA expr RPAREN     { $$ = pow($3, $5); }
    | LPAREN expr RPAREN                    { $$ = $2; } ;

block: LBRACE stmts RBRACE ;
%%
void yyerror(const char *s) {
    
}

int main() {
    yyparse();
    printf("Parsing Finished Successfully.\n");
    return 0;
}