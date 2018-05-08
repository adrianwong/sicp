; (a)
; The flaw in Louis' plan is that his evaluator will treat definitions
; as procedure applications instead of treating them as a special form,
; i.e. it will attempt to call the procedure `define` on the arguments
; `x` and `3`

; (b)
(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))
