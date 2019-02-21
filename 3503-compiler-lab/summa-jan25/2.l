if_case if[(].*[)]
else_case else[\n]?.*[\n]?
%{
#include<bits/stdc++.h>
int lin,f11=0,f22=0;
char f1[10],f2[10];
%}
%%
{if_case} {
f11++;
int i=0,j=0;
i=3;
if(f11==1){
while(yytext[i]!=')')
{
f1[j]=yytext[i];
i++;
j++;
}}
else if(f11==2)
{
while(yytext[i]!=')')
{
f2[j]=yytext[i];
i++;
j++;
}
printf("if(%s && %s)",f1,f2);
}
}
{else_case} {
f22++;
if(f22==1){}
else if(f22==2){printf("%s",yytext);}
}
. { printf("%s",yytext);}
%%   
int main(){
yylex();
return 0;
}

