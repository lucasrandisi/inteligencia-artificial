:- dynamic(receta/3).
:- dynamic(ingreciente/2).

cargarDatos :- consult('/home/kodear/Facultad/inteligencia-artificial/practica-4/ejercicio-6/recetas.txt').

agregarReceta :- 
    write('\nCódigo: '), read(Codigo),
    write('\nNombre Receta: '), read(NombreReceta),
    agregarIngredientes(Codigo, NombreReceta).
    
agregarIngredientes(Codigo, NombreReceta) :- 
    write('\nNombre Ingrediente: '), read(NombreIngrediente), 
    NombreIngrediente \= [],
    write('\nCantidad: '), read(Cantidad),
    assert(receta(Codigo, NombreReceta, ingrediente(NombreIngrediente, Cantidad))),
    tell('/home/kodear/Facultad/inteligencia-artificial/practica-4/ejercicio-6/recetas.txt'), 	
	listing(receta),
	told,
    agregarIngredientes(Codigo, NombreReceta).
agregarIngredientes(_, _).


recetas2Ingredientes :- 
    cargarDatos,
    write('\nIngrediente 1: '), read(Ingrediente1),
    write('\nIngrediente 2: '), read(Ingrediente2),
    recetas2Ingredientes(Ingrediente1, Ingrediente2).
recetas2Ingredientes(Ingrediente1, Ingrediente2) :-
    receta(_, NombreReceta, ingrediente(Ingrediente1, _)),
    receta(_, NombreReceta, ingrediente(Ingrediente2, _)),
    write('\n'), write(NombreReceta),
    fail.
recetas2Ingredientes(_, _).


recetasMayorCantidad :- 
    cargarDatos,
    write('\nIngrediente: '), read(Ingrediente),
    write('\nCantidad: '), read(Cantidad),
    recetasMayorCantidad(Ingrediente, Cantidad).
recetasMayorCantidad(Ingrediente, Cantidad) :-
    receta(_, NombreReceta, ingrediente(Ingrediente, CantidadReceta)),
    CantidadReceta > Cantidad,
    write('\n'), write(NombreReceta),
    retract(receta(_, NombreReceta, ingrediente(Ingrediente, CantidadReceta))),
    recetasMayorCantidad(Ingrediente, Cantidad).
recetasMayorCantidad(_, _).