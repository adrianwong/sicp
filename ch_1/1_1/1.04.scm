; The 'if' statement returns either a '+' or '-',
; which is then applied to the operands 'a' and 'b'

; If b >  0 : (a + b)
; If b <= 0 : (a - (-b)), which reduces to (a + b)

; Therefore : (a + |b|), i.e. the procedure returns
; the result of a plus the absolute value of b
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
