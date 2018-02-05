(define f
  (let ((n 1))
    (lambda (x) (set! n (* n x)) n)))

; Left to right
(f 0) ; 0
(f 1) ; 0

; Right to left
(f 1) ; 1
(f 0) ; 0
