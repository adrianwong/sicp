(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (stream-cdr s) (partial-sums s))))

(stream-ref (partial-sums integers) 0) ; 1
(stream-ref (partial-sums integers) 1) ; 3
(stream-ref (partial-sums integers) 2) ; 6
(stream-ref (partial-sums integers) 3) ; 10
(stream-ref (partial-sums integers) 4) ; 15
(stream-ref (partial-sums integers) 5) ; 21
