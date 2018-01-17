; (install-scheme-number-package)
(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (= x y)))

; (install-rational-package)
(define (equ-rat? x y)
  (and (= (numer x) (numer y))
       (= (denom x) (denom y))))
(put 'equ? '(rational rational)
     (lambda (x y) (equ-rat? x y)))
(define (project x)
  (make-scheme-number (numer x)))
(put 'project 'rational project)

; (install-real-package)
(put 'equ? '(real real)
     (lambda (x y) (= x y)))
(define (project x)
  (make-rational (numerator x) (denominator x)))
(put 'project 'real project)

; (install-complex-package)
(define (equ-complex? x y)
  (and (= (real-part x) (real-part y))
       (= (imag-part x) (imag-part y))))
(put 'equ? '(complex complex)
     (lambda (x y) (equ-complex? x y)))
(define (project x)
  (make-real (real-part x)))
(put 'project 'complex project)

(define (project x)
  (let ((do-project (get 'project (type-tag x))))
    (if do-project
        (do-project (contents x))
        #f)))

(define (raise x)
  (let ((do-raise (get 'raise (type-tag x))))
    (if do-raise
        (do-raise (contents x))
        #f)))

(define (equ? x y)
  (let ((type-tags (list (type-tag x) (type-tag y))))
    (let ((do-equ? (get 'equ? type-tags)))
      (if do-equ?
          (do-equ? (contents x) (contents y))
          #f))))

(define (drop x)
  (let ((projected (project x)))
    (if projected
        (let ((re-raised (raise projected)))
          (if (equ? x re-raised)
              (drop projected)
              x))
        x)))

; Tests
(drop (make-complex-from-real-imag 1 0))
; '(scheme-number . 1.0)
(drop (make-complex-from-real-imag 1.5 0))
; '(rational 3.0 . 2.0)
; Opted to allow conversion of a real number to fractions, hence
; why this drops one more level to 'rational, and not to 'real

(define (apply-generic op . args)
  (define (coerce-to-type type arg)
    (let ((lvl1 (get 'level type))
          (lvl2 (get 'level (type-tag arg))))
      (if (< lvl2 lvl1)
          (coerce-to-type type ((get 'raise (type-tag arg))
                                (contents arg)))
          arg)))
  (define (coerce-args type args)
    (map (lambda (x) (coerce-to-type type x)) args))
  (define (apply-coerced types)
    (if (null? types)
        (error "No method for these types")
        (let ((coerced-args (coerce-args (car types) args)))
          (let ((proc (get op (map type-tag coerced-args))))
            (if proc
                (apply proc (map contents coerced-args))
                (apply-coerced (cdr types)))))))
  (let ((type-tags (map type-tag args)))
    (let ((result (apply-coerced type-tags)))
      ; Have to perform this check, as `apply-generic` is also used to
      ; provide generic selectors for the rectangular and polar packages
      ; which return numbers, and therefore cannot be "dropped"
      (if (pair? result)
          (drop result)
          result))))

(add (make-scheme-number 1) (make-complex-from-real-imag 2 7))
; '(complex rectangular 3.0 . 7)
(add (make-real 1.5) (make-complex-from-real-imag 2 0))
; '(rational 7.0 . 2.0)
(sub (make-complex-from-real-imag 7 4) (make-complex-from-real-imag 2 4))
; '(scheme-number . 5.0)
