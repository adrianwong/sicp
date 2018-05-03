; https://stackoverflow.com/questions/15003518/confused-by-the-difference-between-let-and-let-in-scheme

(define (list-of-values-lr exps env)
  (if (no-operands? exps)
      '()
      (let* ((left (eval (first-operand exps) env))
             (right (list-of-values (rest-operands exps) env)))
        (cons left right))))

(define (list-of-values-rl exps env)
  (if (no-operands? exps)
      '()
      (let* ((left (list-of-values (rest-operands exps) env))
             (right (eval (first-operand exps) env)))
        (cons left right))))
