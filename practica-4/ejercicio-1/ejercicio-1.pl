:- dynamic(gasto/3).

listarGastos :- consult('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-1/gastos.txt'), 
	write('\nIngrese la persona: '), read(X), 
	listarGastos(X).
listarGastos(X) :- gasto(X, Y, Z), write('\n'), write(Y), write(': '), write(Z), fail.
listarGastos(_).

agregarGasto :- write('\nIngrese la persona: '), read(X),
	write('\nIngrese el servicio: '), read(Y),
	write('\nIngrese el monto: '), read(Z),
	assert(gasto(X, Y, Z)),
	tell('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-1/gastos.txt'),
	listing(gasto),
	told.
