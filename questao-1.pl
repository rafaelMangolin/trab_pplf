solucao(C,V):-
	member(C,[ana,bruno,carlos,daniel]),
	apenas_um(C,[ana,carlos,daniel,bruno],V,X),
	X == 1,
	!.

apenas_um(_,[],_,Y):- Y is 0, !.
apenas_um(C,[X|X0],V,Y):-
	apenas_um(C,X0,V,Y1),
        criminoso(X,C),
	V = X,
	Y is Y1+1,
	!.
apenas_um(C,[X|X0],V,Y):-
	apenas_um(C,X0,V,Y1),
        \+criminoso(X,C),
	Y is Y1,
	!.


criminoso(ana,A):- A \= ana.
criminoso(bruno,carlos).
criminoso(carlos,daniel).
criminoso(daniel,D):- D \= daniel.
