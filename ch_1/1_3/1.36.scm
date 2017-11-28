(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display "Guess: ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (find x)
  (fixed-point (lambda (y) (/ (log x) (log y))) 5.0))

(define (average x y) (/ (+ x y) 2))

(define (find-with-damping x)
  (fixed-point (lambda (y) (average y (/ (log x) (log y)))) 5.0))

(find 1000) ; 28 iterations
(find-with-damping 1000) ; 8 iterations
