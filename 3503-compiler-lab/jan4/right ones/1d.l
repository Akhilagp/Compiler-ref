%{
int z=0, o=0, t=0, thr=0, fr=0, fv=0, sx=0, sn=0, ei=0, nn=0;
%}

%%
1 o++;
2 t++;
3 thr++;
4 fr++;
5 fv++;
6 sx++;
7 sn++;
8 ei++;
9 nn++;
0 z++;
%%

int main()
{
yylex();

if( (z<=2) && (o<=2) && (t<=2) && (thr<=2) && (fr<=2) && (fv<=2) && (sx<=2) && (sn<=2) && (ei<=2) && (nn<=2) )
 { printf("\nValid"); }


return 0;
}
