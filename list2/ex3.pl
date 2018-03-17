%directed graph, achievable(X,Y) is true if there is a path from X to Y. arc(A,B) is true, when there is directed edge from A to B

arc(1,2).
arc(2,3).
arc(3,4).
arc(4,2).
arc(4,5).

arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

achievable(X,Y) :- with_history(X,Y,[X]).
with_history(X,X,[_]).
with_history(X,Y,L) :- arc(X,Z),
							\+ member(Z,L),
							append([Z],L,L2),
							with_history(Z,Y,L2).
