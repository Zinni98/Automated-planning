;Header and description

(define (domain dock-worker-robots)

;remove requirements that are not needed
(:requirements :strips :typing ::disjunctive-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    container
    location
    pile
    robot
    crane
)

; un-comment following line if constants are needed
(:constants 
    pallet - container
)

(:predicates ;todo: define predicates here
    (adjacent ?l1 ?l2 - location)
    (attached ?p - pile ?l - location)
    (belong ?k -crane ?l - location)
    (at ?r - robot ?l - location)
    (free ?l - location)
    (loaded ?r - robot ?c - container)
    (unloaded ?r - robot)
    (holding ?k - crane ?c - container)
    (empty ?k - crane)
    (in ?c - container ?p - pile)
    (top ?c - container ?p - pile)
    (on ?c1 - container ?c2 - container)

)


(:functions ;todo: define numeric functions here
)

;define actions here
; (predicate ?vars)
(:action move
    :parameters (?r - robot ?from ?to - location)
    :precondition (and (at ?r ?from)
                       (adjacent ?from ?to)
                       (free ?to)
    )
    :effect (and (free ?from)
                 (not free ?to)
                 (at ?r ?to)
                 (not at ?r ?from)
    )
)

(:action load
    :parameters (?r - robot ?c container ?k - crane ?l - location)
    :precondition (and (unloaded ?r)
                       (belong ?k ?l)
                       (at ?r ?l)
                       (holding ?k ?c)

    )
    :effect (and (empty ?k)
                 (loaded ?r ?c)
                 (not (unloaded ?r))
                 (not (holding ?k ?c))

    )
)

(:action unload
    :parameters (?r - robot ?c container ?k - crane ?l - location)
    :precondition (and (loaded ?r ?c)
                       (belong ?k ?l)
                       (at ?r ?l)
                       (empty ?k)
    )
    :effect (and (holding ?k ?c)
                 (unloaded ?r)
                 (not loaded ?r ?c)
                 (not empty ?k)

    )
)

(:action take
    :parameters (?c1 ?c2 - container ?p - pile ?k - crane ?l - location)
    :precondition (and (attached ?p ?l)
                       (belong ?k ?l)
                       (on ?c1 ?c2)
                       (in ?c2 ?p)
                       (top ?c1 ?p)
                       (empty ?k)
    )
    :effect (and (not (on ?c1 ?c2))
                 (not (top ?c1 ?p))
                 (not (empty ?k))
                 (top ?c2 ?p)
                 (holding ?c1 ?k)
    )
)

(:action put
    :parameters (?c1 ?c2 - container ?p - pile ?k - crane ?l - location)
    :precondition (and (top ?c2 ?p)
                       (holding ?c1 ?k)
                       (attached ?p ?l)
                       (belong ?k ?l)
    )
    :effect (and (on ?c1 ?c2)
                 (top ?c1 ?p)
                 (in ?c2 ?p)
                 (empty ?k)
                 (not (top ?c2 ?p))
                 (not (holding ?c1 ?k))
                 
    )

)




)