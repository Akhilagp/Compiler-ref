%{

#include <stdio.h>
%}
number [0-9]+
n_lower [^a-z]
lowe [^aeiouA-Z]
%%
^{n_lower}{n_lower}+ {printf("Found : %s\n",yytext);}
.|\n {}
%%
int main()
{
yylex();
return 0;
}
