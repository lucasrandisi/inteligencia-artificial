init :- write('Ingrese la lista: '), readList(X), length(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

length(X) :- count(X, Q), write(Q).

count([], Q) :- Q is 0.
count([_|T], Q) :- count(T, R), Q is R + 1.