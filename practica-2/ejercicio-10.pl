init :- write('Ingrese el elemento:\n'), read(A), write('Ingrese la lista:\n'), readList(X), search(A, X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

search(A, [A|_]).
search(A, [_|T]) :- search(A, T).