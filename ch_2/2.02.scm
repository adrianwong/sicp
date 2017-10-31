(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y) (cons x y))
(define (x-point pt) (car pt))
(define (y-point pt) (cdr pt))

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (average i j) (/ (+ i j) 2.0))
(define (midpoint-segment seg)
  (let ((i (start-segment seg))
        (j (end-segment seg)))
    (make-point (average (x-point i)
                         (x-point j))
                (average (y-point i)
                         (y-point j)))))

(print-point (midpoint-segment
              (make-segment
               (make-point 1 2)
               (make-point 3 4))))
