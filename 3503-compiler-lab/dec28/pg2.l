%{
#include <stdio.h>
int charcnt=0,wcnt=0,line=0,cntkey=0,cntparen=0,cntassi=0,cntspe=0,cntoper=0,cntiden=0,cntnum=0,cntspace=0;
%}
alphanumeric [a-zA-Z_0-9]
digit [0-9]
letter [a-zA-Z]
key printf|define|int|float|void|main|if|then|else|for|while|return
paran [()]
assi =
relaoper "<"|"<="|">="|">"|"="|"!="
specsym "!"|"@"|"#"|"$"|"%"|"^"|"&"|"*"|"()"
up [A-Z]
lowe [a-z]
oper "+"|"-"|"*"|"/"
spe "#"|"%"
fs "%d"|"%s"|"%f"
cr \\n|\\t
%{
%}
%%
{key} {printf("Keyword: %s\n",yytext);cntkey++; charcnt+=yyleng; wcnt++;}
{up} {printf("Uppercase: %s\n",yytext); charcnt+=yyleng; wcnt++;}
{lowe} {printf("Lowecase: %s %d\n",yytext,yyleng);charcnt+=yyleng; wcnt++;}
{relaoper} {printf("Relational Operator: %s\n",yytext); charcnt++;}
{specsym} {printf("Special Character: %s\n",yytext);charcnt++; cntspe++;}
\n {charcnt++; line++;}
. {charcnt++; printf("Edho onnu\n");}
%%
int main()
{
yylex();
printf("K:%d,Ch:%d,WC:%d,L:%d",cntkey,charcnt,wcnt,line);
return 0;
}
