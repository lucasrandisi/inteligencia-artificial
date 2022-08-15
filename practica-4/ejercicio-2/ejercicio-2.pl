:- dynamic(persona/2).

init :- consult('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-2/personas.txt'),
	write('Ingrese el código: '), read(X), 
	mostrarPersona(X).


mostrarPersona(X) :- persona(X, N), write('Nombre: '), write(N).
mostrarPersona(X) :- write('\nPersona inexistente'),
	write('\nIngrese el nombre: '), read(N),
	assert(persona(X, N)),
	tell('/home/lucas/Facultad/Inteligencia Artificial/practica-4/ejercicio-2/personas.txt'),
	listing(persona),
	told,
	write('\nPersona agregada a la base de datos').

