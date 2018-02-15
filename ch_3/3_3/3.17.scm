(define (count-pairs x)
  (let ((visited '()))
    (define (count-pairs-internal x)
      (if (or (not (pair? x)) (memq x visited))
          0
          (begin
            (set! visited (cons x visited))
            (+ (count-pairs-internal (car x))
               (count-pairs-internal (cdr x))
               1))))
    (count-pairs-internal x)))

(define x '(1 2 3))
(count-pairs x) ; 3

(set-car! (cdr x) (cddr x))
(count-pairs x) ; 3

(set-car! x (cdr x))
(count-pairs x) ; 3

(set-cdr! (cddr x) x)
(count-pairs x) ; 3
