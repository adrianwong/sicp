; (a)
; If we call `exp` with two arguments of type `scheme-number`,
; Louis' coercion procedure does nothing - the procedure is
; never called. If we call `exp` with two arguments of type
; `complex`, the `apply-generic` procedure recurses infinitely

; (b)
; No, Louis is wrong. `apply-generic` works correctly as-is

; (c)
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags))
          (no-method (lambda () (error "No method for these types"
                                       (list op type-tags)))))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (equal? type1 type2)
                    (no-method)
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2
                             (apply-generic op (t1->t2 a1) a2))
                            (t2->t1
                             (apply-generic op a1 (t2->t1 a2)))
                            (else (no-method))))))
              (no-method))))))

(install-scheme-number-package)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))
(define (add x y) (apply-generic 'add x y))
(define (exp x y) (apply-generic 'exp x y)) ; Doesn't exist in (install-scheme-number-package)

(add (make-scheme-number 2) (make-scheme-number 4))
(exp (make-scheme-number 2) (make-scheme-number 4)) ; Should fail
