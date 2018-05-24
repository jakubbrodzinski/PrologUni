%get from html FILE every server that we can go to via <a>'s.
:- use_module(library(sgml)).
:- use_module(library(xpath)).

servers(FILE,SERVERS) :-
	load_html(FILE,DOM,[]),
	setof(HOST, getHost(DOM,HOST) ,SERVERS).


getHost(DOM,H) :-
	xpath(DOM,//a(@href), HREF),
	(
		(is_absolute_url(HREF),parse_url(HREF,X));
		parse_url(HREF,'https://localhost/',X)
	),
	X=[protocol(_),host(H),path(_)].