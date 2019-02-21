%{
#include <stdio.h>
%}
%%
^(\+|-)[0-9]+\n  {printf("\n Question 3 : %s \n", yytext); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
