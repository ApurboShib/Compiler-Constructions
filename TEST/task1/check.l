%option noyywrap

%{
    #include "check.tab.h"
    #include <stdlib.h>
%}

digit [0-9]
number (-?{digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
under [_]
id ({under}|{alpha})({under}|{alpha}|{digit})*
string \"[^\"]*\"

%%
{ws} {}

"#include"   { return INCLUDE; }
"<stdio.h>"  { return STDIO; }
"int"        { return INT; }
"char"       { return CHAR; }
"for"        { return FOR; }
"if"         { return IF; }
"else"       { return ELSE; }
"return"     { return RETURN; }
"printf"     { return PRINTF; }
"scanf"      { return SCANF; }
"main"       { return MAIN; }
"choice"     { return CHOICE; }
"menu"       { return MENU; }
"num"        { return NUM_VAR; }

"="          { return ASSIGN; }
"<="         { return LE; }
">="         { return GE; }
"<"          { return LESS; }
">"          { return GREATER; }
"=="         { return EQ; }
"!="         { return NE; }
"&&"         { return AND; }
"++"         { return INC; }
"*="         { return MUL_ASSIGN; }
"+"          { return PLUS; }
"-"          { return MINUS; }
"*"          { return MUL; }
"%"          { return MOD; }
"&"          { return AMPERSAND; }
"?"          { return QUESTION; }
":"          { return COLON; }
","          { return COMMA; }
";"          { return SEMICOLON; }
"("          { return LPAREN; }
")"          { return RPAREN; }
"{"          { return LBRACE; }
"}"          { return RBRACE; }
"["          { return LBRACKET; }
"]"          { return RBRACKET; }

{string}     { return STRING; }
{number}     { yylval = atoi(yytext); return NUM; }
{id}         { return ID; }
.            { /* ignore unknown characters */ }
%%
