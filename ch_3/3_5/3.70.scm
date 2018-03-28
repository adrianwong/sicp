(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((> (weight s1car) (weight s2car))
                  (cons-stream
                   s2car
                   (merge-weighted s1 (stream-cdr s2) weight)))
                 ; Unlike `merge`, don't remove duplicates
                 (else
                  (cons-stream
                   s1car
                   (merge-weighted (stream-cdr s1) s2 weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

; (a)
(define weighted-int-pairs
  (weighted-pairs integers integers (lambda (x) (+ (car x) (cadr x)))))

(display-istream-range weighted-int-pairs 0 10)

; (b)
(define (divisible? x n) (= (remainder x n) 0))

(define not-div-235
  (stream-filter
   (lambda (x) (not (or (divisible? x 2)
                        (divisible? x 3)
                        (divisible? x 5))))
   integers))

(define weighted-not-div-235-pairs
  (weighted-pairs not-div-235
                  not-div-235
                  (lambda (x)
                    (+ (* 2 (car x))
                       (* 3 (cadr x))
                       (* 5 (car x) (cadr x))))))

(display-istream-range weighted-not-div-235-pairs 0 10)
; (1 1) (1 7) (1 11) (1 13) (1 17) (1 19) (1 23) (1 29) (1 31) (7 7) (1 37) 'done
