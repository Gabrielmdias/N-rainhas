igual([],_).

igual([L | LS], [S|SL]):-
	((var(L),!, igual(LS, SL));L =:= S),
	igual(LS, SL).

rainhas(L, S):-
	length(L ,T),
	T < 11,
	T > 3,
	numlist(1, T, NL),
	permutation(NL , S),
	igual(L ,S),
	solucao(S),
	nl,
        imprimir(S),nl.

solucao([]).
solucao([Q|Resto]) :-
	solucao(Resto),
	naoataca(Q, Resto,1).

naoataca(_,[],_).
naoataca(X,[X1|Resto], Index) :-
	X-X1 =\= Index,
	X1-X =\= Index,
	Index2 is Index +1,
	naoataca(X, Resto, Index2).


imprimir([]).

imprimir([S|RESTO]):-
   (S == 1, write('    R C C C C C C C C C'),nl;
    S == 2, write('    C R C C C C C C C C'),nl;
    S == 3, write('    C C R C C C C C C C'),nl;
    S == 4, write('    C C C R C C C C C C'),nl;
    S == 5, write('    C C C C R C C C C C'),nl;
    S == 6, write('    C C C C C R C C C C'),nl;
    S == 7, write('    C C C C C C R C C C'),nl;
    S == 8, write('    C C C C C C C R C C'),nl;
    S == 9, write('    C C C C C C C C R C'),nl;
    S == 10, write('    C C C C C C C C C R'),nl),
    imprimir(RESTO).
