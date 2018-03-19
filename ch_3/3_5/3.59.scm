; (a)
(define (div-streams s1 s2) (stream-map / s1 s2))

(define (integrate-series s)
  (div-streams s integers))

(display-istream-range (integrate-series ones) 0 10)
; 1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9 1/10 1/11 'done

; (b)
(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

(define cosine-series
  (cons-stream 1 (integrate-series (scale-stream sine-series -1))))

(display-istream-range sine-series 0 10)
; 0 1 0 -1/6 0 1/120 0 -1/5040 0 1/362880 0 'done

(display-istream-range cosine-series 0 10)
; 1 0 -1/2 0 1/24 0 -1/720 0 1/40320 0 -1/3628800 'done
