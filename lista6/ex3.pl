%a^n b^n
s1 --> [].
s1 --> [a], s1, [b].

%a^n b^n c^n
s2 --> x(N,a), x(N,b), x(N,c).

%a^n b^fib(N)
s3 --> x(N,a), { fib(N,NFIB) }, x(NFIB,b).

x(0,_) --> [].
x(N,Z) --> [Z], x(N1,Z), { N is N1+1 }.

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, F) :-
        fib(0,1,1,N,F).

fib(_, F, N, N, F) :- !.
fib(F0, F1, I, N, F) :-
        F2 is F0+F1,
        I2 is I + 1,
        fib(F1, F2, I2, N, F).
