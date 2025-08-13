%option noyywrap

%{
    #include "prime.tab.h"
%}

digit   [0-9]
number  {digit}+
id      [a-zA-Z_][a-zA-Z0-9_]*
string  \"[^\"]*\"
comment \/\/.*
ws      [ \t\n]+

%%
{ws}                {}
{comment}           {}
"int"               { return INT; }
"for"               { return FOR; }
"if"                { return IF; }
"break"             { return BREAK; }
"printf"            { return PRINTF; }
"return"            { return RETURN; }
"main"              { return MAIN; }

"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
","                 { return COMMA; }
";"                 { return SEMICOLON; }
"="                 { return ASSIGN; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return MUL; }
"/"                 { return DIV; }
"%"                 { return MOD; }
"=="                { return EQ; }
"<="                { return LE; }
">="                { return GE; }
"<"                 { return LT; }
">"                 { return GT; }
"!="                { return NEQ; }
"++"                { return INC; }
"+="                { return PLUSEQ; }

{string}            { yylval.id = strdup(yytext); return STRING; }
{number}            { yylval.num = atoi(yytext); return NUM; }
{id}                { yylval.id = strdup(yytext); return ID; }
%%