(define zero-crossings
  (stream-map sign-change-detector
              sense-data
              (stream-cdr sense-data)))
