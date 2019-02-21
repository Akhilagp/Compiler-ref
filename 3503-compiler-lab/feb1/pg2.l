iden [a-zA-Z][a-zA-Z_0-9]*
key int|float|double|void
sp [ ]
%{
#include<iostream>
using namespace std;
char sp='a';
int cnt=0;
%}
%s MAC
%s DESC
%s CONT
%%
<INITIAL>{iden} {cout<<"#define "<<yytext;BEGIN DESC;}
<DESC>"(" ECHO;
<DESC>")" {ECHO; BEGIN CONT;}
<DESC>. ECHO;
<CONT>"("|")" {}
<CONT>"{" {cout<<" (";}
<CONT>"}" {cout<<")"<<endl; BEGIN INITIAL;}
<CONT>";" {}
<CONT>"return" {}
<CONT>. {cout<<yytext;}
\n {cout<"la";}
%%
int main(){
yylex();
return 0;
}
