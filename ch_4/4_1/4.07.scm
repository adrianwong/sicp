(define (let*? exp) (tagged-list? exp 'let*))
(define (let*-lets exp) (cadr exp))
(define (let*-body exp) (caddr exp))

(define (let*->nested-lets exp)
  (define (nest-lets lets)
    (if (null? lets)
        (let*-body exp)
        (list 'let (list (car lets)) (nest-lets (cdr lets)))))
  (nest-lets (let*-lets exp)))

; Test
; (let ((x 3))
;   (let ((y (+ x 2)))
;     (let ((z (+ x y 5)))
;       (* x z))))
(let*->nested-lets '(let* ((x 3) (y (+ x 2)) (z (+ x y 5)))
                      (* x z)))

; Sufficient to add clause to `eval`
((let*? exp) (eval (let*->nested-lets exp) env))
