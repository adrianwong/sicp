; x = [cX(1 - tX), cX(1 + tX)]
; y = [cY(1 - tY), cY(1 + tY)]

; z = [cZ(1 - tZ), cZ(1 + tZ)]
; z = x*y
; x*y = [cX*cY(1 - tX - tY + tX*tY), cX*cY(1 + tX + tY + tX*tY)]
; We can disregard tX*tY because the value will be very small. Therefore:
; x*y = [cX*cY(1 - tX - tY), cX*cY(1 + tX + tY)]
; x*y = [cX*cY(1 - (tX + tY)), cX*cY(1 + (tX + tY))]

; tZ = tX + tY
