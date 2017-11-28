(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose (repeated f (- n 1)) f)))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3.0)))

(define (n-fold-smooth f n x)
  ((repeated (smooth f) n) x))
