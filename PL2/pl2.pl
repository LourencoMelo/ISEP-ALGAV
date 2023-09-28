%1)
%a)
somaconta([],0,0):-!.
somaconta([H|T],S,C):-somaconta(T,S1,C1), S is S1+H, C is C1 +1.
media(L,M):-somaconta(L,S,C), M is S/C. 
%b)
menorvalor([H],H):-!.
menorvalor([H|T],M):-menorvalor(T,M1), ((H<M1, M is H); M is M1).
%c)
parimpar([],0,0):-!.
parimpar([H|T],P,I):-parimpar(T,P1,I1),(R is H mod 2),((R==0,P is P1+1, I is I1); (I is I1+1, P is P1)).
%d)
apaga(_,[ ],[ ]).
apaga(X,[X|L],M):-!,apaga(X,L,M).
apaga(X,[Y|L],[Y|M]):-apaga(X,L,M).

ultimomenor(L,[M|R]):-menorvalor(L,M), apaga(M, L,R).

%2)
concatena([ ],L,L).
concatena([A|B],C,[A|D]):-concatena(B,C,D).

%3)
inverte(L,LI):-inverte1(L,[ ],LI).
inverte1([ ],L,L).
inverte1([X|L],L2,L3):- inverte1(L,[X|L2],L3).

%4)

apaga1(_,[ ],[ ]).
apaga1(X,[X|L],M):-!,apaga(X,L,M).
apaga1(X,[Y|L],[Y|M]):-apaga(X,L,M).

%5)
substitui(_,_,[],[]).
substitui(X,Y,[X|T],[Y|T1]):-!, substitui(X,Y,T,T1).
substitui(X,Y,[Z|T],[Z|T1]):-substitui(X,Y,T,T1).

%6)
insere(_,_,[],[]).
insere(X,1,[Z|T],[X|T1]):- insere(X,0,[Z|T],T1).
insere(X,Y,[Z|T],[Z|T1]):-Y1 is Y-1, insere(X,Y1,T,T1).

%7)
membro(X,[X|_]).
membro(X,[_|L]):-membro(X,L).

uniao([ ],L,L).
uniao([X|L1],L2,LU):-membro(X,L2),!,uniao(L1,L2,LU).
uniao([X|L1],L2,[X|LU]):-uniao(L1,L2,LU).

%8)
intersecao([],_,[]).
intersecao([X|L1],L2,[X|LI]):-membro(X,L2),!,intersecao(L1,L2,LI).
intersecao([_|L1],L2, LI):- intersecao(L1,L2,LI).

%9)
diferenca([],_,[]).
diferenca([X|T],L1,L):-membro(X,L1),! ,diferenca(T,L1,L).
diferenca([X|T],L1,[X|L]):-diferenca(T,L1,L).

conjdif(X,Y,L):- diferenca(X,Y,L1), diferenca(Y,X,L2), concatena(L1,L2,L).

%dez

flatten([],[]).
flatten([[A|T]|B],L) :- concatena([A|T],B,L1), flatten(L1,L).
flatten([A|T],[A|T1]):- flatten(T,T1).

%onze
combinacao(X,Y,L).
combinacao():-
%doze

