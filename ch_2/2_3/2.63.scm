(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

(tree->list-1 '(7 (3 () ()) (9 () ())))
; (tl '(7 (3 () ()) (9 () ())))
; (append (tl '(3 () ())) (cons 7 (tl '(9 () ()))))
; (append (append '() (cons 3 '())) (cons 7 (append '() (cons 9 '()))))
; '(3 7 9)
; O(n)

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(tree->list-2 '(7 (3 () ()) (9 () ())))
; (tl '(7 (3 () ()) (9 () ())))
; (ctl '(3 () ()) (cons 7 (ctl '(9 () ()) '())))
; (ctl '() (cons 3 (ctl '() (cons 7 (ctl '(9 () ()) '())))))
; (ctl '() (cons 3 (ctl '() (cons 7 (ctl '() (cons 9 (ctl '() '())))))))
; (cons 3 (cons 7 (cons 9 '())))
; '(3 7 9)
; O(n)
