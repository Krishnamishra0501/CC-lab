%{
#include<stdio.h>
int count = 0;
%}

%%
pen { count++;}
.|\n {}
%%

int main() {
printf("Enter para");
yylex();
printf("The freq of word is %d",count);
return 0;
}
int yywrap(){
return 1;
}

