precede(a, c).
precede(b, d).
precede(c, d).
precede(d, e).
precede(b, f).
precede(f, g).
precede(g, j).
precede(e, h).
precede(e, i).
precede(i, j).


requiere_de(X, Y) :- precede(Y, X).
requiere_de(X, Y) :- precede(Y, R), requiere_de(X, R).
