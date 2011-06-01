







pre_r(N,T) :- get_time(T1), stamp_date_time(T1, X1, 'UTC'), write(X1), nl, problem(N,T).
post_r(T) :- mostrar(T), get_time(T2), stamp_date_time(T2, X2, 'UTC'), write(X2).

% rA(N,T) :- pre_r(N,T), completarA(T), post_r(T).
% rB(N,T) :- pre_r(N,T), completarB(T), post_r(T).
% rC(N,T) :- pre_r(N,T), completarC(T), post_r(T).
	
mostrar([]).
mostrar([Fila|T]) :-
	mostrar_lista(Fila),
	mostrar(T).

mostrar_lista([]) :- nl.
mostrar_lista([H|T]) :- mostrar_celda(H), mostrar_lista(T).

mostrar_celda(C) :- nonvar(C), C == mina, write('*').
mostrar_celda(C) :-	nonvar(C), C \= mina, write(C).
mostrar_celda(C) :- var(C), write('_').


problem(t1, [[_,_],
			 [_,1]]).

problem(t2, [[_,_],
			 [_,2]]).

problem(t3, [[_,_],
			 [_,3]]).

problem(t4, [[0,_,_],
			 [_,1,_],
			 [_,_,0]]).
% Problem from Gecode/examples/minesweeper.cc  problem 0
% 
% Solution:
%  1 0 0 0 0 1
%  0 1 0 1 1 0
%  0 0 0 0 1 0
%  0 0 0 0 1 0
%  0 1 1 1 0 0
%  1 0 0 0 1 1
%
problem(0,[[_,_,2,_,3,_],
           [2,_,_,_,_,_],
           [_,_,2,4,_,3],
           [1,_,3,4,_,_],
           [_,_,_,_,_,3],
           [_,3,_,3,_,_]]).



% Problem from Gecode/examples/minesweeper.cc  problem 1
problem(1,[[_,2,_,2,1,1,_,_],
           [_,_,4,_,2,_,_,2],
           [2,_,_,2,_,_,3,_],
           [2,_,2,2,_,3,_,3],
           [_,_,1,_,_,_,4,_],
           [1,_,_,_,2,_,_,3],
           [_,2,_,2,2,_,3,_],
           [1,_,1,_,_,1,_,1]]).



% Problem from Gecode/examples/minesweeper.cc  problem 2
problem(2,[[1,_,_,2,_,2,_,2,_,_],
           [_,3,2,_,_,_,4,_,_,1],
           [_,_,_,1,3,_,_,_,4,_],
           [3,_,1,_,_,_,3,_,_,_],
           [_,2,1,_,1,_,_,3,_,2],
           [_,3,_,2,_,_,2,_,1,_],
           [2,_,_,3,2,_,_,2,_,_],
           [_,3,_,_,_,3,2,_,_,3],
           [_,_,3,_,3,3,_,_,_,_],
           [_,2,_,2,_,_,_,2,2,_]]).


% Problem from Gecode/examples/minesweeper.cc  problem 3
problem(3,[[2,_,_,_,3,_,1,_],
           [_,5,_,4,_,_,_,1],
           [_,_,5,_,_,4,_,_],
           [2,_,_,_,4,_,5,_],
           [_,2,_,4,_,_,_,2],
           [_,_,5,_,_,4,_,_],
           [2,_,_,_,5,_,4,_],
           [_,3,_,3,_,_,_,2]]).


% Problem from Gecode/examples/minesweeper.cc  problem 4
problem(4,[[0,_,0,_,1,_,_,1,1,_],
           [1,_,2,_,2,_,2,2,_,_],
           [_,_,_,_,_,_,2,_,_,2],
           [_,2,3,_,1,1,_,_,_,_],
           [0,_,_,_,_,_,_,2,_,1],
           [_,_,_,2,2,_,1,_,_,_],
           [_,_,_,_,_,3,_,3,2,_],
           [_,5,_,2,_,_,_,3,_,1],
           [_,3,_,1,_,_,3,_,_,_],
           [_,2,_,_,_,1,2,_,_,0]]).


% Problem from Gecode/examples/minesweeper.cc  problem 5
problem(5,[[_,2,1,_,2,_,2,_,_,_],
           [_,4,_,_,3,_,_,_,5,3],
           [_,_,_,4,_,4,4,_,_,3],
           [4,_,4,_,_,5,_,6,_,_],
           [_,_,4,5,_,_,_,_,5,4],
           [3,4,_,_,_,_,5,5,_,_],
           [_,_,4,_,4,_,_,5,_,5],
           [2,_,_,3,3,_,6,_,_,_],
           [3,6,_,_,_,3,_,_,4,_],
           [_,_,_,4,_,2,_,2,1,_]]).



