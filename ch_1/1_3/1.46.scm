(define (iterative-improve good-enough? improve)
  (define (improve-procedure guess)
    (if (good-enough? guess)
        guess
        (improve-procedure (improve guess))))
  improve-procedure)

; Sqrt
(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

(define (sqrt x)
  ((iterative-improve (lambda (guess)
                        (< (abs (- (square guess) x))
                           0.001))
                      (lambda (guess)
                        (average guess (/ x guess))))
   1.0))

; Fixed point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
                        (< (abs (- guess (f guess)))
                           tolerance))
                      (lambda (guess) (f guess)))
   first-guess))
