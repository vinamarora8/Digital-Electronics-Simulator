(define w1 (make-wire))
(define w2 (make-wire))
(define w3 (make-wire))
(define w4 (make-wire))
(define w5 (make-wire))

(and-gate w1 w2 w4)
(and-gate w3 w4 w5)

(set! wire-list (list w1 w2 w3 w4 w5))
(set! wire-name-list '(a b c d e))

(set-signal! w1 1)
(set-signal! w2 1)
(set-signal! w3 1)

;(run-agenda)