% Problem from Gecode/examples/minesweeper.cc  problem 6
problem(6,[[_,3,2,_,_,1,_,_],
           [_,_,_,_,1,_,_,3],
           [3,_,_,2,_,_,_,4],
           [_,5,_,_,_,5,_,_],
           [_,_,6,_,_,_,5,_],
           [3,_,_,_,5,_,_,4],
           [2,_,_,5,_,_,_,_],
           [_,_,2,_,_,3,4,_]]).


% Problem from Gecode/examples/minesweeper.cc  problem 7
problem(7,[[_,1,_,_,_,_,_,3,_],
           [_,_,_,3,4,3,_,_,_],
           [2,4,4,_,_,_,4,4,3],
           [_,_,_,4,_,4,_,_,_],
           [_,4,_,4,_,3,_,6,_],
           [_,_,_,4,_,3,_,_,_],
           [1,2,3,_,_,_,1,3,3],
           [_,_,_,3,2,2,_,_,_],
           [_,2,_,_,_,_,_,3,_]]).



% Problem from Gecode/examples/minesweeper.cc  problem 8
problem(8,[[_,_,_,_,_,_,_],
           [_,2,3,4,3,5,_],
           [_,1,_,_,_,3,_],
           [_,_,_,5,_,_,_],
           [_,1,_,_,_,3,_],
           [_,1,2,2,3,4,_],
           [_,_,_,_,_,_,_]]).


% Problem from Gecode/examples/minesweeper.cc  problem 9
problem(9,[[2,_,_,_,2,_,_,_,2],
           [_,4,_,4,_,3,_,4,_],
           [_,_,4,_,_,_,1,_,_],
           [_,4,_,3,_,3,_,4,_],
           [2,_,_,_,_,_,_,_,2],
           [_,5,_,4,_,5,_,4,_],
           [_,_,3,_,_,_,3,_,_],
           [_,4,_,3,_,5,_,6,_],
           [2,_,_,_,1,_,_,_,2]]).



% From "Some Minesweeper Configurations",page 2
problem(10,[[_,_,_,_,_,_],
            [_,2,2,2,2,_],
            [_,2,0,0,2,_],
            [_,2,0,0,2,_],
            [_,2,2,2,2,_],
            [_,_,_,_,_,_]]).



% From "Some Minesweeper Configurations",page 3
% 4 solutions
problem(11,[[2,3,_,2,2,_,2,1],
            [_,_,4,_,_,4,_,2],
            [_,_,_,_,_,_,4,_],
            [_,5,_,6,_,_,_,2],
            [2,_,_,_,5,5,_,2],
            [1,3,4,_,_,_,4,_],
            [0,1,_,4,_,_,_,3],
            [0,1,2,_,2,3,_,2]]).


% Richard Kaye: How Complicated is Minesweeper?
% http://web.mat.bham.ac.uk/R.W.Kaye/minesw/ASE2003.pdf
% 
% A Wire,page 33
% 2 solutions
%
problem(12,[[_,0,0,0,0,0,0,0,0,0,0,0,0,_],
            [_,1,1,1,1,1,1,1,1,1,1,1,1,_],
            [_,_,1,_,_,1,_,_,1,_,_,1,_,_],
            [_,1,1,1,1,1,1,1,1,1,1,1,1,_],
            [_,0,0,0,0,0,0,0,0,0,0,0,0,_]]).


% Richard Kaye: How Complicated is Minesweeper?
% http://web.mat.bham.ac.uk/R.W.Kaye/minesw/ASE2003.pdf
% A splitter,page 35
% Many solutions...
%
problem(13,[[_,_,_,0,_,_,_,0,_,_,_],
            [_,_,_,0,1,_,1,0,_,_,_],
            [_,_,_,0,1,_,1,0,_,_,_],
            [0,0,0,0,1,1,1,0,0,0,0],
            [_,1,1,1,1,_,1,1,1,1,_],
            [_,_,_,1,_,2,_,1,_,_,_],
            [_,1,1,1,1,_,1,1,1,1,_],
            [0,0,0,0,1,1,1,0,0,0,0],
            [_,_,_,0,1,_,1,0,_,_,_],
            [_,_,_,0,1,_,1,0,_,_,_],
            [_,_,_,0,_,_,_,0,_,_,_]]).
        


% Oleg German,Evgeny Lakshtanov: "Minesweeper" without a computer
% http://arxiv.org/abs/0806.3480,page 4
problem(14,[[_,1,_,1,_,1],
            [2,_,2,_,1,_],
            [_,3,_,2,_,1],
            [1,_,3,_,2,_],
            [_,1,_,2,_,1]]).
