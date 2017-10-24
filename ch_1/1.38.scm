(define (cont-frac n d k)
  (define (frac x)
    (if (= x k)
        (/ (n x) (d x))
        (/ (n x) (+ (d x) (frac (+ x 1))))))
  (frac 1))

; 2(i + 1)/3 if (i + 1) is divisible by 3
(define (d i)
  (cond ((= i 1) 1)
        ((not (= (remainder (+ i 1) 3) 0)) 1)
        (else (/ (* 2 (+ i 1)) 3))))

(+ (cont-frac (lambda (i) 1.0)
              d
              10)
   2)
