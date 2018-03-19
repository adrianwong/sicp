(define (div-series s1 s2)
  (if (= (stream-car s2) 0)
      (error "Denominator constant term cannot be 0: DIV-SERIES")
      (mul-series (invert-unit-series s2)
                  s1)))

(define tan-series
  (div-series sine-series cosine-series))

(display-istream-range tan-series 0 10)
; 0 1 0 1/3 0 2/15 0 17/315 0 62/2835 0 'done
