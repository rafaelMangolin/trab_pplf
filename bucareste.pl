% Exercicio 3

melhor_caminho(bucharest, [bucharest]) :- !.
melhor_caminho(O, [O | C]) :-
    melhor_vizinho(O, V),
    melhor_caminho(V, C).


melhor_vizinho(O, V) :-
    O - O1,
    menor_heuristica(O1, H),
    h(V, H).

%% menor_heuristica(+XS, ?H).
%
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

















