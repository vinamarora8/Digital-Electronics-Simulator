;;				Logic Gates				;;
;;
;;; Inverter
(define (inverter w out)
	
	(define (inverter-action)
		(let 	((s (logical-not	(get-signal w))))

			(if	(= s (get-output out))
				"Done"
				(after-delay 	INVERTER-DELAY
						(delay (set-signal! out s))))))

	(add-wire-action! w inverter-action))
;;;
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
;;;
;;; Or Gate
(define	(or-gate w1 w2 out)
	
	(define (or-gate-action)
		(let	((s (logical-or	(get-signal w1)
					(get-signal w2))))
		
			(if	(= s (get-signal out))
				"Done"
				(after-delay	OR-GATE-DELAY
						(delay (set-signal! out s))))))
	
	(add-wire-action! w1 or-gate-action)
	(add-wire-action! w2 or-gate-action))
;;;
;;; Nand Gate
(define (nand-gate w1 w2 out)
	
	(define (nand-gate-action)
		(let	((s (logical-nand 	(get-signal w1)
						(get-signal w2))))
			
			(if	(= s (get-signal out))
				"Done"
				(after-delay	NAND-GATE-DELAY
						(delay	(set-signal! out s)))))_)

	(add-wire-action! w1 nand-gate-action)
	(add-wire-action! w2 nand-gate-action))
;;;
;;; Nor Gate
(define (nor-gate w1 w2 out)
	
	(define (nor-gate-action)
		(let	((s 	(logical-nor	(get-signal w1)
						(get-signal w2))))
			
			(if	(= s (get-signal out))
				"Done"
				(after-delay	NOR-GATE-DELAY
						(delay (set-signal out s))))))

	(add-wire-action! w1 nor-gate-action)
	(add-wire-action! w2 nor-gate-action))
;;;
;;; XOR Gate
(define	(xor-gate w1 w2 out)
	
	(define	(xor-gate-action)	
		(let 	((s 	(logical-xor	(get-signal w1)
						(get-signal w2))))
			
			(if	(= s (get-signal out))
				"Done"
				(after-delay	XOR-GATE-DELAY
						(delay (set-signal! out s))))))

	(add-wire-action! w1 xor-gate-action)
	(add-wire-action! w2 xor-gate-action))
;;;
;;; XNOR Gate
(define (xnor-gate w1 w2 out)
	
	(define (xnor-gate-action)
		(let	((s	(logical-xnor	(get-signal w1)
						(get-signal w2))))
			
			(if	(= s (get-signal out))
				"Done"
				(after-delay	XNOR-GATE-DELAY
						(delay (set-signal! out s))))))

	(add-wire-action! w1 xnor-gate-action)
	(add-wire-action! w2 xnor-gate-action))
;;;
;;;
;;				Logical Functions			;;
;;
;;; Logical NOT
(define	(logical-not n)
	(if	(= n 1)
		0
		1))
;;; Logical AND
(define	(logical-and n1 n2)
	(cond	((= n1 0)	0)
		((= n2 0)	0)
		(else		1)))
;;;Logical OR
(define (logical-or n1 n2)
	(cond	((= n1 1)	1)
		((= n2 1)	1)
		(else		0)))
;;; Logical NAND
(define	(logical-nand n1 n2)
	(cond	((= n1 0)	1)
		((= n2 0)	1)
		(else		0)))
;;; Logical NOR
(define	(logical-nor n1 n2)
	(cond	((= n1 1)	0)
		((= n2 1)	0)
		(else		1)))
;;; Logical XOR
(define (logical-xor n1 n2)
	(cond	((= n1 n2)	0)
		(else		1)))
;;; Logical XNOR
(define	(logical-xnor n1 n2)
	(cond	((= n1 n2)	1)
		(else		0)))
;;
;;				Delay Values				;;
;;
(define INVERTER-DELAY	 	100)
(define	AND-GATE-DELAY		300)
(define OR-GATE-DELAY 		350)
(define NAND-GATE-DELAY		200)
(define	NOR-GATE-DELAY		250)
(define XOR-GATE-DELAY		500)
(define XNOR-GATE-DELAY		500)
