%Family database

family(
  person(tom, fox, date(7, may, 1960), works(bbc, 15200)),
  person(ann, fox, date(9, may, 1961), unemployed),
  [ person(pat, fox, date(6, may, 1983), unemployed),
    person(jim, fox, date(5, may, 1983), unemployed)]).

family(
  person(tom1, fox1, date(7, may, 1960), works(bbc, 15200)),
  person(ann1, fox1, date(9, may, 1961), unemployed),
  [ person(pat1, fox1, date(6, may, 1983), unemployed),
    person(jim1, fox1, date(7, may, 1983), unemployed)]).

family(
  person(tom2, fox, date(7, may, 1960), works(bbc, 15200)),
  person(ann2, fox, date(9, may, 1961), unemployed),
  [ person(pat2, fox, date(8, may, 1983), works(bbc, 15200)),
    person(jim2, fox, date(9, may, 1983), unemployed)]).

family(
  person(tom3, fox, date(7, may, 1960), unemployed),
  person(ann3, fox, date(9, may, 1976), works(bbc, 15200)),
  [ person(pat3, fox, date(5, may, 1983), works(bbc, 15200)),
    person(jim3, fox, date(5, may, 1983), unemployed)]).

member([Head|_], Head).

member([_|Tail], X) :-
	member(Tail, X).

child(Person) :-
	family(_, _, Children),
	member(Children, Person).

twins(person(X, Y, D, _), person(X, Y, D, _)).

twin_children(Child1, Child2) :-
	child(Child1),
	child(Child2),
	twins(Child1, Child2).

ijth_member(X, I, J, Member) :-
	nth_member(X, I, Row),
	nth_member(Row, J, Member), !.

nth_member([X|_], 0, X).

nth_member([_|Tail], N, Member) :-
	N1 is N - 1,
	nth_member(Tail, N1, Member), !.


























