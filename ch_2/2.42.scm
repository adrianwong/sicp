(define (make-position row col)
  (list row col))

(define (position-row pos)
  (car pos))

(define (position-col pos)
  (cadr pos))

(define (adjoin-position new-row k rest-of-queens)
  (append (list (make-position new-row k)) rest-of-queens))

(define empty-board nil)

; My solution doesn't require the use of the argument `k`
(define (safe? positions)
  (let ((kth-queen-row (car (car positions)))
        (kth-queen-col (cadr (car positions)))
        (other-queens (cdr positions)))
    (define (attacks? o)
      (or (= kth-queen-row (position-row o))
          (= (abs (- kth-queen-row (position-row o)))
             (abs (- kth-queen-col (position-col o))))))
    (not (> (length (filter attacks? other-queens)) 0))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
