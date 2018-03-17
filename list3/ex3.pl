%generates permutation that are created by odd/even inversions combined
%even_permutation([1,2,3,4,5],Y).

even_permutation(X,Y) :-
					permutation(X,_,Y,C), 0 is mod(C,2).

odd_permutation(X,Y) :-
					permutation(X,_,Y,C), 1 is mod(C,2).

permutation([X|[]],X,[X],0).
permutation(L,M,Y,C) :-
					member(X,L),
					select(X,L,L_n),
					permutation(L_n,M2,Y2,C2),
					(
						X<M2 -> 
							(M is X, C is C2);
							(M is M2, count_inversions(X,Y2,C3), C is C2+C3)
					),
					Y=[X|Y2].


count_inversions(_,[],0) :- !.
count_inversions(X,[H|R],C) :- 
							count_inversions(X,R,C2),
							(X>H -> C is C2+1 ; C is C2).

