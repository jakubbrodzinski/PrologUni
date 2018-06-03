:- consult("form.pl").

form(_Request) :-
	format('Content-type: text/html~n~n'),
	format('<!DOCTYPE html><html><head><title>Form</title>~n', []),
	format('<meta http-equiv="content-type" content="text/html; charset=UTF-8">~n', []),
	format('</head><body>~n', []),
	format('<h1>Gimme size of the problem~n', []),
	build_form([action(action), method(post)],
		[label(name,'Size:'),input(text,name),br,
		input(submit)]
	),
	format('</body></html>~n',[]).