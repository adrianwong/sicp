(define (square n) (* n n))

(define (check-sq n m)
  (let ((rem-sq (remainder (square n) m)))
  (if (and (not (or (= n 1) (= n (- m 1))))
           (= rem-sq 1))
      0
      rem-sq)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (check-sq (expmod base (/ exp 2) m) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (report-expmod a n)
  (display a)
  (display " ")
  (display (= (expmod a n n) a))
  (newline))

(define (expmod-all a n)
  (if (= a n)
      #t
      (and (= (expmod a n n ) a)
           (expmod-all (+ a 1) n))))

(define (prime? n)
  (display n)
  (display "\t: ")
  (if (expmod-all 0 n)
      (display "PRIME!")
      (display "NOPE!"))
  (newline))

(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)
(prime? 6)
(prime? 7)
(prime? 8)
(prime? 9)
(prime? 10)
(prime? 11)
(prime? 13)
(prime? 17)
(prime? 19)

; Carmichael numbers
(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)
