(define (and? exp) (tagged-list? exp 'and))
(define (and-exps exp) (cdr exp))

(define (or? exp) (tagged-list? exp 'or))
(define (or-exps exp) (cdr exp))

(define (first-exp exps) (car exps))
(define (rest-exps exps) (cdr exps))

(define (eval-and exps env)
  (if (null? exps)
      'true
      (if (true? (eval (first-exp exps) env))
          (eval-and (rest-exps exps) env)
          'false)))

(define (eval-or exps env)
  (if (null? exps)
      'false
      (if (true? (eval (first-exp exps) env))
          'true
          (eval-or (rest-exps exps) env))))

; Add to `eval`
((and? exp) (eval-and (and-exps exp) env))
((or? exp) (eval-or (or-exps exp) env))
