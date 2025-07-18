%option noyywrap

%{
    #include "nested.tab.h"
    #include <stdlib.h>
%}

digit [0-9]
number ({digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
under [_]
id ({under}|{alpha})({under}|{alpha}|{digit})*

%%
{ws} {}

"for"        { return FOR; }
"int"        { return INT; }
"printf"     { return PRINTF; }

"="          { return ASSIGN; }
"<"          { return LESS; }
"++"         { return INC; }
"+"          { return PLUS; }
","          { return COMMA; }
";"          { return SEMICOLON; }
"("          { return LPAREN; }
")"          { return RPAREN; }
"{"          { return LBRACE; }
"}"          { return RBRACE; }

{number}     { yylval = atoi(yytext); return NUM; }
{id}         { return ID; }
%%