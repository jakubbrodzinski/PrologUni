:- ['lex.pl','ex1.pl','interpreter.pl'].

% opens file, reads key words from it (with lexer) and then using parser checks if its 
% gramaticly correct program. after that program is executed
ex(N) :- 
		open(N,read,X), scanner(X,Y), close(X), phrase(program(PROGRAM),Y), interpreter(PROGRAM).
