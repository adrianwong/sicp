(define (stream-cadr stream)
  (stream-car (stream-cdr stream)))

(define (stream-cddr stream)
  (stream-cdr (stream-cdr stream)))

(define (cube n) (* n n n))

(define (sum-cube pair)
  (+ (cube (car pair))
     (cube (cadr pair))))

(define ramanujan-pairs
  (letrec ((weighted-stream
            (lambda (x)
              (if (= (sum-cube (stream-car x))
                     (sum-cube (stream-cadr x)))
                  (cons-stream
                   (list (stream-car x)
                         (stream-cadr x)
                         (sum-cube (stream-car x)))
                   (weighted-stream (stream-cddr x)))
                  (weighted-stream (stream-cdr x))))))
    (weighted-stream (weighted-pairs integers integers sum-cube))))

(display-istream-range ramanujan-pairs 0 5)
; ((1 12) (9 10) 1729)
; ((2 16) (9 15) 4104)
; ((2 24) (18 20) 13832)
; ((10 27) (19 24) 20683)
; ((4 32) (18 30) 32832)
; ((2 34) (15 33) 39312)
; 'done
