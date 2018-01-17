(define (apply-generic op . args)
  (define (coerce-args type args)
    (map (lambda (x)
           (let ((t1->t2 (get-coercion (type-tag x) type)))
             (if t1->t2 (t1->t2 x) x)))
         args))
  (define (apply-coerced types)
    (if (null? types)
        (error "No method for these types")
        (let ((coerced-args (coerce-args (car types) args)))
          (let ((proc (get op (map type-tag coerced-args))))
            (if proc
                (apply proc (map contents coerced-args))
                (apply-coerced (cdr types)))))))
  (let ((type-tags (map type-tag args)))
    (apply-coerced type-tags)))

; Install the scheme-number, rectangular and complex packages

(add (make-scheme-number 2) (make-scheme-number 4))
; '(scheme-number . 6)
(add (make-scheme-number 1) (make-complex-from-real-imag 2 7))
; '(complex rectangular 3 . 7)
