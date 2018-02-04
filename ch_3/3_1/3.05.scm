; Install latest SICP package for `random`
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

(define (square n) (* n n))

(define (P xc yc radius)
  (lambda (x y) (<= (+ (square (- x xc))
                       (square (- y yc)))
                    (square radius))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (random-in-range (exact->inexact x1)
                              (exact->inexact x2)))
          (y (random-in-range (exact->inexact y1)
                              (exact->inexact y2))))
      (P x y)))
  (* (* (- x2 x1) (- y2 y1))
     (monte-carlo trials experiment)))

(exact->inexact (/ (estimate-integral (P 5 7 3) 2 8 4 10 1000000)
                   (square 3)))
; ~3.142
