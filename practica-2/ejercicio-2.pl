init :- write('Ingrese la lista: '), readList(X), header(X), tail(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

header([]) :- write([]).
header([H|_]) :- write(H).

tail([]) :- write([]).
tail([_|T]) :- write(T).
