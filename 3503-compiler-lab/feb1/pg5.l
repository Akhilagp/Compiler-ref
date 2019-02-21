%{
#include<iostream>
using namespace std;
string init="",inc1="",cond="",cont1="",inc2="",cont2="";
%}
%s INIT1
%s INIT2
%s COND1
%s COND2
%s INC1
%s INC2
%s BODY1
%s BODY2
%s LAST
%%
<INITIAL>"for(" {BEGIN INIT1;}
<INIT1>";" {init+=yytext;cout<<init<<"\nloop:\n";init="";BEGIN COND1;}
<INIT1>. {init+=yytext;}
<COND1>";" {cout<<"if("<<cond<<")\n";cond="";BEGIN INC1;}
<COND1>. {cond+=yytext;}
<INC1>")" {inc1+=";";BEGIN BODY1;}
<INC1>. {inc1+=yytext;}
<BODY1>"for(" {cout<<cont1;BEGIN INIT2;}
<BODY1>\n {cont1+=yytext;}
<BODY1>"}" {cout<<cont1<<inc1<<"\ngoto loop;\n"<<yytext<<"\n"; BEGIN INITIAL;}
<BODY1>. {cont1+=yytext;}
<INIT2>";" {init+=yytext;cout<<init<<"\nloop2:\n";BEGIN COND2;}
<INIT2>. {init+=yytext;}
<COND2>";" {cout<<"if("<<cond<<")\n";BEGIN INC2;}
<COND2>. {cond+=yytext;}
<INC2>")" {inc2+=";";BEGIN BODY2;}
<INC2>. {inc2+=yytext;}
<BODY2>"{" {cont2+=yytext;}
<BODY2>\n {cont2+=yytext;}
<BODY2>"}" {cout<<cont2<<inc2<<"\ngoto loop2;\n"<<yytext<<"\n"; cont1="";BEGIN BODY1;}
<BODY2>. {cont2+=yytext;}
\n ;
%%
int main(){
yylex();
return 0;
}
