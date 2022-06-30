init :- write('Ingrese la persona:\n'), read(X), write('Ingrese la ciudad:\n'), read(Y), visito(X, Y).

persona(lucas, [rosario, perez, roldan]).
persona(augusto, [rosario, bariloche]).


visito(X, Y) :- persona(X, Z), in(Y, Z).

in(Y, [Y|_]).
in(Y, [_|T]) :- in(Y, T).


