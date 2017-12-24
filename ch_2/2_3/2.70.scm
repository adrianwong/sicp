(define rock-tree
  (generate-huffman-tree '((A 2) (BOOM 1) (GET 2) (JOB 2)
                                 (SHA 3) (NA 16) (WAH 1) (YIP 9))))

(display (encode '(GET A JOB
                       SHA NA NA NA NA NA NA NA NA
                       GET A JOB
                       SHA NA NA NA NA NA NA NA NA
                       WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                       SHA BOOM)
                 rock-tree))
; '(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1
;   1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1
;   0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

; 3 bits / symbol for fixed-length encoding. 3 * 36 = 108 bits
