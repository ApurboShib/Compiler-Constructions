%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char *s);
int yylex();

int line_num = 1;

typedef struct {
    char *name;
    char *type;
    int line;
} symbol_t;

symbol_t symbol_table[100];
int symbol_count = 0;

int is_duplicate(char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, name) == 0) {
            return 1;
        }
    }
    return 0;
}

void insert_symbol(char *name, char *type, int line) {
    if (!is_duplicate(name)) {
        symbol_table[symbol_count].name = strdup(name);
        symbol_table[symbol_count].type = strdup(type);
        symbol_table[symbol_count].line = line;
        
        printf("In line no %d, Inserting %s with type %s in symbol table.\n", 
               line, name, type);
        
        symbol_count++;
    }
}

char *current_type = NULL;
int declaration_line = 1;
int in_function_params = 0;
%}

%union {
    float fval;
    int ival;
    char *sval;
}

%token INCLUDE STDIO INT FLOAT CHAR FOR IF ELSE RETURN PRINTF SCANF MAIN 
%token ASSIGN PLUS_ASSIGN LE GE LESS GREATER EQ NE AND INC PLUS MINUS MUL DIV MOD 
%token AMPERSAND QUESTION COLON COMMA SEMICOLON LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token <fval> NUM
%token <sval> ID STRING

%start program

%%

program:
    /* empty */
    | program token
;

token:
    INCLUDE { }
    | STDIO { }
    | INT { current_type = "INT_TYPE"; declaration_line = line_num; }
    | FLOAT { current_type = "REAL_TYPE"; declaration_line = line_num; }
    | CHAR { current_type = "CHAR_TYPE"; declaration_line = line_num; }
    | FOR | IF | ELSE | RETURN | PRINTF | SCANF 
    | MAIN { 
        if (current_type != NULL) {
            insert_symbol("main", current_type, declaration_line);
            current_type = NULL;
        }
    }
    | ASSIGN | PLUS_ASSIGN | LE | GE | LESS | GREATER | EQ | NE | AND | INC | PLUS | MINUS | MUL | DIV | MOD
    | AMPERSAND | QUESTION | COLON | COMMA | LBRACE | RBRACE | LBRACKET | RBRACKET
    | LPAREN { in_function_params = 1; }
    | RPAREN { in_function_params = 0; }
    | SEMICOLON { current_type = NULL; }
    | NUM | STRING
    | ID { 
        if (current_type != NULL && !in_function_params) {
            insert_symbol($1, current_type, declaration_line);
        }
    }
;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    printf("Parsing finished!\n");
    return 0;
}
