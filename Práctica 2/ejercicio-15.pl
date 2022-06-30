init :- write('Ingrese la lista:\n'), readList(X), repeated(X, Y), write(Y).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).


repeated([], []).
repeated([_], []).
repeated([H|T], [H|Y]) :- in(H, T), repeated(T, Y), not(in(H, Y)).
repeated([_|T], Y) :- repeated(T, Y).

in(X, [X|_]).
in(X, [_|T]) :- in(X, T).