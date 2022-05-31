hombre(geronimo).
hombre(raul).
hombre(luis).
hombre(hugo).
hombre(gustavo).
hombre(ricardo).
hombre(lucas).

mujer(marta).
mujer(josefina).
mujer(silvina).
mujer(carolina).
mujer(abril).
mujer(morena).

padres(gustavo, marta, geronimo).
padres(luis, marta, geronimo).
padres(hugo, marta, geronimo).
padres(carolina, marta, geronimo).
padres(silvina, josefina, raul).
padres(ricardo, josefina, raul).
padres(lucas, silvina, gustavo).
padres(abril, silvina, gustavo).
padres(morena, silvina, gustavo).


hermana(A, B) :- A \= B, mujer(A), padres(A, M, P), padres(B, M, P).


nieto(A, B) :-
    hombre(A),
    padres(A, M, P),
    (padres(M, B, _); padres(M, _, B); padres(P, B, _); padres(P, _, B)).

abuelo(A, B) :-
    hombre(A),
    (
        padres(M, _, A), padres(B, M, _);
        padres(P, _, A), padres(B, _, P)
    ).


tia_1(A, B) :-
    mujer(A),
    (
        padres(A, GM, GF), padres(M, GM, GF), padres(B, M, _);
        padres(A, GM, GF), padres(F, GM, GF), padres(B, _, F)
    ).

tia_2(A, B) :-
    mujer(A),
    (
        hermana(A, M), padres(B, M, _);
        hermana(A, F), padres(B, _, F)
    ).
