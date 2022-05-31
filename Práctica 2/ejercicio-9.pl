init :- write('Ingrese la lista: '), readList(X), promedio(X, 0, 0).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

promedio([], 0, 0) :- write('No es posible calcular el promedio').
promedio([], S, C) :- N is S / C, write(N).
promedio([H|T], S, C) :- S2 is S + H, C2 is C + 1,  promedio(T, S2, C2).