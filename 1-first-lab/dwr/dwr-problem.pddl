(define (problem dwr-problem1) (:domain dock-worker-robots)
(:objects
    r1 - robot
    l1 l2 - location
    k1 k2 - crane
    p1 q1 p2 q1 - pile
    ca cb cc cd ce cf - container
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (adjacent l1 l2)
    (attached p1 l1) (attached q1 l1) (attached p2 l2) (attached q2 l2)
    (belong k1 l1) (belong k2 l2)
    (at r1 l1)
    (unloaded r1)
    (empty k1) (empty k2)
    (in ca p1) (in )
    


)

(:goal (and
    ;todo: put the goal condition here
    (in ca p2)
    (in cb q2)
    (in cc p2)
    (in cd q2)
    (in ce q2)
    (in cf q2)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
