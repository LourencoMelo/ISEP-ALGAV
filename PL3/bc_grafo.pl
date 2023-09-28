% liga(a,c).
% liga(c,g).

%a)
liga(a,c).
liga(c,g).
liga(a,b).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,x1).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

%b)
connect(X,Y):-liga(X,Y);liga(Y,X).

dfs(Orig, Dest, Cam):- dfs2(Orig, Dest, [Orig], Cam).
dfs2(Dest, Dest, LA, Cam):- reverse(LA,Cam).
dfs2(Act,Dest,LA,Cam):- liga(Act,X), \+member(X,LA), dfs2(X,Dest,[X|LA],Cam).

%d)
all(A,J,LL):- findall(L,dfs(A,J,L),LL).

%e)
findsmall([L],L). 
findsmall([L|L1],R):-findsmall(L1,R1),length(L,T),length(R1,T1),((T<T1, R = L);R=R1).
findsmallest(A,J,R):-all(A,J,LL), findsmall(LL,R).

%f)
dfsCorte(Orig, Dest, Cam, Corte):-dfsCorte2(Orig,Dest,[Orig],Cam,Corte,0).
dfsCorte2(Dest,Dest,LA,Cam,Corte,Corte):- reverse(LA,Cam).
dfsCorte2(Act,Dest,LA,Cam,Corte, Cont):- liga(Act,X),(Cont =< Corte, \+member(X,LA)),Cont1 is Cont +1, dfsCorte2(X,Dest,[X|LA],Cam,Corte, Cont1).


%g)
bfs(Orig, Dest, Cam):- bfs2(Dest, [[Orig]], Cam).
bfs2(Dest,[[Dest|T]|_],Cam):- reverse([Dest|T],Cam).
bfs2(Dest,[LA|Outros], Cam):- LA=[Act|_], findall([X|LA],(Dest\==Act, connect(Act,X),\+ member(X,LA)),Novos),
append(Outros,Novos,Todos),
bfs2(Dest,Todos,Cam).
