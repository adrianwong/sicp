(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (or (null? symbol) (leaf? tree))
      '()
      (cond ((memq symbol (symbols (left-branch tree)))
             (cons 0 (encode-symbol symbol (left-branch tree))))
            ((memq symbol (symbols (right-branch tree)))
             (cons 1 (encode-symbol symbol (right-branch tree))))
            (else (error "bad symbol: ENCODE-SYMBOL" symbol)))))

(encode-symbol 'A sample-tree) ; 0
(encode-symbol 'B sample-tree) ; 10
(encode-symbol 'C sample-tree) ; 111
(encode-symbol 'D sample-tree) ; 110

; Should signal error
; (encode-symbol 'E sample-tree)

; Should be equal
(equal? (encode '(A D A B B C A) sample-tree)
        '(0 1 1 0 0 1 0 1 0 1 1 1 0))
