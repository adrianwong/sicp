(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

(define int-pairs (pairs integers integers)) ; Infinitely recurses

; No, Louis' solution won't work. Recall that `(cons-stream a b)` is a
; special form equivalent to `(cons a (delay b))`, i.e. its second argument
; is wrapped in a "delayed object", to be evaluated when required.

; Louis' version lacks the call to `cons-stream`, which means that
; `interleave` is evaluated, which means that the recursive call
; to `pairs` is evaluated, resulting in the procedure recursing infinitely
