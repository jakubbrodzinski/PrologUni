left_of(pencil,hourglass).
left_of(hourglass,butterfly).
left_of(butterfly,fish).


above(bicycle,pencil).
above(bicycle2,bicycle).
above(bicycle3,bicycle2).
above(camera,butterfly).
above(camera2,camera).

below(X,Y) :- 
		above(Y,X).

right_of(X,Y) :-
		left_of(Y,X).

left_of_recur(X,Y) :-
		left_of(X,Y); (left_of(X,Z), left_of_recur(Z,Y)).
		
above_recur(X,Y) :-
		above(X,Y); (above(X,Z), above_recur(Z,Y)).

/*higher(X,Y) :-
		above_recur(X,Y);
		(left_of_recur(Z,Y),above_recur(X,Z));
		(left_of_recur(Y,Z), above_recur(X,Z)).
		*/

higher(X,Y) :-
		above_recur(X,Y);
		(left_of_recur(Z,Y),above_recur(X,Z));
		(left_of_recur(Y,Z), above_recur(X,Z));
		(above(X,L),above(Y,R),higher1(L,R)).

