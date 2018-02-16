(define (count-pairs x)
  (let ((visited '()))
    (define (count-pairs-internal x)
      (if (or (not (pair? x)) (memq x visited))
          0
          (begin
            (set! visited (cons x visited))
            (+ (count-pairs-internal (car x))
               (count-pairs-internal (cdr x))
               1))))
    (count-pairs-internal x)))

(define (has-cycle? x)
  (let ((visited '()))
    (define (has-cycle-iter x)
      (cond ((null? (cdr x)) #f)
            ((memq (cadr x) visited) #t)
            (else
             (set! visited (cons (car x) visited))
             (has-cycle-iter (cdr x)))))
    (has-cycle-iter x)))

(define x '(1 2 3))
(has-cycle? x) ; #f

(set-car! (cdr x) (cddr x))
(has-cycle? x) ; #f

(set-car! x (cdr x))
(has-cycle? x) ; #f

(set-cdr! (cddr x) x)
(has-cycle? x) ; #t

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle '(a b c)))
(has-cycle? z)        ; #t
(has-cycle? '(a b c)) ; #f
