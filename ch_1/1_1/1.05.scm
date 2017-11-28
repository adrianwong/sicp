(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Normal-order evaluation:
(test 0 (p))
(if (= 0 0) 0 (p))
(if (#t) 0 (p))
0

; Applicative-order evaluation:
(test 0 (p)) ; Never terminates

; Note: The definition of (p) is invalid. It repeatedly calls itself,
; i.e. it is infinitely recursive

; Normal-order evaluation does not evaluate the operands
; until their values are needed. In this case, (p) is not
; evaluated because it is not needed, so the expression
; evaluates to 0

; Applicative-order evaluation first evaluates the operator and
; operands, then applies the resulting procedure to the resulting
; arguments. Hence, (p) is evaluated and proceeds to infinitely recurse
