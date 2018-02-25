(define (ripple-carry-adder ak bk sk c)
  (define (iter a b s c-in c-out)
    (if (null? a)
        s
        (begin
          (full-adder (car ak) (car bk) c-in (car sk) c-out)
          (iter (cdr a) (cdr b) (cdr s) c-out (make-wire)))))
  (iter ak bk sk c (make-wire)))
