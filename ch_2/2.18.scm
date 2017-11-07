(define (reverse l)
  (if (null? l)
      nil
      (append (reverse (cdr l)) (list (car l)))))

(define (reverse lst)
  (define (iter lst revlst)
    (if (null? lst)
        revlst
        (iter (cdr lst) (cons (car lst) revlst))))
  (iter lst nil))
