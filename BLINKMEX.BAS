' BLINKMEX.BAS
' PD 1988 by Marco da Venezia
' Esempi di lampeggio del testo in modalita' grafica

SCREEN 12 ' VGA 640x480

GOSUB 1 ' metodo 1
GOSUB 2 '   ''   2
GOSUB 3 '   ''   3
GOSUB 4 '   ''   4

END

1 ' Lampeggio con sleep, due colori impostabili (eg. giallo e bianco)
mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
DO
   IF c = 7 THEN c = 14 ELSE c = 7 ' 14 giallo e 7 bianco
   COLOR c: LOCATE row, col: PRINT mex$;
   SLEEP (1) ' pausa di un secondo
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN ' nei programmi: then RUN o EXIT SUB ecc.
LOOP

2 ' Lampeggio con timer, due colori impostabili (eg. giallo e nero)
mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
sec! = .3 ' imposta ritardo di 3/10 di secondo
c = 0
DO
   IF c = 0 THEN c = 14 ELSE c = 0 ' 14 giallo e 0 nero
   COLOR c: LOCATE row, col: PRINT mex$;
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN
LOOP

3 ' Lampeggio con timer e palette (eg. bianco e nero)
mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
sec! = .3
COLOR 8: LOCATE row, col: PRINT mex$ ' colore 8 non usato per altri pixel
DO
   PALETTE 8, 32 + 256 * 32 + 65536 * 32 ' RGB, accende il colore 8 come bianco in 32 ad intensita' media
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   PALETTE 8, 0 ' spegne il colore 8
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN
LOOP

4 ' Lampeggio con timer e palette casuali
mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
sec! = .5
COLOR 8: LOCATE row, col: PRINT mex$
RANDOMIZE TIMER
DO
   r = INT((63 * RND) + 1)
   g = INT((63 * RND) + 1)
   b = INT((63 * RND) + 1)
   PALETTE 8, r + 256 * g + 65536 * b
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   PALETTE 8, 0
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN
LOOP

