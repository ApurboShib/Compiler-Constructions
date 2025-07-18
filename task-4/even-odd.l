%option noyywrap

%{
    #include "even-odd.tab.h"
    #include <stdlib.h>
%}

digit [0-9]
number {digit}+
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
under [_]
id ({under}|{alpha})({under}|{alpha}|{digit})*
float_num {number}"."{number}

%%

{ws}             {/* skip whitespace */}
"int"            { return INT_TYPE; }
"float"          { return FLOAT_TYPE; }
{float_num}      { yylval = atof(yytext); return FLOAT_NUM; }
{number}         { yylval = atoi(yytext); return INT_NUM; }
"="              { return ASSIGN; }
";"              { return SEMI; }
{id}             { return ID; }

%%