iden [a-zA-Z][a-zA-Z_0-9]*
spe "#"
def_key "define"
%{
#include<iostream>
using namespace std;
string cont="";
char sp='a';
%}
%s MAC
%s DESC
%s CONT
%%
<INITIAL>{spe}{def_key} {BEGIN MAC;}
<MAC>[ ] {BEGIN DESC;}
<DESC>{iden} {cout<<yytext;}
<DESC>"(" {cout<<yytext;}
<DESC>")" {cout<<yytext; BEGIN CONT;}
<DESC>. {cout<<yytext;}
<CONT>[ ] {sp=yytext[0];}
<CONT>"(" {cout<<"{"<<endl;}
<CONT>")" {cout<<"return "<<cont<<";\n}"; BEGIN INITIAL;}
<CONT>. {cont+=yytext;}
%%
int main(){
yylex();
return 0;
}
