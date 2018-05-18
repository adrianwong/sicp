(define (let? exp) (tagged-list? exp 'let))
(define (let-vars exp) (map car (cadr exp)))
(define (let-exps exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))

(define (let->combination exp)
  (cons (make-lambda (let-vars exp)
                     (let-body exp))
        (let-exps exp)))

; Add to `eval`
((let? exp) (eval (let->combination exp) env))

; Test
(let->combination '(let ((x 3) (y 4) (z 5))
                     (* x y z)))

((lambda (x y z)
   (* x y z))
 3 4 5)
