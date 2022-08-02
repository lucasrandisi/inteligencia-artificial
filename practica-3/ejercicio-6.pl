init :- write('Ingrese un numero:\n'), read(X), toBinary(X).

toBinary(0) :- write(0).
toBinary(1) :- write(1).
toBinary(X) :- B is X mod 2, R is X div 2, toBinary(R), write(B).
