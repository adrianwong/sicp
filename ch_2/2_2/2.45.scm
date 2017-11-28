#lang sicp
(#%require sicp-pict)

(define (split f g)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split f g) painter (- n 1))))
          (f painter (g smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 2))
(paint (up-split einstein 2))
