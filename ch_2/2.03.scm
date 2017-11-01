(define (rect-perimeter r)
  (* (+ (rect-width r) (rect-height r)) 2))

(define (rect-area r)
  (* (rect-width r) (rect-height r)))

; 1st representation: one vertical segment, and width
(define (make-rect seg width) (cons seg width))

(define (rect-width r) (cdr r)) 

(define (rect-height r)
  (abs (- (y-point (start-segment (car r)))
          (y-point (end-segment (car r))))))

; 2nd representation: one point, width and height
(define (make-rect x w h)
  (cons x (cons w h)))

(define (rect-width r) (car (cdr r)))

(define (rect-height r) (cdr (cdr r)))
