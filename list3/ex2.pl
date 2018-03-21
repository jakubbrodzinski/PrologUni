%counts the max of sum from i-th element to j-th element where i<=j and empty sum equals 0

max_sum(L,MAX) :- max_sum(L,0,0,MAX).

max_sum([],_,A,MAX) :- MAX is A.
						
max_sum([H|R],LAST,A,MAX) :-NEW is H+LAST, 
						(NEW>A -> A2 is NEW; A2 is A),
						(NEW<0 -> 
							max_sum(R,0,A2,MAX);
							max_sum(R,NEW,A2,MAX)
						).
