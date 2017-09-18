(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) (* new-guess 0.001)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) 
        (* 2 guess))
     3))

(define (cube-root-iter guess x)
  (let ((improved-guess (improve guess x)))
  (if (good-enough? guess improved-guess)
    guess
    (cube-root-iter improved-guess x))))

(define (cube-root x)
  (cube-root-iter 1.0 x))
