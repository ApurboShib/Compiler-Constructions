%option noyywrap

%{
    #include "check.tab.h"
%}

digit   [0-9]
number  {digit}+
id      [a-zA-Z_][a-zA-Z0-9_]*
ws      [ \t\n]+
comment "//".*

%%
{ws}                {}
{comment}           {}
"int"               { return INT; }
"do"                { return DO; }
"while"             { return WHILE; }
"if"                { return IF; }
"else"              { return ELSE; }
"return"            { return RETURN; }
"scanf"             { return SCANF; }
"printf"            { return PRINTF; }

"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
";"                 { return SEMICOLON; }
","                 { return COMMA; }
"&"                 { return AMP; }

"=="                { return EQ; }
"="                 { return ASSIGN; }
"!="                { return NEQ; }
"%"                 { return MOD; }
"/"                 { return DIV; }
"*"                 { return MUL; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }

{number}            { yylval.num = atoi(yytext); return NUM; }
{id}                { yylval.id = strdup(yytext); return ID; }
\"[^"]*\"           { return STRING; }
%%