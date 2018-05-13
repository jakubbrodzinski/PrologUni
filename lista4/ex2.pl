%https://en.wikipedia.org/wiki/Zebra_Puzzle
%[HOUSE,COLOR,NATIONALITY,CIGAR,DRINK,ANIMAL]
einstein_puzzle(X) :- 
			Hs=[[1,_,_,_,_,_],[2,_,_,_,_,_],
			[3,_,_,_,_,_],[4,_,_,_,_,_],
			[5,_,_,_,_,_]],
			member([1,_,norw,_,_,_],Hs),
			member([_,red,eng,_,_,_],Hs),
			member([W,white,_,_,_,_],Hs),
			W2 is W-1,member([W2,green,_,_,_,_],Hs),
			member([_,_,den,_,tea,_],Hs),
			member([C,_,_,_,_,cats],Hs),
			((L is C+1; L is C-1),member([L,_,_,light,_,_],Hs)),
			member([_,yellow,_,cigar,_,_],Hs),
			member([_,_,ger,pipe,_,_],Hs),
			member([3,_,_,_,milk,_],Hs),
			((L3 is L-1;L3 is L+1),member([L3,_,_,_,water,_],Hs)),
			member([_,_,_,nofilter,_,birds],Hs),
			member([_,_,swe,_,_,dogs],Hs),
			member([B,blue,_,_,_,_],Hs),
			((B2 is B-1; B2 is B+1),member([B2,_,norw,_,_,_],Hs)),
			member([Y,yellow,_,_,_,_],Hs),
			((Y2 is Y-1 ; Y2 is Y+1), member([Y2,_,_,_,_,horses],Hs)),
			member([_,_,_,mentol,beer,_],Hs),
			member([_,green,_,_,coffe,_],Hs), !,
			member([_,_,X,_,_,fish],Hs), !.

