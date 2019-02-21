%{
#include<iostream>
using namespace std;
string init="",inc="",cond="",cont="";
%}
%s INIT
%s COND
%s INC
%s CONT
%s LAST
%%
<INITIAL>"for(" {BEGIN INIT;}
<INIT>";" {init+=yytext;cout<<init<<"\nloop:\n";BEGIN COND;}
<INIT>. {init+=yytext;}
<COND>";" {cout<<"if("<<cond<<")\n";BEGIN INC;}
<COND>. {cond+=yytext;}
<INC>\n {cout<<"lo";}
<INC>")" {inc+=";";BEGIN CONT;}
<INC>. {inc+=yytext;}
<CONT>"{" {cont+=yytext;}
<CONT>\n {cont+=yytext;}
<CONT>"}" {cout<<cont<<inc<<"\ngoto loop;\n"<<yytext<<"\n"; BEGIN LAST;}
<CONT>. {cont+=yytext;}
<LAST>\n {cout<<"else{\n"<<"cout<<"<<"'Failed';"<<"\n}\n";BEGIN INITIAL;}
%%
int main(){
yylex();
return 0;
}
