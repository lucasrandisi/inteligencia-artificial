init :- write('Ingrese un string:\n'), read(X), sub_atom(X, _, 1, 0, Y), write(Y).