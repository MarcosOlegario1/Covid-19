% receive a value and return a level
levelValue(green,  +1).
levelValue(yellow, +2).
levelValue(orange, +3).
levelValue(red,    +4).


situation(severe, "Severe: must be referred to the hospital").
situation(medium, "Medium: must stay at home, under observation for 14 days").
situation(light,  "Light: must stay at home, under observation for 14 days").


% Comorbidities / Complaints
% ( incremental, name, level )
patientHas(1, hipertensaoArterial,   green).
patientHas(2, diabetesMellitus,      orange).
patientHas(3, coronariopatia,        green).
patientHas(4, imunossupresssao,      green).
patientHas(5, arterialHyper,         yellow).
patientHas(6, doencaPulmonarCronica, red).
patientHas(7, gestacao,              yellow).

patientHas(8, febre,     yellow).
patientHas(9, tosse,     orange).
patientHas(10, dispneia, green).
patientHas(11, cafaleia, green).
patientHas(12, diarreia, green).
patientHas(13, mialgia,  green).


% Symptoms
% ( incremental, name, rule, unit )
symptom(1, temperatura,      temperaturaRule,      "ºC").
symptom(2, freqCardiaca,     freqCardiacaRule,     "bpm").
symptom(3, freqRespiratoria, freqRespiratoriaRule, "ipm").
symptom(4, paSistolica,      paSistolicaRule,      "mmHg").
symptom(5, saO2,             saO2Rule,             "%").
symptom(6, dispneia,         dispneiaRule,         "1-Sim/0-Não").
symptom(7, idade,            idadeRule,            "Anos").

% Symptoms Rules
% for all symptom rules (inputValue, returnLevel)
temperaturaRule(Value, Level) :-
    ( ( Value >= 35 , Value < 37 ) -> Level = green  ;
                        Value < 39 -> Level = yellow ;
                                      Level = orange
    ).

freqCardiacaRule(Value, Level) :-
    ( Value < 100 -> Level = green  ;
                     Level = yellow ).

freqRespiratoriaRule(Value, Level) :-
    ( Value < 18 -> Level = green   ;
      Value < 30 -> Level = yellow  ;
                    Level = red     ).

paSistolicaRule(Value, Level) :-
    ( Value > 100 -> Level = green   ;
      Value > 90  -> Level = orange  ;
                     Level = red     ).

saO2Rule(Value, Level) :-
    ( Value >= 95 -> Level = green   ;
                     Level = red     ).

dispneiaRule(Value, Level) :-
    ( Value == 0 -> Level = green   ;
                    Level = red     ).

idadeRule(Value, Level) :-
    ( Value < 60 -> Level = green   ;
      Value < 80 -> Level = yellow  ;
                    Level = red     ).
