; 11 and 100

; 110 is not possible. P2 can no longer change `x`
; from 10 -> 11 between the two times that P1 accesses
; the value of `x`, as P1 will not relinquish the
; mutex until it has finished evaluating `(* x x)`
