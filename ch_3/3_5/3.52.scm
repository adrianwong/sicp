(define sum 0)
; sum: 0

(define (accum x) (set! sum (+ x sum)) sum)
; sum: 0

(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))
; sum: 1

(define y (stream-filter even? seq))
; sum: 6

(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))
; sum: 10

(stream-ref y 7)
; sum: 136
; stream-ref: 136

(display-stream z)
; sum: 210
; display-stream:
;   10
;   15
;   45
;   55
;   105
;   120
;   190
;   210

; Yes, these responses will differ if we do not memoise.
; No memoisation means values created previously will be recreated.
; Recreated values means we (re)map over these recreated values with `accum`,
; Remapping means the same value is re-added to `sum`
