(define random-init 0)

(define (rand-update x) (+ x 1))

(define rand
  (let ((x random-init))
    (lambda (symbol)
      (cond ((eq? symbol 'generate)
             (set! x (rand-update x))
             x)
            ((eq? symbol 'reset)
             (lambda (new-value)
               (set! x new-value)
               x))
            (else (error "Unknown request: RAND"
                         symbol))))))

(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 42)
(rand 'generate)
(rand 'generate)
(rand 'generate)
