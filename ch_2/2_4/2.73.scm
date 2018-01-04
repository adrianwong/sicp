; (a)
; The procedures `number?` and `variable?` are simply predicates
; whose behaviours do not change depending on a type tag. There
; is therefore nothing to dispatch

; (b)
(define (install-derivative-package)
  ; Internal procedures
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (addend a) (car a))
  (define (augend a) (cadr a))
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (deriv-product exp var)
    (make-sum (make-product
               (multiplier exp)
               (deriv (multiplicand exp) var))
              (make-product
               (deriv (multiplier exp) var)
               (multiplicand exp))))
  ; Interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product))

; (c)
(define (base x) (car x))
(define (exponent x) (cadr x))
(define (make-exponentiation x y)
  (cond ((=number? y 0) 1)
        ((=number? y 1) x)
        (else (list '** x y))))
(define (deriv-exponentiation exp var)
  (make-product (exponent exp)
                (make-product
                 (make-exponentiation (base exp)
                                      (make-sum (exponent exp) -1))
                 (deriv (base exp) var))))
(put 'deriv '** deriv-exponentiation)

; (d)
; All that is required is to change the order of arguments to `put`
