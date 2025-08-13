%option noyywrap

%{
    #include "check2.tab.h"
%}

digit   [0-9]
number  {digit}+(\.[0-9]+)?
id      [a-zA-Z_][a-zA-Z0-9_]*
ws      [ \t\n]+

%%
{ws}                {}
"int"               { return INT; }
"char"              { return CHAR; }
"double"            { return DOUBLE; }
"switch"            { return SWITCH; }
"case"              { return CASE; }
"default"           { return DEFAULT; }
"break"             { return BREAK; }
"if"                { return IF; }
"else"              { return ELSE; }
"return"            { return RETURN; }
"scanf"             { return SCANF; }
"printf"            { return PRINTF; }
"pow"               { return POW; }

"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
";"                 { return SEMICOLON; }
","                 { return COMMA; }
"&"                 { return AMP; }
":"                 { return COLON; }
"^"                 { return CARET; }

"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return MUL; }
"/"                 { return DIV; }
"=="                { return EQ; }
"!="                { return NEQ; }
"="                 { return ASSIGN; }

{number}            { yylval.num = atof(yytext); return NUM; }
\'[^\']\'           { return CHARLIT; }
{id}                { yylval.id = strdup(yytext); return ID; }
\"[^"]*\"           { return STRING; }
%%