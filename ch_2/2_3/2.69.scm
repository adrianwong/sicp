(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (= (length leaf-set) 1)
      (car leaf-set)
      (successive-merge
       (adjoin-set (make-code-tree (car leaf-set)
                                   (cadr leaf-set))
                   (cddr leaf-set)))))

; Should be equal
(define gen-tree-1
  (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))

(equal? (encode '(A D A B B C A) sample-tree)
        (encode '(A D A B B C A) gen-tree-1))

; Should have eight bits
(define gen-tree-2
  (generate-huffman-tree '((A 3) (B 5) (C 6) (D 6))))

(= (length (encode '(A B C D) gen-tree-2)) 8)
