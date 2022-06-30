init :- write('Ingrese la lista:\n'), readList(X), repeated(X, Y), write(Y).


readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).


repeated([H|[H|_]], H).
repeated([H|[_|T]], Y) :- repeated([H|T], Y).
repeated([_|[H2|T]], Y) :- repeated([H2|T], Y).