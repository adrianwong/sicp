; (install-polynomial-package)
(define (=zero-poly? p)
  (define (=zero-term-list? tl)
    (and (=zero? (coeff (first-term tl)))
         (=zero-term-list? (rest-terms tl))))
  (=zero-term-list? (term-list p)))

(put '=zero? 'polynomial =zero-poly?)
