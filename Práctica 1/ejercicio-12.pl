suma(1, Sum) :- Sum is 1.
suma(N, Sum) :- A is N-1, suma(A, B), Sum is N + B.
