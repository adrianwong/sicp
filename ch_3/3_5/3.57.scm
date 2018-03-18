; With memoisation:
;   0 additions for n = 0
;   0 additions for n = 1
;   (n - 1) additions otherwise

; Without memoisation:
;    0 additions for n = 0
;    0 additions for n = 1
;    1 additions for n = 2
;    2 additions for n = 3
;    4 additions for n = 4
;    7 additions for n = 5
;   12 additions for n = 6
;   20 additions for n = 7
;   33 additions for n = 8
;   From n = 1, fib(n - 1) additional additions is required
;   on top of the previous n, which makes this exponential
