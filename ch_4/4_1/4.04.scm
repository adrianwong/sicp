(define (eval-and exps env)
  (if (true? (eval (first-exp exps) env))
      (eval-and (rest-exps exps) env)
      false))

(define (eval-or exps env)
  (if (true? (eval (first-exp exps) env))
      true
      (eval-or (rest-exps exps) env)))

(define (and? exp) (tagged-list? exp 'and))
(define (or? exp) (tagged-list? exp 'or))

(put 'op 'and eval-and)
(put 'op 'or eval-or)
