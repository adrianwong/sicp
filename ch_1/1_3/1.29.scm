(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube n) (* n n n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (exact->inexact (/ (- b a) n)))
  (define (y k) (f (+ a (* k h))))
  (define (term k)
    (* (cond ((or (= k n) (= k 0)) 1)
             ((odd? k) 4)
             (else 2))
       (y k)))
  (define (next k) (+ k 1))
  (* (/ h 3) (sum term 0 next n)))

(integral cube 0 1 0.01)  ; 0.24998750000000042
(integral cube 0 1 0.001) ; 0.249999875000001

(simpson cube 0 1 100)    ; 0.24999999999999992
(simpson cube 0 1 1000)   ; 0.2500000000000003
