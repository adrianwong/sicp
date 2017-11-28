; Using some arbitrarily small number x = 0.0001:

; iter | guess         | abs(guess^2 - x)    | quot              | avg ((quot + guess)/2)
; 1    | 1             | 1 - 0.0001 = 0.9999 | 0.0001/1 = 0.0001 | ((0.0001 + 1)/2) = 0.50005
; 2    | 0.50005       | 0.2499500025        | 0.00019998        | 0.25012499
; 3    | 0.25012499    | 0.06246251062       | 0.00039980011     | 0.12526239505
; 4    | 0.12526239505 | 0.01559066761       | 0.00079832418     | 0.06303035961
; 5    | 0.06303035961 | 0.00387285604       | 0.00158653703     | 0.03230844832
; 6    | 0.03230844832 | 0.00094383583

; The tolerance value in the 'good-enough?' procedure is set to a fixed value of 0.001,
; which is significantly large when computing the square root of a small value.
; This can be observed in iteration #6 where the value of abs(guess^2 - 0.0001) < 0.001,
; resulting in the procedure returning with a result of 0.03230844832 instead of the expected 0.01.


; Using some arbitrarily large number x = 10000000000000:

; The question provides a hint: "arithmetic operations are almost always performed with
; limited precision", i.e. the system has insufficient precision to represent comparatively
; small differences between large numbers. If the 'improve' procedure is modified such
; that it outputs its result, it can be observed after 25 iterations or so that calling
; (improve 3162277.6601683795) continually returns the same value 3162277.6601683795.
; The squared value of this guess is not within 0.001 of the radicand, resulting in infinite
; recursion

(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) (* new-guess 0.001))) ; Replace fixed value with % of guess

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (let ((improved-guess (improve guess x)))
  (if (good-enough? guess improved-guess)
    guess
    (sqrt-iter improved-guess x))))

(define (sqrt x)
  (sqrt-iter 1.0 x))
