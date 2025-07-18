%option noyywrap

%{
    #include "check.tab.h"
    #include <stdlib.h>
%}

digit [0-9]
number ({digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
under [_]
id ({under}|{alpha})({under}|{alpha}|{digit})*
string \"[^\"]+\"

%%
{ws} {}

"int"              { return INT; }
"if"               { return IF; }
"else"             { return ELSE; }
"printf"           { return PRINTF; }

"="                { return ASSIGN; }
","                { return COMMA; }
";"                { return SEMICOLON; }
"("                { return LPAREN; }
")"                { return RPAREN; }
"{"                { return LBRACE; }
"}"                { return RBRACE; }
">"                { return GREATER; }

{number}           { yylval = atoi(yytext); return NUM; }
{id}               { return ID; }
{string}           { return STRING; }
%%