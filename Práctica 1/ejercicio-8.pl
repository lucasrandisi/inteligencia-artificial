horoscopo(aries, 21, enero, 19, febrero).
horoscopo(piscis, 20, febrero, 20, marzo).
horoscopo(aries, 21, marzo, 20, abril).
horoscopo(tauro, 21, abril, 20, mayo).
horoscopo(geminis, 21, mayo, 20, junio).
horoscopo(cancer, 21, junio, 20, julio).
horoscopo(leo, 21, julio, 21, agosto).
horoscopo(virgo, 22, agosto, 20, septiembre).
horoscopo(libra, 21, septiembre, 20, octubre).
horoscopo(escopio, 21, octubre, 21, noviembre).
horoscopo(sagitario, 22, noviembre, 21, diciembre).
horoscopo(capricornio, 22, diciembre, 20, enero).


signo(Dia, Mes, Signo) :-
   horoscopo(Signo, Dia_Inicio, Mes_Inicio, Dia_Fin, Mes_Fin),
   (
       Mes == Mes_Inicio, Dia_Inicio =< Dia;
       Mes == Mes_Fin, Dia_Fin >= Dia
   ).
