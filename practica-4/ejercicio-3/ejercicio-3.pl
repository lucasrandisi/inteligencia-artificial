:- dynamic(habito/2).

agregarHabito :- write('\nIngrese el nombre: '), read(X), 
	write('\nIngrese el habito: '), read(R),
	assert(habito(X, R)),
	tell('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-3/zoo.txt'),
	listing(habito),
	told,
	write('\nHabito agregado a la base de datos').


habitosAnimal :- write('\nIngrese el nombre: '), read(X), 
	consult('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-3/zoo.txt'),
	listarHabitos(X).

listarHabitos(X) :- habito(X, R), write('\n'), write(R), fail.
listarHabitos(_).

animalesPorHabito :- write('\nIngrese el habito: '), read(R),
	consult('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-3/zoo.txt'),
	listarAnimales(R).

listarAnimales(R) :- habito(X, R), write('\n'), write(X), fail.
listarAnimales(_).