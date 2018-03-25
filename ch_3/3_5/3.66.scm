(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define int-pairs (pairs integers integers))

(display-istream-range int-pairs 0 20)
; (1 1)
; (1 2)
; (2 2)
; (1 3)
; (2 3)
; (1 4)
; (3 3)
; (1 5)
; (2 4)
; (1 6)
; (3 4)
; (1 7)
; (2 5)
; (1 8)
; (4 4)
; (1 9)
; (2 6)
; (1 10)
; (3 5)
; (1 11)
; (2 7)
; 'done

; (1 1): 1
; (2 2): 3
; (3 3): 7
; (4 4): 15
; (i j): 2^i - 1, where j = i

; (2 2): 3
; (2 3): 5
; (2 4): 9
; (2 5): 13

; (3 3): 7
; (3 4): 11
; (3 5): 19
; (3 6): 27

; (4 4): 15
; (4 5): 23
; (4 6): 39
; (4 7): 55

; (2 2) -> (2 3): +2
; (3 3) -> (3 4): +4
; (4 4) -> (4 5): +8
; (i j): 2^i - 1 + 2^(i - 1), where j = i+1

; (2 3) -> (2 4): +4
; (2 4) -> (2 5): +4
; (3 4) -> (3 5): +8
; (3 5) -> (3 6): +8
; (4 5) -> (4 6): +16
; (4 6) -> (4 7): +16
; (i j): (j - i) * 2^i - 1 + 2^(i - 1), where j > i

; For # of preceding pairs, just subtract by 1
