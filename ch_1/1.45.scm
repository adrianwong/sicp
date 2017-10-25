(define (average x y) (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (log-b2 n)
  (/ (log n) (log 2)))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (inexact->exact (floor (log-b2 n))))
                (lambda (y) (/ x (expt y (- n 1)))))
                1.0))

; Root | Damps
;    2 |     1
;    3 |     1
;    4 |     2
;    5 |     2
;    6 |     2
;    7 |     2
;    8 |     3
;    9 |     3
;   10 |     3
;   11 |     3
;   12 |     3
;   13 |     3
;   14 |     3
;   15 |     3
;   16 |     4
