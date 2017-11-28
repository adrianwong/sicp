(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


; Normal order
(gcd 206 40)
(gcd 40 (remainder 206 40))
; 1 operation
(if (remainder 206 40) 0)
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; 2 operations
(if (remainder 40 (remainder 206 40)) 0)
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; 4 operations
(if (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; 7 operations
(if (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
(if (= 0 0))
; Reduction phase, where 'a' is evaluated: 4 operations
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
...
2
; The remainder operation is performed 1 + 2 + 4 + 7 + 4 = 18 times


; Applicative order
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
; The remainder operation is performed 4 times
