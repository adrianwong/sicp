; Ex 1.31a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; Factorial
(define (identity n) n)
(define (inc n) (+ n 1))
(define (factorial n)
  (product identity 1 inc n))

; Pi
(define (pi-approx n)
  (define (term n)
    (if (odd? n)
        (/ (+ n 1.0) (+ n 2.0))
        (/ (+ n 2.0) (+ n 1.0))))
  (* 4 (product term 1 inc n)))

; Ex 1.31b
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
