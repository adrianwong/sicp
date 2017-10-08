(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
; Procedure (sine angle) is linearly recursive

(sine 12.15)
(p (sine 4.05))
...
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
; p is called 5 times

; The space and step complexities for this procedure are
; both O(log3 n). The input value is divided by 3 each
; time the procedure p is applied
