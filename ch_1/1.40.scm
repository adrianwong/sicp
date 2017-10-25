(define (cube n) (* n n n))

(define (square n) (* n n))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
