(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

(define (list-of-values-lr exps env)
  (if (no-operands? exps)
      '()
      (let* ((left (eval (first-operand exps) env))
             (right (list-of-values-lr (rest-operands exps) env)))
        (cons left right))))

(define (list-of-values-rl exps env)
  (if (no-operands? exps)
      '()
      (let* ((left (list-of-values-rl (rest-operands exps) env))
             (right (eval (first-operand exps) env)))
        (cons right left))))

(define (eval exp env)
  (newline)
  (display "evaluating exp=")
  (display exp)
  exp)

(list-of-values-lr '(1 2 3) '())
; evaluating exp=1
; evaluating exp=2
; evaluating exp=3

(list-of-values-rl '(1 2 3) '())
; evaluating exp=3
; evaluating exp=2
; evaluating exp=1
