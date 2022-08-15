:- dynamic(libro/5).

cargarDatos :- consult('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-5/libros.txt').

consulta :- write('\nIngrese el numero: '), read(Nro), consulta(Nro).
consulta(Nro) :- 
	cargarDatos,
	libro(Nro, Titulo, Autor, Editorial, Precio),
	write('\nTitulo: '), write(Titulo),
	write('\nAutor: '), write(Autor),
	write('\nEditorial: '), write(Editorial),
	write('\nPrecio: '), write(Precio).

agregar :- 	
	write('\nCodigo: '), read(Codigo),
	write('\nTitulo: '), read(Titulo),
	write('\nAutor: '), read(Autor),
	write('\nEditorial: '), read(Editorial),
	write('\nPrecio: '), read(Precio),
	assert(libro(Codigo, Titulo, Autor, Editorial, Precio)),
	guardar.

borrar :- write('\nIngrese el numero: '), read(Nro), borrar(Nro).
borrar(Nro) :- 
	retract(libro(Nro, _, _, _, _)), 
	guardar.

guardar :-
	tell('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-5/libros.txt'), 	
	listing(libro),
	told.

promedioAutor :- write('\nIngrese el autor: '), read(Autor), 
	cargarDatos,
	libro(Codigo, _, Autor, _, Precio),
	retract(libro(Codigo, _, _, _, _)),
	promedioAutor(Autor, Precio, 1, PrecioPromedio),
	write('\nPrecio promedio: '), write(PrecioPromedio).
promedioAutor(Autor, PrecioAcumulado, Cantidad, PrecioPromedio) :-
	libro(Codigo, _, Autor, _, Precio),
	retract(libro(Codigo, _, _, _, _)),
	NuevoPrecio is PrecioAcumulado + Precio,
	NuevaCantidad is Cantidad + 1,
	promedioAutor(Autor, NuevoPrecio, NuevaCantidad, PrecioPromedio).
promedioAutor(_, PrecioAcumulado, Cantidad, PrecioPromedio) :- 
	PrecioPromedio is PrecioAcumulado / Cantidad.
	