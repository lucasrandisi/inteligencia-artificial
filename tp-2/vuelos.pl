vuelo( salta , cordoba ,80).
vuelo( cordoba , formosa ,120).
vuelo( cordoba , rosario ,55).
vuelo( cordoba , neuquen ,100).
vuelo( cordoba , mendoza ,65).
vuelo( formosa , corrientes ,50).
vuelo( corrientes , posadas ,70).
vuelo( corrientes ,  parana ,57).
vuelo( corrientes , santaFe ,93).
vuelo( posadas , parana ,85).
vuelo( santaFe , rosario ,30).
vuelo( rosario , parana ,25).
vuelo( rosario , buenosAires ,55).
vuelo( rosario , mendoza ,175).
vuelo( mendoza , buenosAires ,85).
vuelo( mendoza , neuquen ,83).
vuelo( neuquen ,  buenosAires ,90).
vuelo( buenosAires , calafate ,115).
vuelo( buenosAires ,  puertoMadryn ,75).
vuelo( neuquen , calafate ,65).


init :- 
	write('Ciudad de origen:\n'), read(Origen),
	write('Ciudad de destino:\n'), read(Destino),
	write('Mínimos trasbordos? (s/n):\n'), read(MinTrasbordos),
	rutas(Origen, Destino, MinTrasbordos).


rutas(Origen, Destino, MinTrasbordos) :- 
	MinTrasbordos = s, 
	breadhSearch(Origen, Destino, Ruta, Tiempo),
	write('Ruta:\n'), write(Ruta).
rutas(Origen, Destino, MinTrasbordos) :- 
	MinTrasbordos = n, 
	deepFirstSearch(Origen, Destino, [Origen], RutaInvertida),
	write('Ruta:\n'), reverse(RutaInvertida, Ruta), write(Ruta).



breadhSearch(Origen, Origen, [Origen], 0).


deepFirstSearch(Origen, Origen, Ruta, Ruta).
deepFirstSearch(Origen, Destino, RutaParcial, Ruta) :- 
	vuelo(Origen, Ciudad, _),
	not(in(Ciudad, RutaParcial)),
	deepFirstSearch(Ciudad, Destino, [Ciudad|RutaParcial], Ruta).



in(X, [X|_]).
in(X, [_|T]) :- in(X, T).