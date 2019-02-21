%{
#include<bits/stdc++.h>
#include<iostream>
using namespace std;
string dec1="",dec2="",con1="",con2="",inc1="",inc2="",cont1="",cont2="";
int f1=0,f2=0,f3=0;
%}
%s INIT
%s CON
%s INC
%s CONT
<
%%
%%
int main(){
yylex();
return 0;
}

