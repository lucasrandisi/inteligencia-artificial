init :- write('Ingrese un string:\n'), read(X), write(X), fistWhiteSpaceIndex(X, Y), write(Y). 

fistWhiteSpaceIndex([H|_], I) :- write(H), H = ' ', I is 0.
fistWhiteSpaceIndex([_|T], I) :- write(T), fistWhiteSpaceIndex(T, I2), I is I2 + 1.

words('', []).
words(X, [H|T]) :- sub_atom(X, 0, 1, _, H), H \= ' ', sub_atom(X, 1, _, 0, XT), words(XT, T).
words(X, [T]) :- sub_atom(X, 1, _, 0, XT), words(XT, T).
