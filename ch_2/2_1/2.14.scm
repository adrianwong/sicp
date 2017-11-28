(define a (make-center-percent 100 1))
(define b (make-center-percent 200 2))

(par1 a b) ; (63.61967213114754, 69.84406779661016)
(par2 a b) ; (65.77627118644067, 67.55409836065574)

(center (div-interval a a))  ; 1.0002000200020003
(percent (div-interval a a)) ; 1.9998000199980077

(center (div-interval a b))  ; 0.5003001200480192
(percent (div-interval a b)) ; 2.9994001199760016
