guitarrista(carolina).
guitarrista(jose).
guitarrista(miguel).

cantante(mariano).
cantante(silvia).
cantante(mauro).

baterista(eduardo).
baterista(diego).
baterista(laura).

localidad(carolina, rosario).
localidad(jose, rosario).
localidad(miguel, funes).
localidad(mariano, rosario).
localidad(silvia, funes).
localidad(eduardo, roldan).
localidad(diego, casilda).
localidad(laura, rosario).
localidad(maruo, funes).


banda(L) :- guitarrista(X), localidad(X, L),
    cantante(Y), localidad(Y, L),
    baterista(Z), localidad(Z, L).
