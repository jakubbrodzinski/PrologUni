printBlank(_,[]) :- !, write("|\n").
printBlank(C,[H|T]) :-
		(C==H -> write("| ### "); write("|     ")),
		printFilled(C,T).

printFilled(_,[]) :- !, write("|\n").
printFilled(C,[H|T]) :-
		(C==H -> write("|:###:"); write("|:::::")),
		printBlank(C,T).


across([]) :- !, write("+\n").
across([_|T]):-
		write("+-----"),
		across(T).

rowBlank(0,L):- !,
		across(L).
rowBlank(C,L):-
		across(L),
		printBlank(C,L),
		printBlank(C,L),
		C2 is C-1,
		rowFilled(C2,L).
rowFilled(0,L):- !,
		across(L).
rowFilled(C,L) :- 
		across(L),
		printFilled(C,L),
		printFilled(C,L),
		C2 is C-1,
		rowBlank(C2,L).

%printing solution to https://en.wikipedia.org/wiki/Eight_queens_puzzle
board(X) :- %X=[1,3,5,8,10,12,6,11,2,7,9,4],
		length(X,Len),
		(
			(0 is mod(Len,2),rowBlank(Len,X),!);
			(1 is mod(Len,2),rowFilled(Len,X))
		).
