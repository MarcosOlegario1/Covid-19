increment(A,R) :-
    sum(R,A,+1).

sum(R,A,B) :-
    R is A + B.
