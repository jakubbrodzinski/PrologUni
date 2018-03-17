man(m1).
man(m2).
man(m3).
man(m4).

woman(w1).
woman(w2).
woman(w3).
woman(w4).

parent(m1,m2).
parent(w1,m2).

parent(m2,m3).
parent(m2,m4).
parent(m2,w3).
parent(m2,w4).

parent(w2,m3).
parent(w2,m4).
parent(w2,w3).
parent(w2,w4).

is_mother(X) :- 
		woman(X),
		parent(X,_).

is_father(X) :- 
		man(X),
		parent(X,_).

is_son(X) :-
		man(X),
		parent(_,X).

sister(X,Y) :-
		woman(X),
		parent(Z,X),
		parent(Z,Y),
		X \= Y.

grandfather(X,Y) :-
		man(X),
		parent(X,Z),
		parent(Z,Y).

siblings(X,Y) :-
		parent(Z,X),
		parent(Z,Y),
		X \= Y.