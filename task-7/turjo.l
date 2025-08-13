%option noyywrap

%{
    #include "turjo.tab.h"
%}

digit   [0-9]
number  {digit}+
id      [a-zA-Z_][a-zA-Z0-9_]*
ws      [ \t\n]

%%
{ws}            {}
"for"           { return FOR; }
"print"         { return PRINT; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }
"="             { return ASSIGN; }
"<="            { return LE; }
"++"            { return INC; }
{number}        { yylval = atoi(yytext); return NUM; }
{id}            { return ID; }
%%