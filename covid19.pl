:- [utils].
:- [symptomRules].
:- [defineRules].

init :-
    readSymptoms(0,0,TS),
    readPatientHas(0,0,TPH),
    TT is TS + TPH,
    defineSituation(TT, ST),
    situation(ST, STtext),
    nl,
    writeln("Result:"),
    writeln(STtext).

% Comorbidities / Complaints
readPatientHas(A,TN,TR) :-
    increment(A,N),
    ( patientHas(N,X,L)
      -> answerPatientHas(X,L,LP),
         readPatientHas(N,(TN + LP),TR)
      ; TR is TN ).

answerPatientHas(X,L,LP) :-
    write("Do you have "), write(X), write("?(y/n): "),
    read(V),
    ( V = 'y' -> levelValue(L, LP) ; LP = +0 ).

% Simptoms
readSymptoms(A,TN,TR) :-
    increment(A,N),
    ( symptom(N,X,_,O)
      -> answerSymptom(X,O,LP),
         readSymptoms(N,(TN + LP),TR)
      ; TR is TN ).

answerSymptom(X,O,LP) :-
    write("Type your "), write(X), write("("), write(O), write("): "),
    read(V),
    checkSymptom(X,V,LP).

checkSymptom(Symptom, Value, LevelValue) :-
    symptom(_,Symptom, Rule, _),
    call(Rule, Value, Level),
    levelValue(Level, LevelValue).
