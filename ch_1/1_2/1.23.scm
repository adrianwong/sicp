(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

; Note: tests were run from within the DrRacket IDE.
; Running these tests in the mit-scheme REPL yielded timings
; too small to be measurable. Larger input ranges required
; if running from the REPL
(search-for-primes 1001 9999)       ; Time:  3  2  2, Average:  2.3
(search-for-primes 10001 99999)     ; Time:  5  6  5, Average:  5.3
(search-for-primes 100001 999999)   ; Time: 17 16 16, Average: 16.3
(search-for-primes 1000001 9999999) ; Time: 47 46 45, Average: 46.0

; Halving the number of steps does appear to (roughly) double the
; execution speed
