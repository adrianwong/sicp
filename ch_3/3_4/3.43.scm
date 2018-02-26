; Compute the difference between `a2` and `a1` to be $10.
;
; Exchange the values of `a2` and `a3` (i.e. withdraw $10 from `a3`
; and deposit $10 into `a2`). `a2` is now $30; `a3` is now $20.
;
; Withdraw $10 from `a2` and deposit $10 into `a1`.
;
; Final balances: `a1` = $20; `a2` = $20; `a3` = $20.


; If we don't serialise transactions on individual accounts:
;
; Using the example above, we interleave the deposit and
; withdraw operations on `a2`, i.e.:
;
; withdraw: get balance ($20)
; deposit: get balance ($20)
; deposit: add $10 to balance ($20 + $10 = $30)
; withdraw: subtract $10 from balance ($20 - $10 = $10)
;
; Final balances: `a1` = $20; `a2` = $10; `a3` = $20.
