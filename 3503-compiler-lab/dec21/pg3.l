%{
#include <stdio.h>
%}
%%

[a-z]+\n  { yymore(); printf("\n String: %s Length:%d \n", yytext,yyleng); }
.|\n { }
%%
int main(void)
{
yylex();
return 0;
}
