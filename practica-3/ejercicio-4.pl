init :- write('Ingrese un string:\n'), read(X), toArray(X, Y), write(Y). 

toArray('', []).
toArray(X, [H|T]) :- sub_atom(X, 0, 1, _, H), sub_atom(X, 1, _, 0, X2), toArray(X2, T).