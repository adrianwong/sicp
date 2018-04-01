(define (sign-change-detector x y)
  (cond ((and (< x 0) (>= y 0)) 1)
        ((and (>= x 0) (< y 0)) -1)
        (else 0)))

(define (smooth input-stream)
  (stream-map average
              input-stream
              (stream-cdr input-stream)))

(define (zero-crossings sense-data)
  (stream-map sign-change-detector
              sense-data
              (stream-cdr sense-data)))

(define (smoothed-zero-crossings input-stream)
  (zero-crossings (smooth input-stream)))

(display-istream-range sine-series 0 6)
; 0 1 0 -1/6 0 1/120 0 'done

(display-istream-range (smooth sine-series) 0 6)
; 0.5 0.5 -0.083 -0.083 0.0042 0.0042 -9.9e-05 'done

(display-istream-range (smoothed-zero-crossings sine-series) 0 5)
; 0 -1 0 1 0 -1 'done
