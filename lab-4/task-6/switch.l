%option noyywrap

%{
    #include "switch.tab.h"
%}

digit [0-9]
number {digit}+
id [a-zA-Z_][a-zA-Z0-9_]*
ws [ \t\n]

%%
{ws}         {}
"switch"     { return SWITCH; }
"case"       { return CASE; }
"default"    { return DEFAULT; }
"break"      { return BREAK; }
"{"          { return LBRACE; }
"}"          { return RBRACE; }
":"          { return COLON; }
";"          { return SEMICOLON; }
{number}     { yylval = atoi(yytext); return NUM; }
{id}         { return ID; }
%%