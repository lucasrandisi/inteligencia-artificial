init :- write('Ingrese la lista: '), readList(X), sum(X, S), write(S).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

sum([], S) :- S is 0.
sum([H|T], S) :- sum(T, SP), S is H + SP.