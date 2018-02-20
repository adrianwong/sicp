(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (define (op records key)
        (if (pair? records)
            (let ((record (assoc key records)))
              (if record
                  (cdr record)
                  false))
            false))
      (fold-left op (cdr local-table) keys))
    (define (insert! keys value)
      (define (op records key)
        (let ((record (assoc key (cdr records))))
          (if record
              record
              (begin
                (set-cdr! records (cons (cons key '())
                                        (cdr records)))
                (cadr records)))))
      (set-cdr! (fold-left op local-table keys)
                value)
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation - TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put '(1 1) 'a)
(put '(1 2) 'b)
(put '(2 1) 'c)
(put '(2 1) 'd)

(get '(1 1))   ; 'a
(get '(1 2))   ; 'b
(get '(2 1))   ; 'd
(get '(1 2 3)) ; #f
