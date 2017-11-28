(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; The squared value is pre-pended to `answer` on each
; iteration, not appended

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; Swapping the arguments produces a representation that is
; not a list. ((((nil, 1) 4) 9) 16), instead of (1 (4 (9 (16, nil))))
