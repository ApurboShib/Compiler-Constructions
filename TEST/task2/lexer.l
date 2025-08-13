%option noyywrap

%{
    #include "parser.tab.h"
    #include <stdlib.h>
    extern int line_num;
%}

digit [0-9]
integer ({digit}+)
float_num ({digit}+\.{digit}+|{digit}+\.|\.{digit}+)
number ({integer}|{float_num})
delim [ \t]
ws {delim}+
alpha [A-Za-z]
under [_]
id ({under}|{alpha})({under}|{alpha}|{digit})*
string \"[^\"]*\"

%%
{ws} {}
\n { line_num++; }

"#include"      { return INCLUDE; }
"<stdio.h>"     { return STDIO; }
"int"           { return INT; }
"float"         { return FLOAT; }
"char"          { return CHAR; }
"for"           { return FOR; }
"if"            { return IF; }
"else"          { return ELSE; }
"return"        { return RETURN; }
"printf"        { return PRINTF; }
"scanf"         { return SCANF; }
"main"          { return MAIN; }

"="             { return ASSIGN; }
"+="            { return PLUS_ASSIGN; }
"<="            { return LE; }
">="            { return GE; }
"<"             { return LESS; }
">"             { return GREATER; }
"=="            { return EQ; }
"!="            { return NE; }
"&&"            { return AND; }
"++"            { return INC; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }
"%"             { return MOD; }
"&"             { return AMPERSAND; }
"?"             { return QUESTION; }
":"             { return COLON; }
","             { return COMMA; }
";"             { return SEMICOLON; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"["             { return LBRACKET; }
"]"             { return RBRACKET; }

{string}        { yylval.sval = strdup(yytext); return STRING; }
{number}        { yylval.fval = atof(yytext); return NUM; }
{id}            { yylval.sval = strdup(yytext); return ID; }
.               { /* ignore unknown characters */ }
%%
