((A 1) (B 2) (C 4) (D 8) (E 16))

    . {A B C D E} 31
   / \
  /   \
E 16   . {A B C D} 15
      / \
     /   \
    D 8   . {A B C} 7
         / \
        /   \
      C 4    . {A B} 3
            / \
           /   \
         A 1   B 2

; 1 bit for most frequent symbol
; (n - 1) for least frequent symbol
