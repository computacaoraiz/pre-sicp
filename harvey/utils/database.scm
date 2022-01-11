;;; Database.scm:  This file contains the code we show in the database
;;; chapter of _Simply_Scheme_.  You should add your new work to this file.

;;; The database ADT: a filename, list of fields and list of records

(define (make-db filename fields records)
  (vector filename fields records))

(define (db-filename db)
  (vector-ref db 0))

(define (db-set-filename! db filename)
  (vector-set! db 0 filename))

(define (db-fields db)
  (vector-ref db 1))

(define (db-set-fields! db fields)
  (vector-set! db 1 fields))

(define (db-records db)
  (vector-ref db 2))

(define (db-set-records! db records)
  (vector-set! db 2 records))


;;; Stuff about the current state

(define current-state (vector #f))

(define (no-db?)
  (not (vector-ref current-state 0)))

(define (current-db)
  (if (no-db?)
      (error "No current database!")
      (vector-ref current-state 0)))

(define (set-current-db! db)
  (vector-set! current-state 0 db))

(define (current-fields)
  (db-fields (current-db)))

;; User commands

(define (new-db filename fields)
  (set-current-db! (make-db filename fields '()))
  'created)

(define (insert)
  (let ((new-record (get-record)))
    (db-insert new-record (current-db)))
  (if (ask "Insert another? ")
      (insert)
      'inserted))

(define (db-insert record db)
  (db-set-records! db (cons record (db-records db))))

(define (get-record)
  (get-record-loop 0
		   (make-vector (length (current-fields)))
		   (current-fields)))

(define (get-record-loop which-field record fields)
  (if (null? fields)
      record
      (begin (display "Value for ")
	     (display (car fields))
	     (display "--> ")
	     (vector-set! record which-field (read))
	     (get-record-loop (+ which-field 1) record (cdr fields)))))

;;; Utilities

(define (ask question)
  (display question)
  (let ((answer (read)))
    (cond ((equal? (first answer) 'y) #t)
	  ((equal? (first answer) 'n) #f)
	  (else (show "Please type Y or N.")
		(ask question)))))
