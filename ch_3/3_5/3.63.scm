(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0
     (stream-map (lambda (guess) (sqrt-improve guess x))
                 guesses)))
  guesses)

(define (sqrt-stream x)
  (cons-stream
   1.0
   (stream-map (lambda (guess) (sqrt-improve guess x))
               (sqrt-stream x))))

; Each recursive call to `(sqrt-stream x)` produces a new, un-memoised
; stream, which results in redundant computation. If no memoisation
; were to be used, the two versions would have the same efficiency
