(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (cons (stream-car s) x))
                (stream-cdr (pairs t u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define int-triples (triples integers integers integers))

(define pythagorean-triples
  (stream-filter
   (lambda (triple) (= (+ (square (car triple))
                          (square (cadr triple)))
                       (square (caddr triple))))
   int-triples))

(display-istream-range pythagorean-triples 0 4)
; (3 4 5) (6 8 10) (5 12 13) (9 12 15) (8 15 17) 'done
