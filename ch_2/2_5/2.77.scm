(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
            "No method for these types: APPLY-GENERIC"
            (list op type-tags))))))

(define (magnitude z) (apply-generic 'magnitude z))

; When (magnitude z) is called, `apply-generic` attempts to look
; up the `'magnitude` operation for the `complex` type tag. An
; error is thrown because it does not exist.

; `apply-generic` is called twice, first to the `magnitude` of
; `complex`, second to the `magnitude` of `rectangular`.
