;;			Talk Diff			;;
;;;
;;; 2 Lists need to be maintained:
(define wire-list '())
(define wire-name-list '())
;;;
;;; Create-Signal-List
(define (create-signal-list #!optional wl l)
		
	(if	
		;; If create signal list is called by the user
		(default-object? l)
		(create-signal-list wire-list '())
		;; If not
		(if	
			;; If all wires covered, return signal list
			(null? wl)
			l
			;; Otherwise append signal list with current wire and cdr down
			(create-signal-list	(cdr wl)
						(append l (list (get-signal (car wl))))))))

;;;
;;;
;;; Compare-Signal-Lists
(define (compare-signal-lists olist nlist #!optional names)
	
	(if	;; Called by user
		(default-object? names)
		(compare-signal-lists olist nlist wire-name-list)
		;; Called in recursion
		(if	;; End reached?
			(null? olist)
			"Done"
			;; If not
			(cond	((= (car olist) (car nlist))
					(compare-signal-lists 	(cdr olist)
								(cdr nlist)
								(cdr names)))
				;; If changed	
				(else	
					;; output:
					;; time> wire-name : changed from old-signal to new-signal
					(write current-time)
					(write-string ">")
					(write-char #\tab)
					(write (car names))
					(write-string " :  changed from ")
					(write (car olist))
					(write-string " to ")
					(write-line (car nlist))
					;; Cdr down to compare further
					(compare-signal-lists	(cdr olist)
								(cdr nlist)
								(cdr names)))))))
;;;
;;;
;;; Make-Talk-Diff
(define	(make-talk-diff)
	(let* ((old-state (create-signal-list))
		(new-state old-state))
		(lambda ()
			(set! new-state (create-signal-list))
			(compare-signal-lists old-state new-state)
			(set! old-state new-state))))
