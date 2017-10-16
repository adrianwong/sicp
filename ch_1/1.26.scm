; The dual call to `expmod` transforms a linear recursive
; process into a tree recursive process. This causes the
; number of recursive calls to `expmod` to grow exponentially

; New time complexity = O(log (2^n))
;                     = O(n (log 2))
;                     = O(n)
