; Recursive
(define (fr n)
  (if (< n 3)
      n
      (+ (fr (- n 1))
         (+ (* 2 (fr (- n 2)))
            (* 3 (fr (- n 3)))))))

; Iterative
(define (fi n)
  (fi-iter 2 1 0 n))

(define (fi-iter a b c n)
  (if (= n 0)
      c
      (fi-iter (+ a (+ (* 2 b) (* 3 c)))
               a
               b
               (- n 1))))

; Check equality
(define (test n)
  (if (= n 0)
      (= (fr 0) (fi 0))
      (and (= (fr n) (fi n)) (test (- n 1)))))
