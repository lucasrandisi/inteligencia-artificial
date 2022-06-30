init :- write('Ingrese la lista:\n'), readList(X), smallest(X, A), write('El menor es: '), write(A).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).


smallest([H], A) :- A is H.
smallest([H1|[H2|T]], A) :- H1 < H2, smallest([H1|T], A).
smallest([_|[H2|T]], A) :- smallest([H2|T], A).
