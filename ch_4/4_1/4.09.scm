(define (until? exp) (tagged-list? exp 'until))
(define (until-cond exp) (cadr exp))
(define (until-body exp) (caddr exp))

(define (until->combination exp)
  (sequence->exp
   (list (list 'define
               (list 'until-iter)
               (make-if (until-cond exp)
                        'true
                        (sequence->exp
                         (list (until-body exp)
                               (list 'until-iter)))))
         (list 'until-iter))))

; Test
(until->combination '(until (true? 'the-end-of-the-world)
                            (display 'sleep)))

(begin
  (define (until-iter)
    (if (true? (quote the-end-of-the-world))
        true
        (begin (display (quote sleep))
               (until-iter))))
  (until-iter))
