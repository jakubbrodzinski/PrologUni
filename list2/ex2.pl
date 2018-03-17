%terms are true when element X appeared only once or twice in array.

once(X,L) :-
			append(L1,[X|L2],L),
			\+ member(X,L1),
			\+ member(X,L2).

twice(X,L) :- append(L1,[X|L2],L),
			(\+member(X,L1), once(X,L2)).
			