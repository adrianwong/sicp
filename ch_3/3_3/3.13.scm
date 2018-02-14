; A circular list is created (the `make-cycle` procedure name is a
; dead giveaway). Instead of pointing to '(), the `cdr` of the `last-pair`
; of `'(a b c)` now points to the start of the list.

; Computing `(last-pair z)` results in the procedure recursing infinitely.
