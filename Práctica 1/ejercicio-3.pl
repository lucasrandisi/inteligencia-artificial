/* Grupo 1 */
grupo(1, brasil).
grupo(1, españa).
grupo(1, jamaica).
grupo(1, italia).


/* Grupo 2 */
grupo(2, argentina).
grupo(2, nigeria).
grupo(2, holanda).
grupo(2, escocia).


rivales(X, Y) :- grupo(G, X), grupo(G, Y).
