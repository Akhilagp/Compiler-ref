%{
#include <stdio.h>
int cntkey=0,cntparen=0,cntassi=0,cntspe=0,cntoper=0,cntiden=0,cntnum=0,cntspace=0;
%}
alphanumeric [a-zA-Z_0-9]
digit [0-9]
letter [a-zA-Z]
key printf|define|int|float|void|main
paran [()]
assi =
oper "+"|"-"|"*"|"/"
spe "#"|"%"
fs "%d"|"%s"|"%f"
cr \\n|\\t
%{
%}
%%
{key} {yytext[0]=yytext[0]-32; printf("Keyword: %s\n",yytext);cntkey++;}
({letter}{alphanumeric}*(" ()"|"()")) {printf("function name: %s\n",yytext);}
{assi} {printf("Assignment operator: %s\n",yytext);cntassi++;}
{paran} {printf("Paranthesis: %s\n",yytext);cntparen++;}
{spe} {printf("Special Character: %s\n",yytext);cntspe++;}
{oper} {printf("Operator symbol: %s\n",yytext);cntoper++;}
{fs} {printf("Format specifier: %s\n",yytext);}
{cr} {printf("Carriage return: %s\n",yytext);}
{letter}{alphanumeric}* {printf("Identifier: %s\n",yytext);cntiden++;}
{digit}* {printf("Number: %s\n",yytext);cntnum++;}
[ \t\n] {printf("Whitspace Delimiter: %s\n",yytext);cntspace++;}
.|\n {}
%%
int main()
{
yylex();
printf("Keywords:%d\tIdentifiers:%d\tNumbers:%d\tWhitespace:%d\tAssignment:%d\tOperators:%d\n",cntkey,cntiden,cntnum,cntspace,cntassi,cntoper);
return 0;
}
