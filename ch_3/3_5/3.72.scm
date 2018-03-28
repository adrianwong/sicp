(define (stream-caddr stream)
  (stream-car (stream-cddr stream)))

(define (stream-cdddr stream)
  (stream-cdr (stream-cddr stream)))

(define (sum-square pair)
  (+ (square (car pair))
     (square (cadr pair))))

(define three-square-pairs
  (letrec ((weighted-stream
            (lambda (x)
              (if (= (sum-square (stream-car x))
                     (sum-square (stream-cadr x))
                     (sum-square (stream-caddr x)))
                  (cons-stream
                   (list (stream-car x)
                         (stream-cadr x)
                         (stream-caddr x)
                         (sum-square (stream-car x)))
                   (weighted-stream (stream-cdddr x)))
                  (weighted-stream (stream-cdr x))))))
    (weighted-stream (weighted-pairs integers integers sum-square))))

(display-istream-range three-square-pairs 0 5)
; ((1 18) (6 17) (10 15) 325)
; ((5 20) (8 19) (13 16) 425)
; ((5 25) (11 23) (17 19) 650)
; ((7 26) (10 25) (14 23) 725)
; ((2 29) (13 26) (19 22) 845)
; ((3 29) (11 27) (15 25) 850)
; 'done
