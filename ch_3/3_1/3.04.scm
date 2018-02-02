(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (calling-the-cops amount)
    "Calling the cops!")
  (let ((attempts 0))
    (define (dispatch p m)
      (if (eq? p password)
          (begin (set! attempts 0)
                 (cond ((eq? m 'withdraw) withdraw)
                       ((eq? m 'deposit) deposit)
                       (else (error "Unknown request: MAKE-ACCOUNT"
                                    m))))
          (begin (set! attempts (+ attempts 1))
                 (if (> attempts 7)
                     calling-the-cops
                     (lambda (amount) "Incorrect password")))))
    dispatch))

(define acc (make-account 100 'secret-password))
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 1
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 2
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 3
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 4
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 5
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 6
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 7
((acc 'secret-password 'deposit) 50)     ; 150
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 1
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 2
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 3
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 4
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 5
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 6
((acc 'some-other-password 'deposit) 50) ; "Incorrect password" 7
((acc 'some-other-password 'deposit) 50) ; "Calling the cops!"
