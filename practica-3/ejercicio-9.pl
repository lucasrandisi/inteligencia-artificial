consonant('b').
consonant('c').
consonant('d').
consonant('f').
consonant('g').
consonant('h').
consonant('j').
consonant('k').
consonant('l').
consonant('m').
consonant('n').
consonant('ñ').
consonant('p').
consonant('q').
consonant('r').
consonant('s').
consonant('t').
consonant('v').
consonant('w').
consonant('x').
consonant('y').
consonant('z').


init :- write('Ingrese un string:\n'), read(X), count(X, CA, CE, CI, CO, CU, CC),
    write('a: '), write(CA),
    write('\ne: '), write(CE),
    write('\ni: '), write(CI),
    write('\no: '), write(CO),
    write('\nu: '), write(CU),
    write('\nconsonants: '), write(CC).


count('', 0, 0, 0, 0, 0, 0).
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 0, 1, _, H), H = 'a', sub_atom(X, 1, _, 0, T), count(T, CA2, CE, CI, CO, CU, CC), CA is CA2 + 1.
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 0, 1, _, H), H = 'e', sub_atom(X, 1, _, 0, T), count(T, CA, CE2, CI, CO, CU, CC), CE is CE2 + 1.
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 0, 1, _, H), H = 'i', sub_atom(X, 1, _, 0, T), count(T, CA, CE, CI2, CO, CU, CC), CI is CI2 + 1.
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 0, 1, _, H), H = 'o', sub_atom(X, 1, _, 0, T), count(T, CA, CE, CI, CO2, CU, CC), CO is CO2 + 1.
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 0, 1, _, H), H = 'u', sub_atom(X, 1, _, 0, T), count(T, CA, CE, CI, CO, CU2, CC), CU is CU2 + 1.
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 0, 1, _, H), consonant(H), sub_atom(X, 1, _, 0, T), count(T, CA, CE, CI, CO, CU, CC2), CC is CC2 + 1.
count(X, CA, CE, CI, CO, CU, CC) :- sub_atom(X, 1, _, 0, T), count(T, CA, CE, CI, CO, CU, CC).
