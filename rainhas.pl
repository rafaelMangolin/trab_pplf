% Exercicio 2.

:- use_module(library(plunit)).

%% rainhas(?Q) is semidet.
%
rainhas(Q) :-
    permutation([1, 2, 3, 4, 5, 6, 7, 8], Q),
    solucao(Q).


solucao([]).
solucao([X | XS]) :-
    diagonal_valida(X, XS, [X | XS]),
    solucao(XS).

diagonal_valida( _ , [] , _ ).
diagonal_valida(X, [Y | YS], Q) :-
    indice(X, Q, X0),
    indice(Y, Q, Y0),
    abstoluto(X, Y, Z),
    absoluto(X0, Y0, Z0),
    Z =\= Z0,
    diagonal_valida(X, YS, Q).

%% absoluto(+A, +B, ?C) is semidet.
%  Verdadeiro, se C = absoluto(A - B).
absoluto(A, B, C) :-
    A > B,
    C is A - B,
    !.
absoluto(A, B, C) :-
    B >= A,
    C is B - A,
    !.



%% indice(+XS, +E, ?Q) is semidet.
%  Verdadeiro, se o Indice de E na Lista XS e Q.
indice(E, [E | _ ], 1) :- !.
indice(E, [ _ | R], I):-
  indice(E, R, I0),
  !,
  I is I0 + 1.

% Testes:
:- begin_tests(indice).
    test(indice0, Q =:= 0) :- indice([1, 2, 3], 1, Q).
    test(indice1, Q =:= 1) :- indice([4, 5], 5, Q).
    test(indice2, Q =:= 2) :- indice([1, 1, 3, 3], 3, Q).
    test(indice3, [fail])  :- indice([1, 2, 3], 0, 5).
    test(indice4, [fail])  :- indice([1, 2, 3], 1, 2).
:- end_tests(indice).
















