    %{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    void yyerror(const char *s);
    int yylex();
    %}

    %union {
        float num;
        char* id;
    }

    %token INCLUDE STDIO INT CHAR FLOAT MAIN PRINTF SCANF SWITCH CASE DEFAULT BREAK RETURN IF ELSE
    %token <id> ID STRING CHAR_LITERAL CHAR_FORMAT FLOAT_FORMAT FLOAT_PRECISION
    %token <num> NUM
    %token LPAREN RPAREN LBRACE RBRACE COMMA SEMICOLON COLON
    %token ASSIGN PLUS MINUS MUL DIV NEQ AMPERSAND

    %type <num> expr

    %left PLUS MINUS
    %left MUL DIV
    %nonassoc UMINUS
    %nonassoc IF
    %nonassoc ELSE

    %%

    program: include_stmt main_function ;

    include_stmt: INCLUDE STDIO ;

    main_function: INT MAIN LPAREN RPAREN block ;

    block: LBRACE stmts RBRACE ;

    stmts: /* empty */
        | stmts stmt ;

    stmt: decl_stmt
        | assign_stmt
        | printf_stmt
        | scanf_stmt
        | switch_stmt
        | if_stmt
        | return_stmt
        | break_stmt ;

    decl_stmt: type_spec var_list SEMICOLON ;

    type_spec: INT | CHAR | FLOAT ;

    var_list: ID
            | var_list COMMA ID ;

    assign_stmt: ID ASSIGN expr SEMICOLON ;

    printf_stmt: PRINTF LPAREN STRING RPAREN SEMICOLON
            | PRINTF LPAREN STRING COMMA expr_list RPAREN SEMICOLON ;

    scanf_stmt: SCANF LPAREN STRING COMMA addr_list RPAREN SEMICOLON ;

    addr_list: AMPERSAND ID
            | addr_list COMMA AMPERSAND ID ;

    expr_list: expr
            | expr_list COMMA expr ;

    switch_stmt: SWITCH LPAREN ID RPAREN switch_block ;

    switch_block: LBRACE case_list default_case RBRACE
                | LBRACE case_list RBRACE ;

    case_list: case_stmt
            | case_list case_stmt ;

    case_stmt: CASE CHAR_LITERAL COLON stmt_block ;

    default_case: DEFAULT COLON stmt_block ;

    stmt_block: stmt
            | stmt_block stmt ;

    if_stmt: IF LPAREN condition RPAREN stmt %prec IF
        | IF LPAREN condition RPAREN stmt ELSE stmt %prec ELSE ;

    condition: expr relop expr ;

    relop: NEQ ;

    return_stmt: RETURN NUM SEMICOLON ;

    break_stmt: BREAK SEMICOLON ;

    expr: ID                    { $$ = 0; /* placeholder */ }
        | NUM                   { $$ = $1; }
        | expr PLUS expr        { $$ = $1 + $3; }
        | expr MINUS expr       { $$ = $1 - $3; }
        | expr MUL expr         { $$ = $1 * $3; }
        | expr DIV expr         { $$ = $1 / $3; }
        | MINUS expr %prec UMINUS     { $$ = -$2; }
        | LPAREN expr RPAREN    { $$ = $2; }

    %%

    void yyerror(const char *s) {
    
    }

    int main() {
        yyparse();
        printf("Parsing Finished Successfully");
        return 0;
    }
