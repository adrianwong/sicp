(define (scan-frame var env handle-var-not-found handle-var-found)
  (define (scan vars vals)
    (cond ((null? vars) (handle-var-not-found env))
          ((eq? var (car vars)) (handle-var-found vals))
          (else (scan (cdr vars) (cdr vals)))))
  (let ((frame (first-frame env)))
    (scan (frame-variables frame) (frame-values frame))))

(define (lookup-variable-value var env)
  (define (handle-var-not-found env)
    (lookup-variable-value var (enclosing-environment env)))
  (if (eq? env the-empty-environment)
      (error "Unbound variable" var)
      (scan-frame var env handle-var-not-found car)))

(define (set-variable-value! var val env)
  (define (handle-var-not-found env)
    (lookup-variable-value var (enclosing-environment env)))
  (if (eq? env the-empty-environment)
      (error "Unbound variable: SET!" var)
      (scan-frame var env handle-var-not-found
                  (lambda (vals) (set-car! vals val)))))

(define (define-variable! var val env)
  (define (handle-var-not-found env)
    (add-binding-to-frame! var val (first-frame env)))
  (scan-frame var env handle-var-not-found
              (lambda (vals) (set-car! vals val))))
