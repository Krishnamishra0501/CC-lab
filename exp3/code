%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][A-Za-z0-9_]*    { count++; }
[ \t\n]+             ;
.                    ;
%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    printf("worsds starting with: %d\n", count);
    return 0;
}
