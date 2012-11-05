length([], 0).
length([_ | Rest], Len + 1) :-
   length(Rest, Len).

permutation([], []).

permutation([Head | Tail], Res) :-
	permutation(Tail, Res1),
	del(Res, Head, Res1).

evenlength([]).

evenlength([_, _ | Tail]) :-
	evenlength(Tail).

oddlength([_|[]]).

oddlength([_, _ | Tail]) :-
	oddlength(Tail).

rev([X], [X]).

rev([X| T1], Ans) :-
	rev(T1, Ans1),
	append(Ans1, [X], Ans).

add(X, L, [X|L]).

palindrome(List) :-
	rev(List, List).

shift([], []).
shift([X], [X]).

shift([X | L1], Ans) :-
	append(L1, [X], Ans).

append1([], L, L).

append1([X|A], B, [X|Res]) :-
	append(A, B, Res).

means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).
means(10, ten).

translate([], []).

translate([X|N], [Y|W]) :-
	means(X, Y),
	translate(N, W).

contains([Element|_], Element).

contains([_|Set], Element) :-
	contains(Set, Element).

del([Head|Tail], Head, Tail).

del([_|Set], X, Res) :-
	del(Set, X, Res).

subset(_, []).

subset(Set, [Head|Subset]) :-
	contains(Set, Head),
	del(Set, Head, Res),
	subset(Res, Subset).

dividelist([X], [X], []).

dividelist([], [], []).

dividelist([X,Y|L], [X|L1], [Y|L2]) :-
	dividelist(L, L1, L2).

array([_|_]).

unwrap(X, [X]) :-
	not(array(X)).

unwrap([X], Res) :-
	unwrap(X, Res).


flatten([Head|[]], Res) :-
	unwrap(Head, Res).

flatten([Head|Tail], Flatlist) :-
	unwrap(Head, Head1),
	flatten(Tail, Rest),
	append(Head1, Rest, Flatlist).





















