; Add to (install-scheme-number-package)
(define (scheme-number->rational x)
  (make-rational x 1))
(put 'raise 'scheme-number scheme-number->rational)

; Add to (install-rational-package)
(define (rational->real x)
  (make-real (exact->inexact (/ (numer x) (denom x)))))
(put 'raise 'rational rational->real)

; Add to (install-real-package)
(define (real->complex x)
  (make-complex-from-real-imag x 0))
(put 'raise 'real real->complex)
