spaces(0) :-!.
spaces(NUM) :-
		write(' '),
		NEW is NUM-1,
		spaces(NEW).

my_format(TEXT,[ID]) :-
		with_mutex(print,
			(spaces(ID),format(TEXT,[ID]))
		).

life(ID,ML,MR) :- think(ID,ML,MR).

think(ID,ML,MR) :- 
		my_format('[~w] thinks~n',[ID]),
		sleep(2),
		forks(ID,ML,MR).
eat(ID) :- 
		my_format('[~w] eats~n',[ID]),
		sleep(3).
		
forks(ID,ML,MR):- 
		my_format('[~w] wants right fork~n',[ID]),
		mutex_lock(MR),
			my_format('[~w] picks up right fork~n',[ID]),
			my_format('[~w] wants left fork~n',[ID]),
			mutex_lock(ML),
				my_format('[~w] picks up left fork~n',[ID]),
				eat(ID),
			mutex_unlock(MR),
			my_format('[~w] put down right fork~n',[ID]),
		mutex_unlock(ML),
		my_format('[~w] put down left fork~n',[ID]),
		think(ID,ML,MR).

phils :-
	mutex_create(M5),
	mutex_create(M1),thread_create(life(1,M1,M5),ID1,[]),
	mutex_create(M2),thread_create(life(2,M2,M1),ID2,[]),
	mutex_create(M3),thread_create(life(3,M3,M2),ID3,[]),
	mutex_create(M4),thread_create(life(4,M4,M3),ID4,[]),
	thread_create(life(5,M5,M4),ID5,[]),
	thread_join(ID1,_),
	thread_join(ID2,_),
	thread_join(ID3,_),
	thread_join(ID4,_),
	thread_join(ID5,_).