(define (last-pair lst)
  (cond ((null? lst) nil)
        ((null? (cdr lst)) lst)
        (else (last-pair (cdr lst)))))
