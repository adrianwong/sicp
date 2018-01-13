; (a), (b), (c)
(define (make-div-file div f) (cons div f))
(define (division f) (car f))
(define (file f) (cdr f))

(define (apply-generic op f name)
  (let ((proc (get (division f) op)))
    (if proc
        (proc name (file f))
        (error "No method for these types: APPLY-GENERIC"))))

(define (get-record f name) (apply-generic 'get-record f name))
(define (get-salary f name) (apply-generic 'get-salary f name))

(define (find-employee-record f name)
  (if (null? f)
      '()
      (let ((record (get-record (car f) name))
            (next-file (find-employee-record (cdr f) name)))
        (if (null? record)
            next-file
            (cons record next-file)))))

(define (install-div1-package)
  (define (record name f)
    (cond ((null? f) '())
          ((equal? (car (car f)) name) (car f))
          (else (record name (cdr f)))))
  (define (salary name f)
    (cond ((null? f) '())
          ((equal? (car (car f)) name) (cadr (car f)))
          (else (salary name (cdr f)))))
  (put 'div1 'get-record record)
  (put 'div1 'get-salary salary))

(define (install-div2-package)
  (define (record name f)
    (cond ((null? f) '())
          ((equal? (car (car f)) name) (car f))
          (else (record name (cdr f)))))
  (define (salary name f)
    (cond ((null? f) '())
          ((equal? (car (car f)) name) (caadr (car f)))
          (else (salary name (cdr f)))))
  (put 'div2 'get-record record)
  (put 'div2 'get-salary salary))
  
(define div1-file (make-div-file 'div1 '((john 1000) (anna 2000))))
(define div2-file (make-div-file 'div2 '((bob (4000)) (mia (3000)))))

(install-div1-package)
(install-div2-package)

(get-record div1-file 'anna) ; (anna 2000)
(get-record div2-file 'mia) ; (mia (3000))

(get-salary div1-file 'anna) ; 2000
(get-salary div2-file 'mia) ; 3000

(find-employee-record (list div1-file div2-file) 'anna) ; (anna 2000)
(find-employee-record (list div1-file div2-file) 'mia) ; (mia (3000))

; (d)
; Install a new package, providing the appropriate procedures
; to retrieve the record and salary of a specified employee
