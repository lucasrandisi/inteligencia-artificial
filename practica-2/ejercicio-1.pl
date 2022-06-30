init :- write('Ingrese la lista: '), readList(X), write(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).