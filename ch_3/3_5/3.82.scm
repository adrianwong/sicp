(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (square n) (* n n))

(define (P xc yc radius)
  (lambda (x y) (<= (+ (square (- x xc))
                       (square (- y yc)))
                    (square radius))))

; Cumulative successes
(define (monte-carlo experiment)
  (define monte-carlo-internal
    (cons-stream
     (if (experiment) 1 0)
     (stream-map (lambda (x) (if (experiment) (+ x 1) x))
                 monte-carlo-internal)))
  monte-carlo-internal)

(define (estimate-integral P x1 x2 y1 y2)
  (define (experiment)
    (let ((x (random-in-range (exact->inexact x1)
                              (exact->inexact x2)))
          (y (random-in-range (exact->inexact y1)
                              (exact->inexact y2))))
      (P x y)))
  (let ((area (* (- x2 x1) (- y2 y1))))
    (define area-stream
      (cons-stream area area-stream))
    (cons-stream
     area
     (mul-streams area-stream (div-streams (monte-carlo experiment) integers)))))

(exact->inexact (/ (stream-ref (estimate-integral (P 5 7 3) 2 8 4 10) 100)
                   (square 3)))
; 3.08

(exact->inexact (/ (stream-ref (estimate-integral (P 5 7 3) 2 8 4 10) 1000000)
                   (square 3)))
; 3.142016
