%{
#include <stdio.h>
%}
%%
[a-z]+\n  {printf("Saw a string : %s \n", yytext); yyless(3); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
