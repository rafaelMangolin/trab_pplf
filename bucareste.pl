%% Exercicio 3


:- use_module(library(plunit)).

%% melhor_caminho(?O, ?M) is semidet.
%  Verdadeiro, se M corresponde ao caminho no formato [fagaras,bucharest] da cidade O a bucharest, e 
%  O sendo a cidade que inicia o caminho
%  Falso, se for passado nomenclatura que não for encontrada, ou se o caminho não for o correto
melhor_caminho(bucharest, [bucharest]) :- !.
melhor_caminho(O, [O | C]) :-
    melhor_vizinho(O, V),
    melhor_caminho(V, C).

% Teste:
:- begin_tests(melhor_caminho).
    test(melhor_caminho0, M = [bucharest]) :- melhor_caminho(_,M).
    test(melhor_caminho1, O = bucharest) :- melhor_caminho(O,_).
    test(melhor_caminho2, O = fagaras) :- melhor_caminho(O,[fagaras,bucharest]).
    test(melhor_caminho3, M = [fagaras,bucharest]) :- melhor_caminho(fagaras,M).
    test(melhor_caminho4) :- melhor_caminho(fagaras,[fagaras,bucharest]).
    test(melhor_caminho5, [fail]) :- melhor_caminho(fagaras,[fagaras,sibiu,bucharest]).
    test(melhor_caminho6, [fail]) :- melhor_caminho(fagara,_).
:- end_tests(melhor_caminho).



%% melhor_vizinho(?O, ?V) is nondet.
%  Verdadeiro, se melhor V corresponde ao vizinho com menor heuristica (distancia de V a bucareste em linha reta)
%  de O.
%  Falso, se for passado nomenclatura que não for encontrada
melhor_vizinho(O, V) :-
    O - O1,
    menor_heuristica(O1, H),
    h(V, H).

% Teste:
:- begin_tests(melhor_vizinho).
    test(melhor_vizinho0) :- findall(X, melhor_vizinho(X,_), _).
    test(melhor_vizinho1,[fail]) :- melhor_vizinho(fagara,_).
    test(melhor_vizinho2,V = bucharest) :- melhor_vizinho(fagaras,V).
    test(melhor_vizinho3) :- findall(X, melhor_vizinho(X,bucharest), _).
    test(melhor_vizinho4,[fail]) :- melhor_vizinho(_,buchareste).
:- end_tests(melhor_vizinho).



%% menor_heuristica(+XS, ?H) is semidet
%  Verdadeiro se H é o menor valor na heuristica h nas cidades contidas em XS
%  Falso se algum valor em XS não pode ser encontrado um valor para a heuristica h
menor_heuristica([], 1000000) :- !.
menor_heuristica([A | A1], H) :-
    menor_heuristica(A1, H1),
    C/_ = A,
    h(C, H0),
    H0 =< H1,
    H = H0, !.
menor_heuristica([A | A1], H) :-
    menor_heuristica(A1, H1),
    C/_ = A,
    h(C, H0),
    H0 > H1,
    H = H1,
    !.

% Teste:
:- begin_tests(menor_heuristica).
    test(menor_heuristica0) :- menor_heuristica([sibiu/140, timisoara/118, zerind/75],253).
    test(menor_heuristica0,fail) :- menor_heuristica([sibiu/140, timisoara/118, zerind/75],251).
:- end_tests(menor_heuristica).



% Distancia entre os Vizinhos:
arad-[sibiu/140, timisoara/118, zerind/75].
bucharest-[fagaras/211, giurgiu/90, pitesti/101, urziceni/85].
craiova-[dobreta/120, pitesti/138, rimnicu_vilcea/146].
dobreta-[craiova/120, mehadia/75].
eforie-[hirsova/86].
fagaras-[bucharest/211, sibiu/99].
giurgiu-[bucharest/90].
hirsova-[eforie/86, urziceni/98].
iasi-[neamt/87, vaslui/92].
lugoj-[mehadia/70, timisoara/111].
mehadia-[dobreta/75, lugoj/70].
neamt-[iasi/87].
oradea-[sibiu/151, zerind/71].
pitesti-[bucharest/101, craiova/138, rimnicu_vilcea/97].
rimnicu_vilcea-[craiova/146, pitesti/97].
sibiu-[arad/140, fagaras/99, oradea/151].
timisoara-[arad/118, lugoj/111].
urziceni-[bucharest/85, hirsova/98, vaslui/142].
vaslui-[iasi/92, urziceni/142].
zerind-[arad/75, oradea/71].

% Heuristicas de cada Cidade.
h(arad,366).
h(bucharest,0).
h(craiova,160).
h(dobreta,242).
h(eforie,161).
h(fagaras,178).
h(giurgiu,77).
h(hirsova,151).
h(iasi,226).
h(lugoj,244).
h(mehadia,241).
h(neamt,234).
h(oradea,380).
h(pitesti,98).
h(rimnicu_vilcea,193).
h(sibiu,253).
h(timisoara,329).
h(urziceni,80).
h(vaslui,199).
h(zerind,374).