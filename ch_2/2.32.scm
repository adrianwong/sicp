(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; Using a smaller list (1 2):
(subsets (1 2))
  (subsets (2))
    (subsets ())
    (append () (2)) ; second element: cons 2 ()
  (append (() (2)) ((1) (1 2))) ; second list: cons 1 (), cons 1 (2)
(() (2) (1) (1 2))
