%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symtab.c"
    void yyerror(char* msg);
    extern int lineno;
    extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR VOID RETURN PRINTF FOR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT INCREMENT DECREMENT ADDASSIGN SUBASSIGN
%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET SEMI ASSIGN COMMA
%token<str_val> ID
%token ICONST
%token FCONST
%token CCONST
%token STRING

%left LT GT EQUOP
%left ADDOP SUBOP
%left MULOP DIVOP

%type<int_val> type exp constant

%start program

%%
program: functions;

functions: functions function | function | ;

function: function_declaration 
        | function_definition
        ;

function_declaration: type ID LPAREN parameter_list RPAREN SEMI
        | type ID LPAREN RPAREN SEMI
        ;

function_definition: type ID LPAREN parameter_list RPAREN LBRACE statements RBRACE
        | type ID LPAREN RPAREN LBRACE statements RBRACE
        ;

parameter_list: parameter_list COMMA parameter
        | parameter
        ;

parameter: type ID
        | type ID LBRACKET RBRACKET
        | type ID LBRACKET ICONST RBRACKET
        ;

statements: statements statement | ;

statement: declaration
        | assignment_statement
        | if_statement
        | for_statement
        | function_call SEMI
        | return_statement
        | exp SEMI
        ;

declaration: type ID SEMI
            {
                insert($2, $1);
            }
            | type ID LBRACKET ICONST RBRACKET SEMI
            {
                insert($2, $1);
            }
            | type ID ASSIGN exp SEMI
            {
                insert($2, $1);
            }
            ;

assignment_statement: ID ASSIGN exp SEMI
            | ID ADDASSIGN exp SEMI
            | ID SUBASSIGN exp SEMI
            | ID LBRACKET exp RBRACKET ADDASSIGN exp SEMI
            ;

function_call: ID LPAREN argument_list RPAREN
            | ID LPAREN RPAREN
            | PRINTF LPAREN argument_list RPAREN
            ;

argument_list: argument_list COMMA exp
            | exp
            ;

return_statement: RETURN exp SEMI
            | RETURN SEMI
            ;

for_statement: FOR LPAREN for_init exp SEMI for_update RPAREN LBRACE statements RBRACE
            | FOR LPAREN for_init exp SEMI for_update RPAREN statement
            ;

for_init: assignment_statement
        | declaration
        | SEMI
        ;

for_update: assignment_statement
        | exp
        | /* empty */
        ;

type: INT {$$=INT_TYPE;}
    | DOUBLE {$$=REAL_TYPE;}
    | CHAR {$$=CHAR_TYPE;}
    | VOID {$$=INT_TYPE;}
    ;

exp: constant
    {
        $$ = $1;
    }
    | ID 
      {
        if(idcheck($1))
        {
            $$ = gettype($1);
        }
        else
        {
            $$ = INT_TYPE;
        }
      }
    | exp ADDOP exp
      {
        $$ = typecheck($1, $3);
      }
    | exp SUBOP exp
      {
        $$ = typecheck($1, $3);
      }
    | exp MULOP exp
      {
        $$ = typecheck($1, $3);
      }
    | exp DIVOP exp
      {
        $$ = typecheck($1, $3);
      }
    | exp GT exp
      {
        $$ = typecheck($1, $3);
      }
    | exp LT exp
      {
        $$ = typecheck($1, $3);
      }
    | exp EQUOP exp
      {
        $$ = typecheck($1, $3);
      }
    | function_call
      {
        $$ = INT_TYPE;
      }
    | LPAREN exp RPAREN
      {
        $$ = $2;
      }
    | ID LBRACKET exp RBRACKET
      {
        if(idcheck($1))
        {
            $$ = gettype($1);
        }
        else
        {
            $$ = INT_TYPE;
        }
      }
    | ID INCREMENT
      {
        if(idcheck($1))
        {
            $$ = gettype($1);
        }
        else
        {
            $$ = INT_TYPE;
        }
      }
    | INCREMENT ID
      {
        if(idcheck($2))
        {
            $$ = gettype($2);
        }
        else
        {
            $$ = INT_TYPE;
        }
      }
    ;

constant: ICONST {$$=INT_TYPE;}
        | FCONST {$$=REAL_TYPE;}
        | CCONST {$$=CHAR_TYPE;}
        | STRING {$$=CHAR_TYPE;}
        ;

if_statement: IF LPAREN exp RPAREN LBRACE statements RBRACE optional_else
        ;

optional_else
    : ELSE if_statement
    | ELSE LBRACE statements RBRACE
    | /* empty */
    ;

%%

void yyerror (char* msg)
{
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}

int main (int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");
    return 0;
}
