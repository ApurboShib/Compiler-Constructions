%option noyywrap

%{
    #include "even-odd.tab.h"
    #include <stdlib.h>
%}

digit [0-9]
number ({digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
under [_]
num {digit}{digit}*
float_num {num}*[.]{num}
id ({under}|{alpha})({under}|{alpha}|{digit})*

%%
{ws} {}
{number} { yylval = atoi(yytext); return(INT_NUM); }
. { return yytext[0]; }
%%