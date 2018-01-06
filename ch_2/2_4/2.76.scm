; Generic operations with explicit dispatch:
; New type: existing operations need to be updated to
; handle new type
; New operation: no change to existing code

; Data-directed:
; New type: add a new column to the table of operations.
; No change to existing code
; New operation: add a new row to the table of operations.
; No change to existing code

; Message-passing:
; New type: no change to existing code
; New operation: existing types need to be updated to
; handle new operation

; Where new types are often added: message-passing, data-directed
; Where new operations are often added: generic, data-directed
