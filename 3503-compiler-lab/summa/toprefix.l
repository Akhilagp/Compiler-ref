%option noyywrap

%{
	char txt[10001],stack[100001],qu[100001][1000];
	int in = 0,i,stop = 0,err = 0,qf=0,qr=0;
	int prec(char a,char b)
	{
		if(a==b)
			return 0;
		if(a=='*' && b!='/')
			return 1;
		if(a=='/' && b != '*')
			return 1;
		return 0;
	}
%}
%%
[a-zA-Z]([0-9a-zA-Z])*	{
				for(i=0;i<yyleng;i++)
					qu[qr][i] = yytext[i];
				qu[qr][i] = '\0';
				qr++;
				//printf("%s\n",qu[qr - 1]);
			}  
\(			if(err == 0){
				while(stop>0)
				{
					txt[in++] = stack[--stop];
				}
				while(qf != qr)
				{
					for(i=0;qu[qf][i] != '\0';i++)
						txt[in++] = qu[qf][i];
					qf++;
				}
				err =1;
			} 
\)			err = 0;  	
\+|-|\*|\/		{
				while(stop>0 && prec(yytext[0],stack[stop-1]) == 1)
				{
					txt[in++] = stack[--stop];
					for(i=0;qu[qf][i] != '\0';i++)
						txt[in++] = qu[qf][i];
					qf++;
				}
				stack[stop++] = yytext[0];
			}		

" "		
"\n"			{
				if(err == 0){
				while(stop>0)
				{
					txt[in++] = stack[--stop];
					//txt[in++] = ' ';
				}
				while(qf != qr)
				{
					for(i=0;qu[qf][i] != '\0';i++)
						txt[in++] = qu[qf][i];
					qf++;
				}
				printf("Prefix:%s\n",txt);
				in = 0;			
				}
				else 
				{
					printf("invalid\n");
					stop = 0;
					qr = 0;
					qf = 0;
					in = 0;
				}
			}	
%%
int main()
{

	yylex();
	return 0;
}
