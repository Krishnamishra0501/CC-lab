
%{
#include "tac.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = strdup(yytext); return ID; }
[+\-*/()]               { return yytext[0]; }
[ \t\n]+                ;
.                       { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}
