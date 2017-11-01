(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (num-divs n d)
  (define (div n count)
    (if (= (remainder n d) 0)
        (div (/ n d) (+ count 1))
        count))
  (div n 0))

(define (car z)
  (num-divs z 2))

(define (cdr z)
  (num-divs z 3))
