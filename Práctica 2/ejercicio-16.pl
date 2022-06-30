init :- write('Ingrese el elemento:\n'), read(X), write('Ingrese la lista:\n'), readList(Y), 
	countOcurrences(X, Y, Z), write(Z).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

countOcurrences(_, [], 0).
countOcurrences(X, [X|T], Z) :- countOcurrences(X, T, Z2), Z is 1 + Z2.
countOcurrences(X, [_|T], Z) :- countOcurrences(X, T, Z).