%counts the max of sum from i-th element to j-th element where i<=j and empty sum equals 0

max_sum(L,MAX) :- max_sum(L,_,MAX).

max_sum([],0,0).
max_sum([H|R],LAST,C) :- 
						max_sum(R,LAST2,C2),
						NEW is H+LAST2,
						(NEW<0 -> LAST is 0; LAST is NEW),
						(NEW>C2 -> C is NEW; NEW=<C2, C is C2).
