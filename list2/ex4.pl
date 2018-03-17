has(p1,o1). %o1 : p1->p2->p2->p4->p5
has(p2,o2). %o2 : p2->p2->p2->p1->p1
has(p3,o3). %o3 : p3->p3->p1->p1->p1
has(p4,o4). %o4 : p4

give([1],p1,o1,p2).
give([1,1],p3,o3,p1).
give([1,1,1],p2,o1,p4).
give([1,1,1],p2,o2,p1).
give([1,1,1,1],p4,o1,p5).

/*
give([1],p1,o1,p2).
give([1,1],p3,o3,p1).
give([1,1,1],p2,o1,p4).
give([1,1,1],p2,o2,p1).
give([1,1,1,1],p4,o1,p5).
*/

%p1 : o1 -> NULL -> o3 -> o3,o2 -> same
%p2 : o2 -> o2,o1 -> o1,o2 -> NULL -> same
%p3 : o3 -> o3 -> NULL -> same 
%p4 : o4 -> o4 -> o4 -> o1,o4 -> o4 -> same


has([],P,O) :- has(P,O).

has(T,P,O) :- previousPeriod(_,T),
				has(_,O),
				has2(T,P,O).

has2([],P,O) :- has(P,O).
has2(T,P,O) :- (give(T,_,O,P);
				( previousPeriod(T,T2), \+ give(T,_,O,_), has2(T2,P,O))).

previousPeriod([],_) :- false.
previousPeriod(T,Tp) :- append(Tp,[1],T).
nextPeriod(T,Tn) :- append(T,[1],Tn).