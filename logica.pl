% Exercicio 1.

:- use_module(library(plunit)).

%% solucao(?C, ?V) is semidet.
%  Verdadeiro, se C corresponde ao criminiso e V ao que diz a verdade.
%  Onde para validar isso é usado os quatros predicados fornecidos, onde 
%  apenas um deve ser verdadeiro dado o criminoso
%  Falso, se o requisito(apenas um falando a verdade) não for cumprido
solucao(C, V) :-
    member(C, [ana, bruno, carlos, daniel]),
    apenas_um(C, [ana, carlos, daniel, bruno], V, X),
    X == 1,
    !.

% Teste:
:- begin_tests(solucao).
    test(logica0, C = ana) :- solucao(C,_).
    test(logica1, V = daniel) :- solucao(_,V).
    test(logica2, V = daniel) :- solucao(ana,V).
    test(logica3, C = ana) :- solucao(C,daniel).
    test(logica4, [fail]) :- solucao(bruno,_).
    test(logica5, [fail]) :- solucao(carlos,_).
    test(logica6, [fail]) :- solucao(daniel,_).
    test(logica7, [fail]) :- solucao(_,bruno).
    test(logica8, [fail]) :- solucao(_,carlos).
    test(logica9, [fail]) :- solucao(_,ana).
    test(logica10) :- solucao(ana,daniel).
:- end_tests(solucao).



%% apenas_um(+C, +XS, ?V, ?Y) is semidet.
%  Verdadeiro, se V corresponde ao ultimo que disse a verdade, dada a ordem 
%  do array XS onde C é dado como criminoso, e Y é a quantidades de vezes 
%  que um predicado como verdadeiro dado o C criminoso.
%  Falso, caso exista mais de um dizendo a verdadess
apenas_um( _ , [], _ , Y) :-
    Y is 0, !.
apenas_um(C ,[X | X0], V, Y) :-
    apenas_um(C, X0, V, Y1),
    criminoso(X, C),
    V = X,
    Y is Y1 + 1,
    !.
apenas_um(C, [X | X0], V, Y) :-
    apenas_um(C, X0, V, Y1),
    \+criminoso(X, C),
    Y is Y1,
    !.

% Teste:
:- begin_tests(apenas_um).
    test(apenas_um0, Y = 1) :- apenas_um(ana,[ana,carlos,bruno,daniel],_,Y).
    test(apenas_um1, V = daniel) :- apenas_um(ana,[ana,carlos,bruno,daniel],V,_).
    test(apenas_um2, [fail]) :- apenas_um(carlos,[ana,carlos,bruno,daniel],_,_).
    test(apenas_um3, [fail]) :- apenas_um(bruno,[carlos,bruno,daniel,ana],_,_).
    test(apenas_um4, [fail]) :- apenas_um(daniel,[bruno,ana,carlos,daniel],_,_).
:- end_tests(apenas_um).


%% Fatos sobre o Exercicio 1.
criminoso(ana, A) :- A \= ana.
criminoso(bruno, carlos).
criminoso(carlos, daniel).
criminoso(daniel, D) :- D \= daniel.










