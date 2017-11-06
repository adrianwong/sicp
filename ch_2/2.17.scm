(define (last-pair l)
  (let ((next (cdr l)))
    (if (null? next)
        l
        (last-pair next))))
