factorial(1, Fact) :- Fact is 1.
factorial(N, Fact) :- R is N-1, factorial(R, P), Fact is N * P.
