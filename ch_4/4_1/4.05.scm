(define (extended-cond? clause)
  (and (= (length clause) 3)
       (eq? (cadr clause) '=>)))
(define (cond-test clause) (car clause))
(define (cond-recipient clause) (caddr clause))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last: COND->IF"
                       clauses))
            (if (extended-cond? first)
                (make-if (cond-test first)
                         (list (cond-recipient first)
                               (cond-test first))
                         (expand-clauses rest))
                (make-if (cond-predicate first)
                         (sequence->exp (cond-actions first))
                         (expand-clauses rest)))))))
