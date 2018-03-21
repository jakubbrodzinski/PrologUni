%Check if X is prime number

checkPrime(X) :-
			X=2 ; (X>2, Y is X-1, \+ (between(2,Y,Z), (X mod Z) =:= 0)).
prime(LO,HI,N) :- 
				between(LO,HI,N),
				checkPrime(N).
