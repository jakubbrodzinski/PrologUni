%browse term as a tree
browse(X) :- readAndExecute([X],0),!.
		

readAndExecute([X|L],ERR):-
		(
			(ERR==0);
			(ERR==1,write("___No more children!\n"));
			(ERR==2,write("___No more parents!\n"));
			(ERR==3,write("___No more next siblings!\n"));
			(ERR==4,write("___No more previous siblings!\n"))
		),
		write(X),nl,
		write("command: "),
		get_char(COM),
		get_char(_),
		command([X|L],COM).

%in,out,next,previous
command(_,'x'):- !.
command([H|T],'i'):-
		H=..[_|ARGS], 
		(
			(ARGS=[ARG1|_],readAndExecute([ARG1,H|T],0));
			readAndExecute([H|T],1)
		).
		
command([H|T],'o') :- 
		length(T,Len),
		(
			(Len==0,readAndExecute([H|T],2));
			readAndExecute(T,0)
		).
command([H|T],'n') :-
		(
			T=[PARENT|_],
			PARENT=..[_|ARGS],
			append(_,[H,NEXT|_],ARGS),
			readAndExecute([NEXT|T],0)
		);
		readAndExecute([H|T],3).
command([H|T],'p') :-
		(
			T=[PARENT|_],
			PARENT=..[_|ARGS],
			append(_,[PREV,H|_],ARGS),
			readAndExecute([PREV|T],0)
		);
		readAndExecute([H|T],4).
