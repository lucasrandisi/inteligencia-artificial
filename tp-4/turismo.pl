:- dynamic(menores/2).
:- dynamic(costoSemanaPersona/2).
:- dynamic(mesRecomendado/2).
:- dynamic(tipoDestino/2).
:- dynamic(clima/2).
:- dynamic(vuelo/3).

inicio:- 
	cargarDatos,
	leerOpciones(Presupuesto, CantidadPersonas, CantidadDias, Menores, Mes, TipoDestino, Clima, TiempoViajeMaximo, CiudadOrigen),
	recomendarViaje(Presupuesto, CantidadPersonas, CantidadDias, Menores, Mes, TipoDestino, Clima, TiempoViajeMaximo, CiudadOrigen).


cargarDatos :- consult('/home/lucas/Facultad/Inteligencia Artificial/tp-4/ciudades.txt').


leerOpciones(Presupuesto, CantidadPersonas, CantidadDias, Menores, Mes, TipoDestino, Clima, TiempoViajeMaximo, CiudadOrigen) :- 
	writeln('Presupuesto:'),
	read(Presupuesto),
	writeln('Cantidad de Personas:'),
	read(CantidadPersonas),
	writeln('Cantidad de días'),
	read(CantidadDias),
	writeln('Viaja con menores (si, no):'),
	read(Menores),
	writeln('Mes en el que tiene pensado viajar: '),
	read(Mes),
	writeln('Tipo de Destino (ciudad o exteriores):'),
	read(TipoDestino), 
	writeln('Clima:'),
	read(Clima),
	writeln('Máximo tiempo de viaje:'),
	read(TiempoViajeMaximo),
	writeln('Ciudad de Origen:'),
	read(CiudadOrigen).


recomendarViaje(Presupuesto, CantidadPersonas, CantidadDias, Menores, Mes, TipoDestino, Clima, TiempoViajeMaximo, CiudadOrigen) :-
	menores(Destino, Menores),
	costoSemanaPersona(Destino, CostoDiaPersona),
	CostoTotal is CostoDiaPersona * CantidadPersonas * CantidadDias,
	Presupuesto >= CostoTotal,
	mesRecomendado(Destino, Mes),
	tipoDestino(Destino, TipoDestino),
	clima(Destino, Clima),
	breadthFirstSearch(CiudadOrigen, Destino, RutaFinal),
	tiempoViaje(RutaFinal, TiempoViaje),
	TiempoViajeMaximo >= TiempoViaje,
	writeln('Destino Recomendado: '),
	write(Destino).
recomendarViaje(_, _, _, _, _, _, _, _):- writeln('No se ha encontrado un destino para sus preferencias').



breadthFirstSearch([[Destino|Ruta]|_], Destino, RutaFinal) :- 
	reverse([Destino|Ruta], RutaFinal).
breadthFirstSearch([PrimerRuta|OtrasRutas], Destino, Ruta) :-
	hijosNodo(PrimerRuta, NuevasRutas),
	concatenar(OtrasRutas, NuevasRutas, NuevaListaNodos),
	breadthFirstSearch(NuevaListaNodos, Destino, Ruta).

% Verificar si 2 ciudades se encuentran conectadas
conectadas(A, B, Tiempo) :- vuelo(A, B, Tiempo).
conectadas(A, B, Tiempo) :- vuelo(B, A, Tiempo).


% Ciudades conectadas que se no se encuentren en la ruta actual
hijosNodo([Nodo|Ruta], Hijos) :-
	findall(
		[Hijo,Nodo|Ruta], 
		(
			conectadas(Nodo, Hijo, _),
			not(in(Hijo, [Nodo|Ruta]))
		),
		Hijos
	).
hijosNodo(_, []).


% Concatenar listas
concatenar([], B, B).
concatenar([H|T], B, [H|C]) :- concatenar(T, B, C).

% Verificar si un elemento se encuentra en la lista
in(X, [X|_]).
in(X, [_|T]) :- in(X, T).

% Calcular tiempo de viaje de una ruta
tiempoViaje([_], 0).
tiempoViaje([C1, C2|T], S) :- conectadas(C1, C2, T1), tiempoViaje([C2|T], T2), S is T1 + T2.