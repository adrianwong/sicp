; Sum all squares, then subtract smallest squared value
(define (sum-square-largest-2-of-3 x y z)
  (- (+ (square x) (square y) (square z))
     (square (min x y z))))
  