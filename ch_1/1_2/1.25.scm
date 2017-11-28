(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; This version of `expmod` first computes the exponential value, THEN
; computes the remainder - this generates huge intermediary numbers,
; which are computationally expensive

; The original version keeps the numbers being squared less than the number
; being tested for primality, as it applies `remainder` to the result of every
; application of `square`

; The results generated are still correct, the execution time is just much
; slower
