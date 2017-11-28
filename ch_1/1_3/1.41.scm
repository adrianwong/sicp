(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
(((double (lambda (x) (double (double x)))) inc) 5)
(((lambda (x) (double (double (double (double x))))) inc) 5)
((double (double (double (double inc)))) 5)
((double (double (double (lambda (x) (inc (inc x)))))) 5)
... ; Expands to 16 inc calls
21
