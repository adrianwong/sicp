; Unchanged, O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; O(1)
(define (adjoin-set x set)
  (cons x set))

; O(n)
(define (union-set set1 set2)
  (append set1 set2))

(define (remove x lst)
  (cond ((null? lst) '())
        ((equal? x (car lst)) (cdr lst))
        (else (cons (car lst) (remove x (cdr lst))))))

; Handles duplicates
; For each element of `set1`, we call `element-of-set?`
; and `remove`, which are O(n) operations. O(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) (remove (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))
