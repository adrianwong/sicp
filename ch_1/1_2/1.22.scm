(define (square n) (* n n))
(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes x y)
  (timed-prime-test x)
  (if (< x y)
      (search-for-primes (+ x 2) y)))

; Note: tests were run from within the DrRacket IDE.
; Running these tests in the mit-scheme REPL yielded timings
; too small to be measurable. Larger input ranges required
; if running from the REPL
(search-for-primes 1001 9999)       ; Time:  3  3  4, Average:  3.3
(search-for-primes 10001 99999)     ; Time: 10 11  9, Average: 10.0
(search-for-primes 100001 999999)   ; Time: 30 29 29, Average: 29.3
(search-for-primes 1000001 9999999) ; Time: 91 90 90, Average: 90.3

; sqrt(10) is approximately 3.16
; Timing data supports the O(sqrt(n)) prediction
