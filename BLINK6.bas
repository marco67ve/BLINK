' BLINK6.BAS
' PD 1988 by Marco da Venezia
' Lampeggio del testo in modalità grafica
' Preserva i pixel sottostanti

DECLARE SUB BlinkMessage (riga!, colonna!, testo$)

SCREEN 12 ' VGA 640x480

' Esempio di disegno
FOR i = 0 TO 150 STEP 10
	LINE (i + 160, i + 80)-(480 - i, 400 - i), i \ 10, B
	CIRCLE (320, 240), i, 16 - i \ 10
NEXT

BlinkMessage 10, 26, " Premi un tasto per terminare "

SCREEN 0
END

SUB BlinkMessage (riga, colonna, testo$)

	' Conversione riga/colonna pixel
	x = (colonna - 1) * 8
	y = (riga - 1) * 16

	' Dimensioni del testo
	L = LEN(testo$)
	W = 8 * L
	H = 16

	' Margini per font BIOS in SCREEN 12
	x0 = x - 0
	y0 = y - 0
	x1 = x + W + 0
	y1 = y + H + 0

	DIM area(1 TO (x1 - x0 + 1) * (y1 - y0 + 1) * 2) AS INTEGER

	GET (x0, y0)-(x1, y1), area

	DO
		IF stato = 0 THEN stato = 1 ELSE stato = 0
		t! = TIMER: WHILE TIMER < t! + .5: WEND
		k$ = INKEY$
		IF k$ <> "" THEN EXIT DO
		IF stato = 1 THEN
			LOCATE riga, colonna: PRINT testo$;
		ELSE
			PUT (x0, y0), area, PSET
		END IF
	LOOP

	PUT (x0, y0), area, PSET ' Ripristina definitivamente

END SUB
