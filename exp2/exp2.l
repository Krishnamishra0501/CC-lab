%{
#include <stdio.h>

int comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 0;
int spaces = 0;
%}

%x COMMENT

%%

"/*"                    { comments++; BEGIN(COMMENT); }
<COMMENT>"*/"           { BEGIN(INITIAL); }
<COMMENT>\n             { lines++; }
<COMMENT>.              { }

"//".*                  { comments++; }

[ \t]+                  { spaces += yyleng; }

\n                      { lines++; }

"int"|"char"|"float"|"double"|"if"|"else"|"while"|"for"|"return" { keywords++; words++; }

[a-zA-Z_][a-zA-Z0-9_]*  { identifiers++; words++; }

[0-9]+                  { words++; }

.                       { }

%%

int main()
{
    yylex();

    printf("Comments    : %d\n", comments);
    printf("Keywords    : %d\n", keywords);
    printf("Identifiers : %d\n", identifiers);
    printf("Words       : %d\n", words);
    printf("Lines       : %d\n", lines);
    printf("Spaces      : %d\n", spaces);

    return 0;
}

int yywrap()
{
    return 1;
}
