defineSituation(LP, ST) :-
    LP =< 8 -> ST = light  ;
    LP =< 12 -> ST = medium ;
                 ST = severe.
