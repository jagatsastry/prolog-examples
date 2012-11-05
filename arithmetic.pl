[operations_on_lists].
/**
Define the relation max(X, Y, Max) so that Max is the greater of two
numbers X and Y
*/
max(X, Y, Max) :-
	X > Y,
	Max is X, !.

max(X, Y, Max) :-
	X < Y,
	Max is Y.

/**
	Define the predicate
	maxlist(List, Max)
	so that Max is the greatest number in the list of numbers list
*/

maxlist([Head|[]], Max) :-
	Max is Head, !.

maxlist([Head|List], Max) :-
	maxlist(List, Max1),
	Max1 > Head,
	Max is Max1, !.

maxlist([Head|List], Max) :-
	maxlist(List, Max1),
	Max1 < Head,
	Max is Head, !.

/**
	Define the predicate
	sumlist(List, Sum)
	so that Sum is the sum of a given list of numbers List.
*/

sumlist([], 0).

sumlist([Head|Tail], Sum) :-
	sumlist(Tail, Sum1),
	Sum is Sum1 + Head. %Note: Do not say Sum is Sum + Head

/**
	Define the predicate ordered(List)
	which is true if List is an ordered list of numbers. For example,
	ordered([1, 5, 6, 6, 9, 12]).
*/


minlist([Head|[]], Min) :-
	Min is Head, !.

minlist([Head|List], Min) :-
	minlist(List, Min1),
	Min1 < Head,
	Min is Min1, !.

minlist([Head|List], Min) :-
	maxlist(List, Min1),
	Min1 > Head,
	Min is Head, !.

ordered([]).
ordered([_]).

ordered([Head | Tail]) :-
	minlist(Tail, Min),
	Head < Min.


/**
	Define the predicate subsum(Set, Sum, SubSet)
	so that Set is a list of numbers, SubSet is a subset of these numbers, and the sum of the numbers in SubSet is Sum.
*/



subsum(Set, Sum, SubSet) :-
	subset(Set, SubSet),
	sumlist(SubSet, Sum).

/**
	Define the procedure between(N1, N2, X)
	which for given N1 and N2 generates all numbers between them.
*/
between(N2, N2, [N2]).
%	N1 =:= N2, !.

between(N1, N2, X) :-
	N1 =< N2,
	X1 = [N1],
	N12 is N1 + 1,
	between(N12, N2, X2),
	append(X1, X2, X), !.














