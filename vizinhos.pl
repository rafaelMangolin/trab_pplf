vizinhos(RUA):-
		length(RUA,5),
		member(casa(azul, _ ,  _ , _ , _ ), RUA),
		member(casa(amarela, _ ,  _ , _ , _ ), RUA),
		member(casa(vermelha, _ ,  _ , _ , _ ), RUA),
		member(casa(verde, _ ,  _ , _ , _ ), RUA),
		member(casa(branca, _ ,  _ , _ , _ ), RUA),
		RUA = [casa( _ , noruegues , _ , _ , _ ) | _ ],
		member(casa(vermelha , ingles , _ , _ , _ ), RUA),
		member(casa(_ , sueco , cachorros , _ , _ ),RUA),
		member(casa(_ , dinamarques , _ , cha , _ ),RUA),
		ao_lado_esquerdo(casa(verde,_,_,_,_),casa(branca,_,_,_,_),RUA),
		member(casa(verde,_,_,cafe,_),RUA),
		member(casa(_,_,passaros,_,pall_mall),RUA),
		member(casa(amarela,_,_,_,dunhill),RUA),
		RUA = [_,_,casa(_,_,_,leite,_),_,_],
		ao_lado(casa(_,_,_,_,blends),casa(_,_,gatos,_,_),RUA),
		ao_lado(casa(_,_,cavalos,_,_),casa(_,_,_,_,dunhill),RUA),
		member(casa(_,_,_,cerveja,bluemaster),RUA),
		member(casa(_,alemao,_,_,prince),RUA),
		ao_lado(casa(_,noruegues,_,_,_),casa(azul,_,_,_,_),RUA),
		ao_lado(casa(_,_,_,agua,_),casa(_,_,_,_,blends),RUA),
		member(casa(_,_,aquario,_,_),RUA),
		!.


ao_lado_esquerdo(X,Y,[X,Y|_]) :- ! .
ao_lado_esquerdo(X,Y,[_|L]) :- ao_lado_esquerdo(X,Y,L).

ao_lado(X,Y,[X,Y|_]) :- ! .
ao_lado(X,Y,[Y,X|_]) :- ! .
ao_lado(X,Y,[_|L]) :-
	ao_lado(X,Y,L).


contain(X,[X|_]):-!.
contain(X,[_|L]):-
	length(L,S),
	S > 0,
	contain(X,S).
