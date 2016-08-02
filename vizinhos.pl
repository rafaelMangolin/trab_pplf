% Exercicio 4.

:- use_module(library(plunit)).

%% vizinhos(?R) is det.
%  Verdadeiro, se R corresponde as 16 restricoes do Exercicio 4.
%  A sequencia de cada casa corresponde a:
%      1) Cor
%      2) Nacionalidade
%      3) Animal
%      4) Bebida
%      5) Cigarro
vizinhos(RUA) :-
    length(RUA, 5),
    member(casa(azul, _ ,  _ , _ , _ ), RUA),
    member(casa(amarela, _ ,  _ , _ , _ ), RUA),
    member(casa(vermelha, _ ,  _ , _ , _ ), RUA),
    member(casa(verde, _ ,  _ , _ , _ ), RUA),
    member(casa(branca, _ ,  _ , _ , _ ), RUA),
    RUA = [casa( _ , noruegues, _ , _ , _ ) | _ ],
    member(casa(vermelha, ingles, _ , _ , _ ), RUA),
    member(casa( _ , sueco, cachorros , _ , _ ), RUA),
    member(casa( _ , dinamarques , _ , cha , _ ), RUA),
    ao_lado_esquerdo(casa(verde, _ , _ , _ , _ ), casa(branca, _ , _ , _ , _), RUA),
    member(casa(verde, _ , _ , cafe , _ ), RUA),
    member(casa( _ , _ , passaros , _ , pall_mall), RUA),
    member(casa(amarela, _ , _ , _ , dunhill), RUA),
    RUA = [ _ , _ , casa( _ , _ , _ , leite, _ ), _ , _ ],
    ao_lado(casa( _ , _ , _ , _ ,blends), casa( _ , _ , gatos, _ , _ ), RUA),
    ao_lado(casa( _ , _ , cavalos, _ , _ ), casa( _ , _ , _ , _ ,dunhill),RUA),
    member(casa( _ , _ , _ , cerveja, bluemaster), RUA),
    member(casa( _ , alemao, _ , _ , prince), RUA),
    ao_lado(casa( _ , noruegues, _ , _ , _ ), casa(azul, _ , _ , _ , _ ), RUA),
    ao_lado(casa( _ , _ , _ , agua, _ ), casa( _ , _ , _ , _ , blends), RUA),
    member(casa( _ , _ , aquario, _ , _ ), RUA),
    !.

% Teste:
:- begin_tests(vizinhos).
    test(vizinhos0, R = [casa(amarela, noruegues, gatos, agua, dunhill), casa(azul, dinamarques, cavalos, cha, blends), casa(vermelha, ingles, passaros, leite, pall_mall), casa(verde, alemao, aquario, cafe, prince), casa(branca, sueco, cachorros, cerveja, bluemaster)]) :- vizinhos(R).
    test(vizinhos1, [fail]) :- vizinhos([casa(azul, noruegues, gatos, agua, dunhill), casa(amarela, dinamarques, cavalos, cha, blends), casa(vermelha, ingles, passaros, leite, pall_mall), casa(verde, alemao, aquario, cafe, prince), casa(branca, sueco, cachorros, cerveja, bluemaster)]).
:- end_tests(vizinhos).



%%  ao_lado_esquerdo(+X, +Y, +L) is det.
%   Verdadeiro, se X esta do Lado Esquerdo de X na Lista L.
ao_lado_esquerdo(X, Y, [X, Y| _ ]) :- !.
ao_lado_esquerdo(X, Y, [ _ | L]) :-
    ao_lado_esquerdo(X, Y, L).

% Testes:
:- begin_tests(ao_lado_esquerdo).
    test(ao_lado_esquerdo1) :- ao_lado_esquerdo(1, 2, [1, 2, 3]).
    test(ao_lado_esquerdo2) :- ao_lado_esquerdo(1, 0, [2, 1, 0]).
    test(ao_lado_esquerdo3, [fail]) :- ao_lado_esquerdo(2, 1, [1, 2, 3]).
    test(ao_lado_esquerdo4, [fail]) :- ao_lado_esquerdo(4, 1, [0, 5, 8]).
:- end_tests(ao_lado_esquerdo).

%% ao_lado(+X, +Y, +L) is det.
%  Verdadeiro, se X esta ao Lado de Y na Lista L.
ao_lado(X, Y, [X, Y | _ ]) :- !.
ao_lado(X, Y, [Y, X | _ ]) :- !.
ao_lado(X, Y, [ _ | L]) :-
    ao_lado(X, Y, L).

% Testes:
:- begin_tests(ao_lado).
    test(ao_lado1) :- ao_lado(1, 2, [1, 2, 3]).
    test(ao_lado2) :- ao_lado(3, 2, [1, 2, 3]).
    test(ao_lado3, [fail]) :- ao_lado(3, 1, [1, 2, 3]).
    test(ao_lado4, [fail]) :- ao_lado(1, 3, [1, 2, 3]).
:- end_tests(ao_lado).












