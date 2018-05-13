ex5a(N) :-
	thread_create(p(N, 'a'), ID1, []),
	thread_create(p(N, 'b'), ID2, []),
	thread_join(ID1, _),
	thread_join(ID2, _).

p(0, _).
p(N, CH) :-
	N > 0,
	N1 is N - 1,
	write(CH), write(CH), write(CH), write(' '),
	p(N1, CH).

ex5b(N) :-
	mutex_create(M),
	thread_create(p(N, 'a', M), ID1, []),
	thread_create(p(N, 'b', M), ID2, []),
	thread_join(ID1, _),
	thread_join(ID2, _).

p(0, _, _).
p(N, CH, M) :-
	N > 0,
	N1 is N - 1,
	mutex_lock(M),
	write(CH), write(CH), write(CH), write(' '),
	mutex_unlock(M),
	p(N1, CH, M).


ex5c(N) :-
	mutex_create(M),
	thread_create(p2(N, 'a', M), ID1,[]),
	thread_create(p2(N, 'b', M), ID2,[]),
	thread_join(ID1, _),
	thread_join(ID2, _).

p2(0, _, _).
p2(N, CH, M) :-
	N > 0,
	N1 is N - 1,
	with_mutex(M,
		   (
		       write(CH), write(CH), write(CH), write(' ')
		   )),
	p2(N1, CH, M).