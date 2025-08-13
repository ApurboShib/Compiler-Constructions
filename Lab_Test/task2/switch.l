%option noyywrap

%{
    #include "switch.tab.h"
%}

digit   [0-9]
number  {digit}+\.?{digit}*
id      [a-zA-Z_][a-zA-Z0-9_]*
string  \"[^\"]*\"
comment \/\/.*
ws      [ \t\n]+

%%
{ws}                {}
{comment}           {}
"#include"          { return INCLUDE; }
"<stdio.h>"         { return STDIO; }
"int"               { return INT; }
"char"              { return CHAR; }
"float"             { return FLOAT; }
"main"              { return MAIN; }
"printf"            { return PRINTF; }
"scanf"             { return SCANF; }
"switch"            { return SWITCH; }
"case"              { return CASE; }
"default"           { return DEFAULT; }
"break"             { return BREAK; }
"return"            { return RETURN; }
"if"                { return IF; }
"else"              { return ELSE; }

"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
","                 { return COMMA; }
";"                 { return SEMICOLON; }
":"                 { return COLON; }
"="                 { return ASSIGN; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return MUL; }
"/"                 { return DIV; }
"!="                { return NEQ; }
"&"                 { return AMPERSAND; }
"%c"                { return CHAR_FORMAT; }
"%f"                { return FLOAT_FORMAT; }
"%.2f"              { return FLOAT_PRECISION; }

"'"."'"             { yylval.id = strdup(yytext); return CHAR_LITERAL; }
{string}            { yylval.id = strdup(yytext); return STRING; }
{number}            { yylval.num = atof(yytext); return NUM; }
{id}                { yylval.id = strdup(yytext); return ID; }
%%
