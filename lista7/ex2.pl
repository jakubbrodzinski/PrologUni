consult('ex1.pl').

split(IN,OUT1,OUT2) :-		% splits stream into two smaller streams that are the same (or +1) length
	freeze(IN,
		(IN=[H1,H2|T], OUT1=[H1|OUT1R], OUT2=[H2|OUT2R], 
			split(T,OUT1R,OUT2R));
		(IN=[H1|[]],OUT1=[H1], OUT2=[]);
		(OUT1=[],OUT2=[])
	),!.

%merge sort O(nlog n)
merge_sort(IN,OUT) :-
	freeze(IN,
		(IN=[],OUT=[]);
		(IN=[X],OUT=[X]);
		(split(IN,O1,O2),
		merge_sort(O1,O1_SORTED),
		merge_sort(O2,O2_SORTED),
		merge(O1_SORTED,O2_SORTED,OUT))
	),!.
