member([X|_], X).

member([_|Tail], X) :-
	member(Tail, X), !.

ijth_member(X, I, J, Member) :-
	nth_member(X, I, Row),
	nth_member(Row, J, Member), !.

nth_member([X|_], 0, X).

nth_member([_|Tail], N, Member) :-
	N1 is N - 1,
	nth_member(Tail, N1, Member), !.


























