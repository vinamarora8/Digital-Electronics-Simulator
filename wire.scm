;;		Wire		;;
;;
;;; Make Wire
(define	(make-wire)

	(let	((signal 0) (action-list '()))
		
		;; Set-My-Signal
		(define (set-my-signal! s)
			(cond	((= s signal)	"Done")
				(else
					(set! signal s)
					(execute-action-list))))
		
		;; Get-my-signal
		(define	(get-my-signal)
			signal)
		
		;; Add-My-Wire-Action
		(define (add-my-wire-action! action)
			(set! 	action-list
				(cons action action-list))
			(action))

		;; Execute-Action-List
		(define (execute-action-list #!optional l)
			(if	(default-object? l)
				(execute-action-list action-list)
				(cond	((null? l)	"Done")
					(else
						((car l))
						(execute-action-list (cdr l))))))

		;; Dispatch for the wire
		(define	(dispatch m)
			(cond	((eq? m 'set-signal!)	set-my-signal!)
				((eq? m 'get-signal)	get-my-signal)
				((eq? m 'add-wire-action!)	add-my-wire-action!)
				(else	(error "Bad wire message : " m))))
				
		dispatch))
;;;
;;; Procedures to handle wire dispatch
(define	(set-signal! w1 s)
	((w1 'set-signal!) s))

(define (get-signal w1)
	((w1 'get-signal)))

(define (add-wire-action! w1 action)
	((w1 'add-wire-action!) action))
;;;
