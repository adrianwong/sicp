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

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)
