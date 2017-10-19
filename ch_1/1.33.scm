(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))

; Ex 1.33a
(define (divides? a b) (= (remainder b a) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n) (* n n))
(define (inc n) (+ n 1))

(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

; Ex 1.33b
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity n) n)

(define (product-rel-prime n)
  (define (rel-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 identity 1 inc (- n 1) rel-prime?))
