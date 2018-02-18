(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (queue)
      (cons front-ptr rear-ptr))
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue" (queue))
          (car front-ptr)))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               (queue))
              (else
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)
               (queue)))))
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue" (queue)))
            (else (set-front-ptr! (cdr front-ptr))
                  (queue))))
    (define (print-queue)
      (display front-ptr)
      (newline))
    (define (dispatch m)
      (cond ((eq? m 'front-queue) front-queue)
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'print-queue) print-queue)
            (else (error "Unknown request: MAKE-QUEUE"
                         m))))
    dispatch))

(define q1 (make-queue))

((q1 'insert-queue!) 'a)
((q1 'print-queue))
((q1 'front-queue)) ; 'a

((q1 'insert-queue!) 'b)
((q1 'print-queue))
((q1 'front-queue)) ; 'a

((q1 'delete-queue!))
((q1 'print-queue))
((q1 'front-queue)) ; 'b

((q1 'delete-queue!))
((q1 'print-queue))
((q1 'front-queue)) ; Should throw an error, as queue is now empty
