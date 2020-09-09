test_puzzle(Name, Solution) :-
	structure(Name, Structure),
	clues(Name, Structure, Clues),
	queries(Name, Structure, Queries, Solution),
	solve_puzzle(puzzle(Clues, Queries, Solution), Solution).
	
	
	
solve_puzzle(puzzle(Clues, Queries, Solution), Solution) :-
	solve(Clues),
	solve(Queries).
	
	
	
solve([]).
solve([Clue|Clues]) :- Clue, solve(Clues).



structure(homework, [house(C1, N1, D1, S1, P1), house(C2, N2, D2, S2, P2), 
	house(C3, N3, D3, S3, P3), house(C4, N4, D4, S4, P4), house(C5, N5, D5, S5, P5)]).


clues(homework, Houses, [
	(color(House1Clue1, 'Red'), nationality(House1Clue1, 'American'), add_to_list(House1Clue1, Houses),
	(nationality(House1Clue2, 'Spaniard'), pet(House1Clue2, 'Dog'), add_to_list(House1Clue2, Houses)),
	(drink(House1Clue3, 'Coffee'), color(House1Clue3, 'Green'), add_to_list(House1Clue3, Houses)),
	(nationality(House1Clue4, 'Ukranian'), drink(House1Clue4, 'Tea'), add_to_list(House1Clue4, Houses)),
	(color(House1Clue5, 'Green'), color(House2Clue5, 'Ivory'), right_of(House2Clue5, House1Clue5, Houses)),
	(show(House1Clue6, 'Succession'), pet(House1Clue6, 'Snails'), add_to_list(House1Clue6, Houses)),
	(show(House1Clue7, 'Westworld'), color(House1Clue7, 'Yellow'), add_to_list(House1Clue7, Houses)),
	(drink(House1Clue8, 'Milk'), Houses = [_, _, House1Clue8, _, _]),
	(nationality(House1Clue9, 'Norwegian'), Houses = [House1Clue9, _, _, _, _]),
	(show(House1Clue10, 'ER'), pet(House2Clue10, 'Fox'), next_to(House1Clue10, House2Clue10, Houses)),
	(show(House1Clue11, 'Westworld'), pet(House2Clue11, 'Horse'), next_to(House1Clue11, House2Clue11, Houses)),
	(show(House1Clue12, 'Breaking Bad'), drink(House1Clue12, 'Orange Juice'), add_to_list(House1Clue12, Houses)),
	(nationality(House1Clue13, 'Japanese'), show(House1Clue13, 'Game of Thrones'), add_to_list(House1Clue13, Houses)),
	(nationality(House1Clue14, 'Norwegian'), color(House2Clue14, 'Blue'), next_to(House1Clue14, House2Clue14, Houses)))]).


queries(homework, Houses, [member(Q1, Houses), nationality(Q1, Answer1), pet(Q1, 'Zebra'),
	member(Q2, Houses), nationality(Q2, Answer2), drink(Q2, 'Water')],
	[['The person who owns the Zerba is ', Answer1], ['The person who drinks Water is ', Answer2]]).

	
	
color(house(A, B, C, D, E), A).

nationality(house(A, B, C, D, E), B).

drink(house(A, B, C, D, E), C).

show(house(A, B, C, D, E), D).

pet(house(A, B, C, D, E), E).

next_to(A, B, List) :- append(_, [A, B| _], List).
next_to(A, B, List) :- append(_, [B, A| _], List).

right_of(A, B, List) :- append(_, [A, B| _], List).

add_to_list(A, List) :- List = [A, _, _, _, _].
add_to_list(A, List) :- List = [_, A, _, _, _].
add_to_list(A, List) :- List = [_, _, A, _, _].
add_to_list(A, List) :- List = [_, _, _, A, _].
add_to_list(A, List) :- List = [_, _, _, _, A].


