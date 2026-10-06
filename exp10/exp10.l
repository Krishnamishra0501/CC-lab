%{
#include "for.tab.h"
%}

%%

"for"	{return FOR;}
"++"	{return INC;}
"--" 	{return DEC;}
"<="	{return LE;}
">="	{return GE;}
"=="	{return EQ;}
"<"	{return '<';}
">"	{return '>';}
"="	{return '=';}
[0-9]+	{return NUMBER;}

[a-zA-Z_][a-zA-Z0-9]+	{return ID;}
[(){};]	{return yytext[0];}

[ \t\n] 	;
%%
int yywrap(){
return 1;
}

