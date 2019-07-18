(define (named-let? exp) (and (let? exp) (symbol? (cadr exp))))
(define (named-let-name exp) (cadr exp))
(define (named-let-vars exp) (map car (caddr exp)))
(define (named-let-exps exp) (map cadr (caddr exp)))
(define (named-let-body exp) (cadddr exp))

(define (let->combination exp)
  (if (named-let? exp)
      (sequence->exp
       (list (list 'define
                   (cons (named-let-name exp)
                         (named-let-vars exp))
                   (named-let-body exp))
             (cons (named-let-name exp)
                   (named-let-exps exp))))
      (cons (make-lambda (let-vars exp)
                         (let-body exp))
            (let-exps exp))))

; Test
; (begin
;   (define (fib-iter a b count)
;     (if (= count 0)
;         b
;         (fib-iter (+ a b) a (- count 1))))
;   (fib-iter 1 0 n))
(let->combination
 '(let fib-iter ((a 1)
                 (b 0)
                 (count n))
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1)))))
