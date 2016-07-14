;;		Agenda Management		;;
;;
;;; Agenda, needs a header node
(define	agenda (list '*agenda*))
;;;
;;;
;;; A current time needs to be maintainted
(define current-time 0)
;;;
;;; To reset the agenda and current time
(define (reset-agenda)
	(set! agenda (list '*agenda*))
	(set! current-time 0))
;;;
;;; Adding a action to agenda
(define	(add-to-agenda action time #!optional ag)
	
	(if	(default-object? ag)
		(add-to-agenda action time agenda)
		(cond	
			;; If we have reached end
			((null? (cdr ag))
				(set-cdr! ag (list	(cons	time
								(list action)))))
			
			;; If time doesn't exist but comes in between
			((> (caadr ag) time)
				(set-cdr! ag (cons	(cons	time
								(list action))
							(cdr ag))))
			
			;; Reached
			((= (caadr ag) time)
				(set-cdr! (cadr ag)	(cons	action
								(cdadr ag))))

			
			;; On the way
			((< (caadr ag) time)
				(add-to-agenda action time (cdr ag))))))
;;;
;;;
;;; Run action list
(define (run-action-list l)
	(cond	((null? l)	"Done")
		(else	
			(force (car l))
			(run-action-list (cdr l)))))
;;;
;;; Run an agenda
(define (run-agenda #!optional ag)
	
	(cond	((default-object? ag)	
			(run-agenda agenda))
		
		;; If we have reached the end
		((null? (cdr ag))
			"Done")

		;; Working
		(else	
			;; Update current-time, run the action-list of that time, and cdr down the agenda
			(set! current-time (caadr ag))
			(run-action-list (cdadr ag))
			(run-agenda (cdr ag)))))
;;;
;;; After Delay
(define	(after-delay dt proc)
	(add-to-agenda	proc
			(+ current-time dt)))
