(define random-init 0)

(define (rand-update x) (+ x 1))

(define (handle-request req val)
  (cond ((eq? req 'generate) (rand-update val))
        ((and (pair? req) (eq? (car req) 'reset)) (cadr req))
        (else (error "Unknown request: HANDLE-REQUEST"))))

(define (random-numbers requests)
  (define random-numbers-int
    (cons-stream
     random-init
     (stream-map handle-request requests random-numbers-int)))
  random-numbers-int)

(define requests
  (cons-stream 'generate
               (cons-stream '(reset 42)
                            (cons-stream 'generate
                                         (cons-stream '(reset 10)
                                                      (cons-stream 'generate requests))))))

(display-istream-range (random-numbers requests) 0 10)
; 0 1 42 43 10 11 12 42 43 10 11 'done
