[util].
[lists].

solution([]).

solution([X/Y | Others]) :-
	solution(Others),
	member([1, 2, 3, 4, 5, 6, 7, 8], Y),
	noattack(X/Y, Others).

noattack(_, []).

noattack(X/Y, [X1/Y1 | Others]) :-
	Y =\= Y1,
	X1 - X =\= Y1 - Y,
	X - X1 =\= Y1 - Y,
	noattack(X/Y, Others).

template([1/_, 2/_, 3/_, 4/_, 5/_, 6/_, 7/_, 8/_]).


solution2(Queens, Template) :-
	permutation(Template, Queens),
	safe(Queens).

safe([]).
safe([Queen|Others]) :-
	safe(Others),
	noattack_dist(Queen, Others, 1).

noattack_dist(_, [], _).
noattack_dist(Queen, [First|Others], XDist) :-
	Queen =\= First + XDist,
	First =\= Queen + XDist,
	Dist1 is XDist + 1,
	noattack_dist(Queen, Others, Dist1).

