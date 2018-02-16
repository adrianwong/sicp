(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item)
  (set-car! queue item))
(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else (set-front-ptr! queue (cdr (front-ptr queue)))
              queue)))

(define (print-queue queue)
  (display (front-ptr queue))
  (newline))

(define q1 (make-queue))

; `front-ptr` points to the only pair '(a)
; `rear-ptr` points to the only pair '(a)
(insert-queue! q1 'a)
(print-queue q1)

; `front-ptr` points to the start of the queue '(a b)
; `rear-ptr` points to the last pair in the queue '(b)
(insert-queue! q1 'b)
(print-queue q1)

; `front-ptr` points to the `cdr` of the queue '(a b), i.e. '(b)
; `rear-ptr` points to the last pair in the queue '(b)
(delete-queue! q1)
(print-queue q1)

; `front-ptr` points to the `cddr` of the queue '(a b), i.e. '()
; `rear-ptr` points to the last pair in the queue '(b)
(delete-queue! q1)
(print-queue q1)
