(define (pascal row col)
  (cond ((or (< col 1) (> col row)) 0) ; Error conditions
        ((or (= col 1) (= col row)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))
