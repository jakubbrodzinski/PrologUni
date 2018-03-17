%Checks if 'le' is Partial Order.

le(1,1).
le(1,2).
le(1,3).
le(1,4).
le(1,5).
le(1,6).
le(2,2).
le(2,3).
le(2,4).
le(2,5).
le(2,6).
le(3,3).
le(3,4).
le(3,5).
le(3,6).
le(4,4).
le(4,5).
le(4,6).
le(5,5).
le(5,6).
le(6,6).

partial_order :-
				transitivity, reflexivity, antisymmetry.

transitivity :-
				\+ (le(X,Y), le(Y,Z), \+ le(X,Z)).
reflexivity :-
				\+ ((le(X,_); le(_,X)), \+ le(X,X)).
antisymmetry :-
				\+ (le(X,Y),
						le(Y,X), 
						X \= Y).