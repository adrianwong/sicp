; Let int1 = [a, b] and int2 = [c, d]
; Therefore, width(int1) = (b - a)/2 and width(int2) = (d - c)/2

; add(int1, int2) = [a + c, b + d]
;
; width([a + c, b + d]) = ((b + d) - (a + c))/2
;                       = (b - a)/2 + (d - c)/2
;                       = width(int1) + width(int2)

; sub(int1, int2) = [a - d, b - c]
;
; width([a - d, b - c]) = ((b - c) - (a - d))/2
;                       = (b - a)/2 + (d - c)/2
;                       = width(int1) + width(int2)

(define a (make-interval 0 2))
(define b (make-interval 10 12))
(define c (make-interval 1 5))

(mul-interval a c)
(mul-interval b c)

; `a` and `b` have the same width, but when multiplied by `c`
; the two results have different widths. Width of the product
; is not a function of the width of the intervals
