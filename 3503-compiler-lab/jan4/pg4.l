%{

#include <stdio.h>
int i=0,acnt=0,bcnt=0;
char* arr;
%}
number [0-9]
n_lower [^a-z]
lowe [^aeiouA-Z]
q1 "/*"
q2 "*/"
%%
.* {
arr=yytext;
for(i=0;arr[i]!=0;i++)
{
if(arr[i]=='a'){acnt++;}
if(arr[i]=='b'){bcnt++;}
}
if((acnt%2==0)&&(bcnt%2==1))
{
printf("%s %d %d\n",yytext,acnt,bcnt);
acnt=0;bcnt=0;}
else
{printf("Invalid");
acnt=0;bcnt=0;
}
}
.|\n {}
%%
int main()
{
yylex();
return 0;
}
