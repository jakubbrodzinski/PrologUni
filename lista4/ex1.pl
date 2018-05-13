% puts {+,-,/,*} between integers to create expression
operations([H|T],L) :- 
					(
						L=[H,'+'|L2];
						L=[H,'-'|L2];
						L=[H,'*'|L2];
						L=[H,'/'|L2]
					),
					operations(T,L2).
operations([H|[]],[H]).

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
ex(LIST,VAL,EXPRESSION) :-
					generate(LIST,PAR),
					value(PAR,VAL,_),!,
					atomic_list_concat(PAR,T), term_to_atom(EXPRESSION,T).

generate(LIST,OUT) :-
		operations(LIST,OP),
		(
			(
				length(LIST,LEN),LEN<4,OUT=OP
			);
			(
				append([HL,HL2|TL],[HR,HR2|TR],OP), number(HL), \+number(HR),
				brackets([HL,HL2|TL],XL),
				brackets([HR2|TR],XR),
				XR2=[HR|XR],
				append(XL,XR2,OUT)
			)

		)
		.

% ex([1, 9, 2, 8, 3, 7, 4, 6, 5], 10, X)


brackets(L,OUT) :- length(L,Len), Len<5,
			(
				(Len==3, closingBracket(L,L2),OUT=['('|L2]);
				OUT=L
			).
brackets(L,OUT):-
	append([HL,HL2|TL],[HR,HR2|TR],L), number(HL), \+number(HR),
	brackets([HL,HL2|TL],XL),
	brackets([HR2|TR],XR),
	XR2=[HR|XR],
	append(XL,XR2,OUT).

brackets(L,['('|OUT]):-
	append([HL,HL2|TL],[HR,HR2|TR],L), number(HL), \+number(HR),
	brackets([HL,HL2|TL],XL),
	brackets([HR2|TR],XR),
	closingBracket(XR,XR2),
	O1=[HR|XR2],
	append(XL,O1,OUT).


closingBracket([H|[]],[H|[')']]):- !.
closingBracket([H|T],[H|O]) :- closingBracket(T,O).
