; a'  = bq + a(q + p)   --- (1)
; b'  = bp + aq         --- (2)
; a'' = b'q + a'(q + p) --- (3)
; b'' = b'p + a'q       --- (4)

; Substituting (1) and (2) into (4)
; b'' = (bp + aq)p + (bq + aq + ap)q
;     = b(p^2) + b(q^2) + 2apq + a(q^2)
;     = b(p^2 + q^2) + a(2pq + q^2)

; Substituting (1) and (2) into (3)
; a'' = (bp + aq)q + (bq + aq + ap)(q + p)
;     = 2bpq + b(q^2) + 2apq + 2a(q^2) + a(p^2)
;     = b(2pq + q^2) + a((2pq + q^2) + (p^2 + q^2))

; Therefore, p <- p^2 + q^2
;            q <- 2pq + q^2

(define (square n)
  (* n n))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; Test
(equal? (fib 0) 0)
(equal? (fib 1) 1)
(equal? (fib 2) 1)
(equal? (fib 3) 2)
(equal? (fib 4) 3)
(equal? (fib 5) 5)
(equal? (fib 6) 8)
(equal? (fib 7) 13)
(equal? (fib 8) 21)
(equal? (fib 9) 34)
