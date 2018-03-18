(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(display-istream-range (expand 1 7 10) 0 10)
; 1 4 2 8 5 7 1 4 2 8 5 'done

(display-istream-range (expand 3 8 10) 0 10)
; 3 7 5 0 0 0 0 0 0 0 0 'done

; Numbers in the stream are the numbers generated
; by dividing `num` by `den` in base `radix`
