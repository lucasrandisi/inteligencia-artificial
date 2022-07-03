vuelo(salta, cordoba, 80).
vuelo(cordoba, formosa, 120).
vuelo(cordoba, rosario, 55).
vuelo(cordoba, neuquen, 100).
vuelo(cordoba, mendoza, 65).
vuelo(formosa, corrientes, 50).
vuelo(corrientes, posadas, 70).
vuelo(corrientes,  parana, 57).
vuelo(corrientes, santaFe, 93).
vuelo(posadas, parana, 85).
vuelo(santaFe, rosario, 30).
vuelo(rosario, parana, 25).
vuelo(rosario, buenosAires, 55).
vuelo(rosario, mendoza, 175).
vuelo(mendoza, buenosAires, 85).
vuelo(mendoza, neuquen, 83).
vuelo(neuquen,  buenosAires, 90).
vuelo(buenosAires, calafate, 115).
vuelo(buenosAires,  puertoMadryn, 75).
vuelo(neuquen, calafate, 65).

conectadas(A, B) :- vuelo(A, B, _).
conectadas(A, B) :- vuelo(B, A, _).


init :- 
	write('Ciudad de origen:\n'), read(Origen),
	write('Ciudad de destino:\n'), read(Destino),
	write('Mínimos trasbordos? (s/n):\n'), read(MinTrasbordos),
	rutas(Origen, Destino, MinTrasbordos).


rutas(Origen, Destino, MinTrasbordos) :- 
	MinTrasbordos = s, 
	breadthFirstSearch([[Origen]], Destino, Ruta),
	write('Ruta:\n'), write(Ruta).
rutas(Origen, Destino, MinTrasbordos) :- 
	MinTrasbordos = n, 
	deepFirstSearch(Origen, Destino, [Origen], RutaInvertida),
	write('Ruta:\n'), reverse(RutaInvertida, Ruta), write(Ruta).



breadthFirstSearch([[Destino|Ruta]|_], Destino, [Destino|Ruta]).
breadthFirstSearch([PrimerRuta|OtrasRutas], Destino, Ruta) :-
	hijosNodo(PrimerRuta, NuevasRutas),
	concatenar(OtrasRutas, NuevasRutas, NuevaListaNodos),
	breadthFirstSearch(NuevaListaNodos, Destino, Ruta).


hijosNodo([Nodo|Ruta], Hijos) :-
	findall(
		[Hijo,Nodo|Ruta], 
		(
			conectadas(Nodo, Hijo),
			not(in(Hijo, [Nodo|Ruta]))
		),
		Hijos
	).
hijosNodo(_, []).


concatenar([], B, B).
concatenar([H|T], B, [H|C]) :- concatenar(T, B, C).


deepFirstSearch(Origen, Origen, Ruta, Ruta).
deepFirstSearch(Origen, Destino, RutaParcial, Ruta) :- 
	conectadas(Origen, Ciudad),
	not(in(Ciudad, RutaParcial)),
	deepFirstSearch(Ciudad, Destino, [Ciudad|RutaParcial], Ruta).


in(X, [X|_]).
in(X, [_|T]) :- in(X, T).