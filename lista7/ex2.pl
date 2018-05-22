consult('ex1.pl').

split(IN,OUT1,OUT2) :-		% splits stream into two smaller streams that are the same (or +1) length
	freeze(IN,
		(IN=[H1|T], OUT1=[H1|OUT1R],
			splitR(T,OUT1R,OUT2));
		(OUT1=[],OUT2=[])
	).

splitR(IN,OUT1,OUT2) :-		% splits stream into two smaller streams that are the same (or +1) length
	freeze(IN,
		(IN=[H|T], OUT2=[H|OUT2R], 
			split(T,OUT1,OUT2R));
		(OUT1=[],OUT2=[])
	).


%merge sort O(nlog n)
merge_sort(IN,OUT) :-
	freeze(IN,
		(
			(IN=[H|T],freeze(T,
				(
					(T=[],OUT=[H]);
					(
						split(IN,O1,O2),
						merge_sort(O1,O1_SORTED),
						merge_sort(O2,O2_SORTED),
						merge(O1_SORTED,O2_SORTED,OUT)
					)
				)
			));
			OUT=[]
		)
	).
