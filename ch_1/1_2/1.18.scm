(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (fast-mult-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (fast-mult-iter (double a) (halve b) n))
        (else (fast-mult-iter a (- b 1) (+ a n)))))

(define (* a b)
  (fast-mult-iter a b 0))
