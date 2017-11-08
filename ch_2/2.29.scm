(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; (a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

; (b)
(define (is-mobile? structure)
  (pair? structure))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (is-mobile? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; (c)
(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (branch-balanced branch)
  (let ((structure (branch-structure branch)))
  (if (is-mobile? structure)
      (is-balanced? structure)
      #t)))

(define (is-balanced? mobile)
  (and (= (torque (left-branch mobile))
          (torque (right-branch mobile)))
       (branch-balanced (left-branch mobile))
       (branch-balanced (right-branch mobile))))

; (d)
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))
