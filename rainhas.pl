% Exercicio 2.

:- use_module(library(plunit)).

%% rainhas(?Q) is semidet.
%  Verdadeiro, se Q corresponde a uma Solucao para o Tabuleiro de 8.
rainhas(Q) :-
    permutation([1, 2, 3, 4, 5, 6, 7, 8], Q),
    solucao(Q).

solucao([]).
solucao([X | XS]) :-
    diagonal_valida(X, XS, [X | XS]),
    solucao(XS).

%% diagonal_valida(+X, +Y, ?Q) is semidet.
%  Verdadeiro,
diagonal_valida( _ , [] , _ ).
diagonal_valida(X, [Y | YS], Q) :-
    indice(X, Q, X0),
    indice(Y, Q, Y0),
    diagonal_livre(X, Y, X0, Y0),
    diagonal_valida(X, YS, Q).

%% diagonal_livre(+X, +Y, +X0, +Y0) is det.
%  Verdadeiro, se abs(X - Y) != abs(X0 - Y0).
diagonal_livre(X, Y, X0, Y0) :-
    diferenca_absoluta(X,  Y,  P1),
    diferenca_absoluta(X0, Y0, P2),
    P1 =\= P2.

% Testes:
:- begin_tests(diagonal_livre).
   test(diagonal_livre0) :- diagonal_livre(2, 3, 3, 5).
   test(diagonal_livre1) :- diagonal_livre(2, 3, 7, 5).
   test(diagonal_livre2) :- diagonal_livre(1, 8, 4, 5).
   test(diagonal_livre3, [fail]) :- diagonal_livre(2, 3, 4, 5).
   test(diagonal_livre4, [fail]) :- diagonal_livre(2, 0, 6, 4).
:- end_tests(diagonal_livre).

%% diferenca_absoluta(+A, +B, ?C) is semidet.
%  Verdadeiro, se C = absoluto(A - B).
diferenca_absoluta(A, B, C) :-
    A > B,
    C is A - B,
    !.
diferenca_absoluta(A, B, C) :-
    B >= A,
    C is B - A,
    !.

% Testes:
:- begin_tests(diferenca_absoluta).
   test(diferenca_absoluta0) :- diferenca_absoluta(4, 1, 3).
   test(diferenca_absoluta1) :- diferenca_absoluta(1, 4, 3).
   test(diferenca_absoluta2, [fail]) :- diferenca_absoluta(1, 4, -3).
   test(diferenca_absoluta3) :- diferenca_absoluta(5, 5, 0).
   test(diferenca_absoluta4, [fail]) :- diferenca_absoluta(2, 6, -4).
:- end_tests(diferenca_absoluta).

%% Indice(+XS, +E, ?Q) is semidet.
%  Verdadeiro, se o Indice de E na Lista XS e Q.
indice(E, [E | _ ], 1) :- !.
indice(E, [ _ | R], I):-
  indice(E, R, I0),
  !,
  I is I0 + 1.

% Testes:
:- begin_tests(indice).
    test(indice0, Q =:= 1) :- indice(1, [1, 2, 3], Q).
    test(indice1, Q =:= 2) :- indice(5, [4, 5], Q).
    test(indice2, Q =:= 3) :- indice(3, [1, 1, 3, 3], Q).
    test(indice3, [fail])  :- indice(0, [1, 2, 3], 5).
    test(indice4, [fail])  :- indice(1, [1, 2, 3], 2).
:- end_tests(indice).
