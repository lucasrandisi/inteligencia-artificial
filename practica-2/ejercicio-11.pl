init :- write('Ingrese la lista:\n'), readList(X), greatest(X, A), write('El mayor es: '), write(A).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).


greatest([H], A) :- A is H.
greatest([H1|[H2|T]], A) :- H1 > H2, greatest([H1|T], A).
greatest([_|[H2|T]], A) :- greatest([H2|T], A).
