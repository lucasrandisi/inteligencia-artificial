init :- write('Ingrese un string:\n'), read(X), write('Ingrese un caracter:\n'), read(C), ocurrences(X, C, R), write(R).

ocurrences(X, C, R) :- 
    sub_atom(X, FirstOcurrenceIndex, 1, _, C), 
    I is FirstOcurrenceIndex + 1, 
    sub_atom(X, I, _, 0, T),
    ocurrences(T, C, R2),
    R is R2 + 1.
ocurrences(X, C, 0).
