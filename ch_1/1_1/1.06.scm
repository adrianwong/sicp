(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; 'if' is a special form. It first evaluates the predicate,
; then evaluates the then-clause if the predicate evaluates to #t,
; OR it evaluates the else-clause if the predicate evaluates to #f

; 'new-if' is a procedure. It uses applicative-order evaluation,
; which first evaluates the operator and operands, then applies
; the resulting procedure to the resulting arguments. Therefore,
; ALL subexpressions are evaluated prior to procedure application.
; As the else-clause is a call to 'sqrt-iter', the 'new-if'
; procedure will infinitely recurse
