init :- write('Ingrese la lista: '), readList(X), last(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

last([]) :- write([]).
last([T]) :- write(T).
last([_|T]) :- last(T).
 