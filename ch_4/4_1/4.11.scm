(define (make-frame variables values)
  (cons 'frames (map cons variables values)))
(define (frame-bindings frame) (cdr frame))
(define (frame-variables frame) (map car (frame-bindings frame)))
(define (frame-values frame) (map cdr (frame-bindings frame)))
(define (add-binding-to-frame! var val frame)
  (set-cdr! frame (cons (cons var val) (frame-bindings frame))))

(define (set-variable-value! var val env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "Unbound variable: SET!" var)
        (let ((frame (first-frame env)))
          (let ((binding (assoc var (frame-pairs frame))))
            (if binding
                (set-cdr! binding val)
                (env-loop (enclosing-environment env)))))))
  (env-loop env))

; Test
(define env '((frames (a . 2)) (frames (b . 4) (c . 6))))
(set-variable-value! 'c 8 env)
; ((frames (a . 2)) (frames (b . 4) (c . 8)))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (let ((binding (assoc var (frame-pairs frame))))
      (if binding
          (set-cdr! binding val)
          (add-binding-to-frame! var val frame)))))

; Test
(define env '((frames (a . 2)) (frames (b . 4) (c . 6))))
(define-variable! 'd 8 env)
; ((frames (d . 8) (a . 2)) (frames (b . 4) (c . 6)))
(define-variable! 'a 10 env)
; ((frames (d . 8) (a . 10)) (frames (b . 4) (c . 6)))
