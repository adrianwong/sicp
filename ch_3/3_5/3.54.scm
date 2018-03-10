(define (mul-streams s1 s2) (stream-map * s1 s2))

(define ones (cons-stream 1 ones))

(define integers
  (cons-stream 1 (add-streams ones integers)))

(define factorials
  (cons-stream 1 (mul-streams integers factorials)))

(stream-ref factorials 0) ; 1
(stream-ref factorials 1) ; 1
(stream-ref factorials 2) ; 2
(stream-ref factorials 3) ; 6
(stream-ref factorials 4) ; 24
(stream-ref factorials 5) ; 120

;   1 2 3  4   5  ...  =  integers
;   1 1 2  6  24  ...  =  factorials
; 1 1 2 6 24 120  ...  =  factorials

; First element is 1; second element is 1 multiplied by the
; first element of `factorials`, or 1; third element is 2
; multiplied by the second element of `factorials, or 1; fourth
; element is 3 multiplied by the third element of factorials, or 2
