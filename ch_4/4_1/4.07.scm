(define (let*? exp) (tagged-list? exp 'let*))
(define (let*-inits exp) (cadr exp))
(define (let*-body exp) (caddr exp))

(define (let*->nested-lets exp)
  (define (nest-lets inits)
    (if (null? inits)
        (let*-body exp)
        (list 'let (list (car inits)) (nest-lets (cdr inits)))))
  (nest-lets (let*-inits exp)))

; Sufficient to add clause to `eval`
((let*? exp) (eval (let*->nested-lets exp) env))

; Test
(let*->nested-lets '(let* ((x 3) (y (+ x 2)) (z (+ x y 5)))
                      (* x z)))

(let ((x 3))
  (let ((y (+ x 2)))
    (let ((z (+ x y 5)))
      (* x z))))
