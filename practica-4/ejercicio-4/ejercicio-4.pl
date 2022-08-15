:- dynamic(gasto/2).

listarGastos :- consult('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-4/gastos.txt'), 
	write('\nIngrese la persona: '), read(X), 
	listarGastos(X).
listarGastos(X) :- gasto(X, Y), write('\n'), write(Y), fail.
listarGastos(_).

agregarGasto :- write('\nIngrese la persona: '), read(X),
	write('\nIngrese el servicio: '), read(Y),
	assert(gasto(X, Y)),
	tell('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-4/gastos.txt'),
	listing(gasto),
	told.
