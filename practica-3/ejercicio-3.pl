init :- write('Ingrese un string:\n'), read(X), 
    atom_length(X, L), write('\natom_length: '), write(L),
    strLen(X, L), write('\nsub_atom: '), write(L).

strLen('', 0).
strLen(X, L) :- sub_atom(X, 0, _, 1, X2), strLen(X2, L2), L is L2 + 1.