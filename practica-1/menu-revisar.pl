menu() :-
    writeln('Ingrese una opcion'),
    writeln('1 - Opcion 1'),
    writeln('2 - Opcion 2'),
    writeln('3 - Salir'),
    read(X),
       X = 1, opc1();
       X = 2, opc2();
       X = 3;
       menu().


opc1() :- writeln('Opcion 1').
opc2() :- writeln('Opcion 2').
