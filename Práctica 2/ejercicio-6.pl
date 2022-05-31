
init :- write('Ingrese la lista: '), readList(X), diff(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

diff([]) :- write('No se puede calcular').
diff([_]) :- write('No se puede calcular').
diff([H, T]) :- R is H - T, write(R).
diff([H|[_|T]]) :- diff([H|T]).