(define (reverse l)
  (let ((next (cdr l)))
    (if (null? next)
        l
        (append (reverse next) (cons (car l) nil)))))
