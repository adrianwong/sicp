(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define x '(1 2 3))
(count-pairs x) ; 3

(set-car! (cdr x) (cddr x))
(count-pairs x) ; 4

(set-car! x (cdr x))
(count-pairs x) ; 7

(set-cdr! (cddr x) x)
(count-pairs x) ; Never returns
