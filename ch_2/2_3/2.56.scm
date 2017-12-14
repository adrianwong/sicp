(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

(define (make-exponentiation x y)
  (cond ((=number? y 0) 1)
        ((=number? y 1) x)
        (else (list '** x y))))
