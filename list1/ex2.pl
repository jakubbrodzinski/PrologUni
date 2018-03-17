%'on(a,b)' tells you that a is right above b.

on(b5,b4).
on(b4,b3).
on(b3,b2).
on(b2,b1).

on(b8,b7).
on(b7,b6).
on(b10,b9).

above(X,Y) :- % x is placed higher than Y
		on(X,Y); % X is placed on Y or
		(on(X,Z), %x is placed on Z
		above(Z,Y)). % and Z is placed higher than Y