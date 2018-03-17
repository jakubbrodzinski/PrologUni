
variance(L,D) :-
				variance(L,0,_,0,N,D2),
				D is D2/N.
variance([],A_A,A,N,N,D) :- A is A_A/N, D is 0.
%A_A acumulator for counting average of numbers
%N_A acumulator for countring length of list L ([H|R]).
variance([H|R],A_A,A,N_A,N,D) :- A_A1 is A_A+H,
								N_A1 is N_A+1,
								variance(R,A_A1,A,N_A1,N,D2),
								D_temp is H-A,
								D_temp2 is D_temp*D_temp,
								D is D_temp2+D2.



cyk([H|R],L2) :- append(L2,[_],R).