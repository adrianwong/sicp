(define segments-outline
  (list (make-segment (make-vect 0.0 0.0)
                      (make-vect 0.0 0.5))
        (make-segment (make-vect 0.0 0.5)
                      (make-vect 0.5 0.5))
        (make-segment (make-vect 0.5 0.5)
                      (make-vect 0.5 0.0))
        (make-segment (make-vect 0.5 0.0)
                      (make-vect 0.0 0.0))))

(define segments-x
  (list (make-segment (make-vect 0.0 0.0)
                      (make-vect 0.5 0.5))
        (make-segment (make-vect 0.5 0.0)
                      (make-vect 0.0 0.5))))

(define segments-diamond
  (list (make-segment (make-vect 0.0 0.25)
                      (make-vect 0.25 0.5))
        (make-segment (make-vect 0.25 0.5)
                      (make-vect 0.5 0.25))
        (make-segment (make-vect 0.5 0.25)
                      (make-vect 0.25 0.0))
        (make-segment (make-vect 0.25 0.0)
                      (make-vect 0.0 0.25))))

(paint (segments->painter segments-outline))
(paint (segments->painter segments-x))
(paint (segments->painter segments-diamond))
; (d) Ain't nobody got time for making that wave painter!
