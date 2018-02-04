(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (make-joint password)
    (dispatch password))
  (define (dispatch password)
    (lambda (p m)
      (if (eq? p password)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                ((eq? m 'make-joint) make-joint)
                (else (error "Unknown request: MAKE-ACCOUNT"
                             m)))
          (lambda (amount) "Incorrect password"))))
  (dispatch password))

(define (make-joint account password extra-password)
  ((account password 'make-joint) extra-password))

(define peter-acc (make-account 100 'open-sesame))
((peter-acc 'open-sesame 'withdraw) 15) ; 85

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))
((paul-acc 'rosebud 'withdraw) 15) ; 70

((peter-acc 'open-sesame 'withdraw) 15) ; 55
