(#%require (only racket random))

(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
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
(search-for-primes 1001 9999)       ; Time:  5  5  5, Average:  5.0
(search-for-primes 10001 99999)     ; Time:  8  7  6, Average:  7.0
(search-for-primes 100001 999999)   ; Time:  9  8  9, Average:  8.7
(search-for-primes 1000001 9999999) ; Time: 11  9  8, Average:  9.3

; Comparing n = 1000 against n = 1000000 (i.e. twice the number of
; digits), the execution time is roughly twice as long, indicating
; logarithmic growth
