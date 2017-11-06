(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))

(define us-coins (list 1 5 10 25 50))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (first-denomination denominations)
  (car denominations))

(define (except-first-denomination denominations)
  (cdr denominations))

(define (no-more? denominations)
  (null? denominations))

(cc 100 us-coins)
(cc 100 uk-coins)

(cc 100 (reverse us-coins))
; Order of denominations does not affect the result
