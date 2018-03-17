zlodziej(jan).

lubi(maria,czekolada).
lubi(maria,wino).
lubi(jan,X) :- lubi(X,wino).

moze_ukrasc(X,Y) :- zlodziej(X), lubi(X,Y).
