%{

#include <stdio.h>
%}
number [0-9]+
lower [a-z]
se [ab]
%%
abb {printf("Found : %s\n",yytext);}
{se}*{se}* {printf("Hello: %s",yytext);}
.|\n {}
%%
int main()
{
yylex();
return 0;
}
