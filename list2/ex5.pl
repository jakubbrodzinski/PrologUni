list(N, X) :- orderedList(Y,N), list_E([1],[],1,X,2,Y).
% 0/1, nieparz miejsca, parz miejsca,roznica, nowa lista,
%max. element, elementy do wykorzystania

list_NE(_,_,A,[A|[]],_,[]).%L=OLD.

list_NE(NE,E,A,[A|L2],MAX,NEXT) :- 
							member(X,NEXT),(
							(
								X<MAX,
								member(X,E),
								select(X,NEXT,NEXT_n),
								list_E(NE,E,X,L2,MAX,NEXT_n)
							);
							(
								X=:=MAX,
								MAX_n is MAX+1,
								list_E([X|NE],E,X,L2,MAX_n,NEXT)
							)).

list_E(NE,E,A,[A|L2],MAX,NEXT) :- 
							member(X,NEXT),(
							(
								X<MAX,
								member(X,NE),
								select(X,NEXT,NEXT_n),
								list_NE(NE,E,X,L2,MAX,NEXT_n)
							);
							(
								X=:=MAX,
								MAX_n is MAX+1,
								list_NE(NE,[X|E],X,L2,MAX_n,NEXT)
							)).


reverseList([H|[]],L,[H|L]) :- !.

reverseList([H|T],L,X) :- reverseList(T,[H|L],X).

orderedList(L,N) :- orderedList(L,1,N).

orderedList([N],N,N) :- !.

orderedList([H|T],C,N) :-
						C < N,
						H is C,
						C1 is C+1,
						orderedList(T,C1,N).

/*
arrayLEQ(L,N) :- arrayLEQ([],L,1,N).
arrayLEQ(L1,L2,N,N) :- append(L1,[N],L2).
arrayLEQ(L1,L2,F,N) :- F<N, Fnext is F+1, append(L1,[F],L1n), arrayLEQ(L1n,L2,Fnext,N).
*/
