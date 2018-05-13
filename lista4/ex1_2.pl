% puts {+,-,/,*} between integers to create expression
operations([H|T],L) :- 
					operations(T,L2),
					(
						L=[H,'+'|L2];
						L=[H,'-'|L2];
						L=[H,'*'|L2];
						L=[H,'/'|L2]
					).
operations([H|[]],[H]).

parentheses([H1,H2|T],[H1,H2|L2],C) :-
					parentheses(T,L2,C).
parentheses([H1,H2|T],['(',H1,H2|L2],C) :-
					C2 is C+1,
					parentheses(T,L2,C2).
parentheses([H1,H2|T],[H1,')',H2|L2],C) :-
					C>0,
					C2 is C-1,
					parentheses(T,L2,C2).
parentheses([H|[]],[H|L2],C) :- 
					parentheses([],L2,C).
parentheses([],[],0) :- !.
parentheses([],[')'|L2],C) :- 
%					C>0,
					C2 is C-1,
					parentheses([],L2,C2).
%parentheses([],[],0).

den_ok(['/','('|T],['/',V|N]) :- !,
				value(['('|T],V,T2),
				den_ok(T2,N).
den_ok(['/',H2|T],['/',H2|N]) :-
				H2=\=0,
				den_ok(T,N).
den_ok([H|T],[H|N]) :-
				den_ok(T,N).
den_ok([],[]):- !.

%counts value of expressions L that every L's element is 
%an integer or an element of {+,-,/,*,(,)}.
value([L,M,'('|T],X,B):- !,
					value(T,X2,B2),
					value([L,M,X2|B2],X,B).
value(['('|T],X,B) :- !,
					value(T,X2,B2),
					value([X2|B2],X,B).
value([L,'/',R|T],X,B) :- !,
					R =\= 0,
					D is L/R,
					value([D|T],X,B).
value([L,'*',R|T],X,B) :- !,
					M is L*R,
					value([M|T],X,B).
value([L,'-',R|T],X,B) :- !,
					R2 is (-1)*R,
					value([R2|T],X2,B),
					X is L+X2.
value([L,'+'|T],X,B) :- !,
					value(T,X2,B),
					X is L+X2.
value([H|[]],H,[]) :- !.
value([H,')'|T],H,T) :- !.

%generates and then check if val(expression)=VALUE
% ex2([1, 9, 2, 8, 3, 7, 4, 6, 5], 10, X)
ex2(LIST,VALUE,EXPRESSION) :-
					operations(LIST,OP),
					parentheses(OP,PAR,0),
					value(PAR,VALUE,_), !,
					atomic_list_concat(PAR,EXPRESSION).