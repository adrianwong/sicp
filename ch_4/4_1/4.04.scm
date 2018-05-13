(define (eval-and exp env)
  (if (true? (eval (first-exp exp) env))
      (eval-and (rest-exps exp) env)
      false))

(define (eval-or exp env)
  (if (true? (eval (first-exp exp) env))
      true
      (eval-or (rest-exps exp) env)))

(define (and? exp) (tagged-list? exp 'and))
(define (or? exp) (tagged-list? exp 'or))

; Add to `eval`
((and? exp) (eval-and exp env))
((or? exp) (eval-or exp env))
