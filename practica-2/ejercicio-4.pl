init :- write('Ingrese la lista: '), readList(X), firstTwo(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

firstTwo([]) :- write([]), write([]).
firstTwo([H]) :- write(H), write([]).
firstTwo([H1|H2|_]) :- write(H1), write(H2).
