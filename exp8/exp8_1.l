%{
#include<stdio.h>
#include"y.tab.h"
}%

%%
[0-9]+  	{yylval= atoi(yytext); return num;}
[+*] 		{return yytext[0];}
//use multiple operators and function for conv string to int
[ \t]  		{ ;}
. 		{printf("invalid %s",yytext);}
%%

int yywrap(){
	return 1;
	}

