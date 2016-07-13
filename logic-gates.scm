;;	Logic Gates	;;
;;
;;; And Gate
(define (and-gate w1 w2 out)

	(define (and-gate-action)
		(let	((s (logical-and	(get-signal w1)
						(get-signal w2))))

			(if	(= s (get-signal out))
				"Done"
				(after-delay	AND-GATE-DELAY
						(delay (set-signal! out s))))))

	(add-wire-action! w1 and-gate-action)
	(add-wire-action! w2 and-gate-action)
)



;;	Logical Functions	;;
;;
;;; Logical AND
(define	(logical-and n1 n2)
	(cond	((= n1 0)	0)
		((= n2 0)	0)
		(else		1)));
