; When calling `serialized-exchange`, the serialisers on both
; accounts are acquired. When calling `deposit` and `withdraw`,
; the accounts attempt to acquire the serialisers again, and
; will continue waiting indefinitely as the serialisers will
; never be released. See: deadlock
