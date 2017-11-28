; Recursive solution
(define (cont-frac n d k)
  (define (frac x)
    (if (= x k)
        (/ (n x) (d x))
        (/ (n x) (+ (d x) (frac (+ x 1))))))
  (frac 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

; Iterative solution
(define (cont-frac-iter n d k)
  (define (frac x acc)
    (if (= x 0)
        acc
        (frac (- x 1) (/ (n k) (+ (d k) acc)))))
  (frac k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                10)
