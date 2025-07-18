%option noyywrap

%{
    #include "ok.tab.h"
    #include <stdlib.h>
%}

digit [0-9]
number ({digit}+)
negnum "-"?{digit}+
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
under [_]
id ({under}|{alpha})({under}|{alpha}|{digit})*

%%
{ws} {}

"int"        { return INT; }
"if"         { return IF; }
"and"        { return AND; }
"true"       { return TRUE; }

"="          { return ASSIGN; }
";"          { return SEMICOLON; }
","          { return COMMA; }
"("          { return LPAREN; }
")"          { return RPAREN; }
"{"          { return LBRACE; }
"}"          { return RBRACE; }
">"          { return GREATER; }
"<"          { return LESS; }

{negnum}     { yylval = atoi(yytext); return NUM; }
{id}         { return ID; }
%%