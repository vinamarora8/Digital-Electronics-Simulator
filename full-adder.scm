(define	(half-adder w1 w2 s c)
	(xor-gate w1 w2 s)
	(and-gate w1 w2 c))



(define w1 (make-wire))
(define w2 (make-wire))
(define w3 (make-wire))
(define sum (make-wire))
(define carry (make-wire))
(define mids (make-wire))
(define midc (make-wire))
(define midc2 (make-wire))
(half-adder w1 w2 mids midc)
(half-adder mids w3 sum midc2)
(or-gate midc midc2 carry)

(set! wire-list (list w1 w2 w3 sum carry))
(set! wire-name-list '(a b c sum carry))
