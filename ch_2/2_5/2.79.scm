(define (install-scheme-number-package)
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y))))

(define (install-rational-package)
  (define (equ-rat? x y)
    (and (= (numer x) (numer y))
         (= (denom x) (denom y))))
  (put 'equ? '(rational rational)
       (lambda (x y) (equ-rat? x y))))

(define (install-complex-package)
  (define (equ-complex? x y)
    (and (= (real-part x) (real-part y))
         (= (imag-part x) (imag-part y))))
  (put 'equ? '(complex complex)
       (lambda (x y) (equ-complex? x y))))

; Note: the generic procedure `equ?` is a predicate and
; thus does not need a type tag
