init :- write('Ingrese la primer lista:\n'), readList(X),
    write('Ingrese la segunda lista:\n'), readList(Y),
    concat(X, Y, Z), write(Z).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).


concat([], [], []).
concat([], [H|T], [H|Z]) :- concat([], T, Z).
concat([H|T], Y, [H|Z]) :- concat(T, Y, Z).
