%merging two lits that are in in increasing order.
merge(IN1,IN2,OUT) :-
		freeze(IN1,
			freeze(IN2,
				(
					(IN1=[H1|T1], IN2=[H2|T2],
						(
							H1 > H2
							->(OUT=[H2|REST], merge(IN1,T2,REST));
							(OUT=[H1|REST], merge(T1,IN2,REST))
						)
					);
					(IN1=[H1|T1], OUT=[H1|REST],merge(T1,[],REST));
					(IN2=[H2|T2], OUT=[H2|REST],merge(T2,[],REST));
					OUT=[]
				)
			)
		),!.