;Header and description

(define (domain miconic)

;remove requirements that are not needed
(:requirements :strips :typing :disjunctive-preconditions)
(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    passenger
    floor
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (notboarded ?p - passenger)
    (boarded ?p - passenger)
    (down ?f - floor)
    (up ?f - floor)
    (notserved ?p passenger)
    (depart ?p - passenger ?f - floor)
    (origin ?p - passenger ?f - floor)
    (board ?p - passenger ?f - floor)
    (lift-at ?f - floor)
    (served ?p - passenger)


)


(:functions ;todo: define numeric functions here
)

;define actions here

)