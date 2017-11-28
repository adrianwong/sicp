(define (f g) (g 2))

; Using the substitution model
(f f)
(f 2)
(2 2)

; The second invocation of `f` attempts to apply `2`, which
; is not a procedure, to `2`, resulting in an error

; MIT Scheme
; The object 2 is not applicable.

; Dr Racket
; application: not a procedure;
; expected a procedure that can be applied to arguments
; given: 2
; arguments...:
