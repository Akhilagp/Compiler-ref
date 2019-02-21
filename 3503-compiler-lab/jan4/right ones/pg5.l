%{

#include <stdio.h>
%}
number [0-9]
n_lower [^a-z]
lowe [^aeiouA-Z]
q1 "/*"
q2 "*/"
%%
{q1}[a-z]*((\"){q2}(\"))?[a-z]*{q2} {printf("%s\n",yytext);}
.|\n {}
%%
int main()
{
yylex();
return 0;
}
