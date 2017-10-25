(define (cont-frac n d k)
  (define (frac x)
    (if (= x k)
        (/ (n x) (d x))
        (/ (n x) (+ (d x) (frac (+ x 1))))))
  (frac 1))

(define (square n) (* n n))

(define (tan-cf x k)
  (define (n k) (if (= k 1) x (- (square x))))
  (define (d k) (- (* 2.0 k) 1))
  (cont-frac n d k))

(tan-cf 1 10)
(tan 1)
