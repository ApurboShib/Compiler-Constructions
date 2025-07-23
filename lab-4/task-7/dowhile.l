%option noyywrap

%{
    #include "dowhile.tab.h"
%}

digit [0-9]
number {digit}+
id [a-zA-Z_][a-zA-Z0-9_]*
ws [ \t\n]

%%
{ws}            {}
"do"            { return DO; }
"while"         { return WHILE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"++"            { return INC; }
"<="            { return LE; }
";"             { return SEMICOLON; }
"="             { return ASSIGN; }
"print"         { return PRINT; }
{number}        { yylval = atoi(yytext); return NUM; }
{id}            { return ID; }
%%