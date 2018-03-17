%true if X is middle element of L.

remove_last([_],[]).
remove_last([X|T1],[X|T2]) :- remove_last(T1,T2).

remove_first(L1,L2) :- L1 =[_|L2].

middle_element([X],X).
middle_element(L,X) :- remove_first(L,L1), 
					remove_last(L1,L2), 
					middle_element(L2,X).

middle_element2([X],X).
middle_element2([_|R],X) :- append(L2,[_],R), middle_element2(L2,X).