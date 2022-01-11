;;; ttt.scm
;;; Tic-Tac-Toe program

(define (ttt position me)
  (one-okay-move (number-squares position) me))

(define (one-okay-move position me)
  (find-one (lambda (sq) (no-lose? (plug-in me sq position) me))
	    (free-squares position)))

(define (no-lose? position me)
  (cond ((already-lost? position me) #f)
	((already-won? position me) #t)
	(else (not (find-one (lambda (pos) (not (one-okay-move pos me)))
			     (extend position (opponent me)) )))))

(define (free-squares pos)
  (keep number? pos))

(define (number-squares pos)
  (ns-help pos 1))

(define (ns-help pos num)
  (cond ((empty? pos) "")
	((equal? (first pos) '_) (word num (ns-help (bf pos) (+ num 1))))
	(else (word (first pos) (ns-help (bf pos) (+ num 1)))) ))

(define (plug-in letter sq pos)
  (cond ((empty? pos) "")
	((= sq 1) (word letter (bf pos)))
	(else (word (first pos) (plug-in letter (- sq 1) (bf pos)))) ))

(define (find-one pred stuff)
  (cond ((empty? stuff) #f)
	((pred (first stuff)) (first stuff))
	(else (find-one pred (bf stuff))) ))

(define (extend pos who)
  (every (lambda (sq) (plug-in who sq pos))
	 (free-squares pos)))

(define (opponent letter)
  (if (equal? letter 'x) 'o 'x))

(define (already-won? pos me)
  (find-one (lambda (win) (match-win? pos me win))
	    '(yyynnnnnn nnnyyynnn nnnnnnyyy ynnynnynn nynnynnyn nnynnynny
			ynnnynnny nnynynynn)))

(define (already-lost? pos me)
  (already-won? pos (opponent me)))

(define (match-win? pos me win)
  (cond ((empty? win) #t)
	((equal? (first win) 'y)
	 (if (equal? (first pos) me)
	     (match-win? (bf pos) me (bf win))
	     #f))
	(else (match-win? (bf pos) me (bf win))) ))
