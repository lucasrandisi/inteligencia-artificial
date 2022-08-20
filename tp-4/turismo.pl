%Tipo de viaje
tipoViaje(cancun, placer).
tipoViaje(kingston, placer).
tipoViaje(mykonos, placer).
tipoViaje(panama, placer).
tipoViaje(oxford, estudio).
tipoViaje(tokyo, estudio).
tipoViaje(berlin, estudio).
tipoViaje(roma, estudio).
tipoViaje(chicago, trabajo).
tipoViaje(moscu, trabajo).
tipoViaje(seul, trabajo).
tipoViaje(madrid, trabajo).


%Tipo de clima
clima(cancun, tropical).
clima(kingston, tropical).
clima(mykonos, calido).
clima(panama, tropical).
clima(oxford, frio).
clima(tokyo, frio).
clima(berlin, frio).
clima(roma, calido).
clima(chicago, frio).
clima(moscu, frio).
clima(seul, calido).
clima(madrid, calido).

%Presupuesto
presupuesto(cancun, 2500).
presupuesto(kingston, 1500).
presupuesto(mykonos, 4000).
presupuesto(panama, 2000).
presupuesto(oxford, 5000).
presupuesto(tokyo, 5500).
presupuesto(berlin, 4820).
presupuesto(roma, 4900).
presupuesto(chicago, 3500).
presupuesto(moscu, 7000).
presupuesto(seul, 5000).
presupuesto(madrid, 4000).


%Cantidad de personas recomendada
cantPersonasRecomendadas(cancun, 4).
cantPersonasRecomendadas(kingston, 3).
cantPersonasRecomendadas(mykonos, 2).
cantPersonasRecomendadas(panama, 6).
cantPersonasRecomendadas(oxford, 2).
cantPersonasRecomendadas(tokyo, 1).
cantPersonasRecomendadas(berlin, 4).
cantPersonasRecomendadas(roma, 6).
cantPersonasRecomendadas(chicago, 1).
cantPersonasRecomendadas(moscu, 1).
cantPersonasRecomendadas(seul, 2).
cantPersonasRecomendadas(madrid, 4).


inicio:- 
	leer_opciones(TipoViaje, Presupuesto, CantidadPersonas, Clima),
	recomendar_viaje(TipoViaje, Presupuesto, CantidadPersonas, Clima).


leer_opciones(TipoViaje, Presupuesto, CantidadPersonas, Clima) :- 
	writeln('Ingrese el tipo de viaje que desea (trabajo, placer, estudio): '),
	read(TipoViaje),
	writeln('Ingrese el presupuesto con el que cuenta: '),
	read(Presupuesto), 
	writeln('Ingrese la cantidad de personas que viajan: '),
	read(CantidadPersonas),
	writeln('Ingrese el clima que desea (frio, calido, tropical): '),
	read(Clima).


recomendar_viaje(TipoViaje, Presupuesto, CantidadPersonas, Clima):-
	tipoViaje(X, TipoViaje),
	presupuesto(X, PrecioPersona),
	Total is PrecioPersona * CantidadPersonas,
	Presupuesto >= Total,
	cantPersonasRecomendadas(X, CP),
	CP >= CantidadPersonas,
	clima(X, Clima),
	write('El destino recomendado es: '), 
	writeln(X).
recomendar_viaje(_, _, _, _):-
 writeln('No se ha encontrado viaje para sus preferencias').