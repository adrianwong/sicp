(define (average x y) (/ (+ x y) 2.0))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0
     (stream-map (lambda (guess) (sqrt-improve guess x))
                 guesses)))
  guesses)

(define (stream-limit s tolerance)
  (let ((current (stream-ref s 0))
        (next (stream-ref s 1)))
    (if (< (abs (- current next))
           tolerance)
        next
        (stream-limit (stream-cdr s) tolerance))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 2 0.3)      ; 1.4166666666666665
(sqrt 2 0.003)    ; 1.4142156862745097
(sqrt 2 0.000003) ; 1.4142135623746899
