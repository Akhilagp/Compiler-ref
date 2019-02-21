digit [0-9]

%{
#include<stdio.h>
int charcount =0;char* arr; int i,j,flag=0;
%}

%%
{digit}+ {
arr = yytext;
for(i=0;i<yyleng;i++){
for(j =0;j<i;j++){
if(arr[i]== arr[j])
{
flag =1;
break;}
}
}
if (flag==0){
printf("Valid: %s",yytext);
flag=0;
}
else
{
printf("Invalid");
flag=0;
}
}
%%

int main(){
yylex();
return 0;
}
