init :- write('Ingrese un string:\n'), read(X), words(X, Y), write(Y).

words(X, [H|T]) :- 
    sub_atom(X, FirstWhiteSpaceIndex, _, _, ' '),
    sub_atom(X, 0, FirstWhiteSpaceIndex, _, H), 
    I is FirstWhiteSpaceIndex + 1,
    sub_atom(X, I, _, 0, X2),
    words(X2, T).
words(X, [X]).
