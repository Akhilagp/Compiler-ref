iden [a-zA-Z0-9]+
%{
#include<iostream>
using namespace std;
%}
%s OPER
%s ID
%%
{iden} {cout<<yytext;}
"+" {cout<<"||";}
"*" {cout<<"&&";}
%%
int main()
{
yylex();
return 0;
}
