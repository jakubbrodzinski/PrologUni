%printing solution
printMatches(SET):-
		write('Solution:\n'),
		across(0,SET), down(0,SET),
		across(7,SET), down(7,SET),
		across(14,SET), down(14,SET),
		across(21,SET).

across(SHFT,SET) :- 
		print('+'),
		A is 1+SHFT,
		(member(A,SET)->write('---+');write('   +')),
		B is 2+SHFT,
		(member(B,SET)->write('---+');write('   +')),
		C is 3+SHFT,
		(member(C,SET)->write('---+');write('   +')),
		nl.
down(SHFT,SET) :-
		A is 4+SHFT,
		(member(A,SET) -> write('|   ');write('    ')),
		B is 5+SHFT,
		(member(B,SET) -> write('|   ');write('    ')),
		C is 6+SHFT,
		(member(C,SET) -> write('|   ');write('    ')),
		D is 7+SHFT,
		(member(D,SET) -> write('|');write(' ')),
		nl.
%adds SHFT to every elemnt of L1 and returns L2
shift(_,[],[]):- !.
%shift(0,L,L):- !.
shift(SHFT,[H1|T1],[H2|T2]) :-
		H2 is H1+SHFT,
		shift(SHFT,T1,T2).
%medium(SHIFT,L) :- \+ (member(M,[1,2,4,6,11,13,15,16]), M2 is M+SHIFT, \+ member(M2,L)).

%shifting sets and then getting sums of them
sumShifts([H1|[]],IN,SUM,L) :- !, shift(H1,L,SET), union(IN,SET,SUM).
sumShifts([H1|T1],IN,SUM,L) :-
		shift(H1,L,S),
		union(IN,S,Temp),
		sumShifts(T1,Temp,SUM,L).

genShifts(1,[H],L) :- !, member(H,L).
genShifts(N,[H1,H2|T],L) :- 
		N2 is N-1,
		genShifts(N2,[H2|T],L),
		member(H1,L),
		H1>H2.

small(0,[]) :- !.
small(N,SUM) :- 
		N=<9, 
		genShifts(N,SHFTS,[0,1,2,7,8,9,14,15,16]),
		sumShifts(SHFTS,[],SUM,[1,4,5,8]).
medium(0,[]) :- !.
medium(N,SUM) :- 
		N=<4,
		genShifts(N,SHFTS,[0,1,7,8]),
		sumShifts(SHFTS,[],SUM,[1,2,4,6,11,13,15,16]).
large(0,[]) :- !.		
large(N,L) :- 
		N == 1, L=[1,2,3,4,7,11,14,18,21,22,23,24].
%3x3 borad, 24 matches, remove N matches and get set (X) of large,medium and small sqrtes
matches(N,X):-
		X = (large(L), medium(M),small(S)),
		small(S,S_SUM),
		medium(M,M_SUM),
		large(L,L_SUM),
		union(S_SUM,M_SUM,U1),
		union(L_SUM,U1,U2),
		length(U2,Len),
		N is 24-Len,
		printMatches(U2).

