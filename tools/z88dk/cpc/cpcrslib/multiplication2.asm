
		ld   h, ancho_pantalla_bytes/2
        LD    L, 0
        LD    D, L 
        LD    B, 8

MULT:   ADD   HL, HL
        JR    NC, NOADD
        ADD   HL, DE
NOADD:  DJNZ  MULT	





;_______________________________________________________
;_______ 	SPECIFIC MULTIPLICATION	____________________
  ;lo cambio para la rutina de multiplicar 
    
	;;HL = e*ancho pantalla	; (h = ancho pantalla)
;ld l,e	
;ld h,0
;ld d,h
;add hl,hl	;2
;ld b,h
;ld c,l
;add hl,hl	;4

;add hl,hl	;8
;add hl,hl	;16
;add hl,hl	;32

;sbc hl,bc	;30		;y * ancho

;corrompe bc, de
;_______________________________________________________