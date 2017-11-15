(fold-right / 1 (list 1 2 3)) ; 1 1/2
(fold-left / 1 (list 1 2 3)) ; 1/6
(fold-right list nil (list 1 2 3)) ; (1 (2 (3 ())))
(fold-left list nil (list 1 2 3)) ; (((() 1) 2) 3)

; The operations need to be commutative for `fold-right` and
; `fold-left` to produce the same values for any sequence
