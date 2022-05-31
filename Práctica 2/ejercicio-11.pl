init :- write('Ingrese la lista:\n'), readList(X), printGreatest(X).

readList([H|T]) :- read(H), H \= [], readList(T).
readList([]).

printGreatest([]) :- write('Lista Vacía').
printGreatest([H|T]) :- greatest(H, T, B), write('El mayor es: '), write(B). 

greatest(A, [], B) :- write(A), B is A. 
greatest(A, [H|T]) :- A >= H, greatest(A, T).
greatest(_, [H|T]) :- greatest(H, T).

