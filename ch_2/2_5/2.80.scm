(define (=zero? x) (apply-generic '=zero? x))

(define (install-scheme-number-package)
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0))))

(define (install-rational-package)
  (define (=zero-rat? x)
    (= (numer x) 0))
  (put '=zero? '(rational)
       (lambda (x) (=zero-rat? x))))

(define (install-complex-package)
  (define (=zero-complex? x)
    (and (= (real-part x) 0)
         (= (imag-part x) 0)))
  (put '=zero? '(complex)
       (lambda (x) (=zero-complex? x))))
