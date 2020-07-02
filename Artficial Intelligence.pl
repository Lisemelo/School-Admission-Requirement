
%to start type"menu.".
:- use_module(library(jpl)).
menu :-sleep(0.4),
		write('-----------------------------------------------------------------'),nl,
		write('................. STUDENT ENROLLEMENT SYSTEM.....................'),nl,
		write('-----------------------------------------------------------------'),nl,nl,
                write('credit denoted by C,B,A and C=>60,B=>75,A=>85!!'),nl,nl,
                write('pass denoted by D,E and D=>50,E=>40!!'),nl,nl,
                write('*****************************************************************'),nl,

 hypothesis(Level),
    write('You qualify for:'),
    write(Level),nl,
    undo.



hypothesis(degree):-degree,!.
hypothesis(degree):-degree,!.
hypothesis(deploma):-deploma,!.
hypothesis("nothing at provided levels sorry!!").


degree:-
    requirements(have_credit_in_maths),
    requirements(have_credit_in_commercial_subject),
    requirements(have_minimum_of_5_credidt).

degree:-
    requirements(have_pass_in_maths),
    requirements(have_credit_in_commercial_subject),
    requirements(have_minimum_of_5_credidt).

deploma:-
    requirements(have_pass_in_maths),
    requirements(have_pass_in_commercial_subject),
    requirements(have_minimum_of_3_credidt).



ask(Question):-
    write('Do you '),
    write(Question),
    write('?'),nl,
    read(Reply),
    nl,
   ((Reply == yes ; Reply ==y)
    ->
    assert(yes(Question));
    assert(no(Question)),fail).
:-dynamic yes/1,no/1.
requirements(R):-
(yes(R)
->  true;
(no(R)
->fail;
ask(R))).

undo:-retract(yes(_)),fail.
undo:-retract(no(_)),fail.
undo.

help :- write("To initiate the system please type 'menu.' and press Enter key").


