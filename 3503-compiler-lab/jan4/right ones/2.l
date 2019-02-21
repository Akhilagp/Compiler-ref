%option noyywrap
%{
	int kc=0,oc= 0,ic = 0,bc = 0,wc = 0,nc = 0;
%}
%%
return|float 		{printf("<%s> Keyword\n",yytext); kc++;}
\+\+|--|==|<=|>=|\|\|	{printf("<%s> Operation Token\n",yytext); oc++;}
=|\+|\-|\*|\/|\;|\?|\: 	{printf("<%s> Operation Token\n",yytext); oc++;}
[a-zA-Z][a-zA-Z0-9]* 	{ic++; printf("<%s> Identifier Token\n",yytext);}
\(|\{|\)|\} 		{printf("<%s> Brackets Token\n",yytext); bc++;}
"\t"|" "|"\n" 		{printf("Whitespace\n"); wc++;}
(\+|-)?[0-9]+(\.[0-9]+)?(e(\+|-)?[0-9]+)? {printf("<%s> Number Token",yytext); nc++;}
%%
int main()
{
	yylex();
	printf("%d Keywords\n%d Operations\n%d Identifiers\n%d Whitespaces\n%d Brackets\n%d Numbers\n",kc,oc,ic,wc,bc,nc);
	return 0;
}
