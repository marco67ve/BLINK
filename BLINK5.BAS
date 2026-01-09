' BLINK5.BAS
' PD 1988 by Marco da Venezia
' Esempi di lampeggio del testo in modalita' grafica
' per sfondo nero (non preserva i pixel sottostanti,
' vedi BLINK6.BAS per GET e PUT)

SCREEN 12 ' VGA 640x480

GOSUB 1 ' metodo 1
GOSUB 2 '   ''   2
GOSUB 3 '   ''   3
GOSUB 4 '   ''   4

END

1 ' Lampeggio con sleep, due colori impostabili (eg. rosso e verde)
mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
DO
   IF c = 10 THEN c = 12 ELSE c = 10
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
c = 0
COLOR 8: LOCATE row, col: PRINT mex$ ' colore 8 non usato per altri pixel
DO
   ' c accende/spegne il colore 8 come bianco in 32 ad intensita' media
   IF c = 0 THEN c = 32 + 256 * 32 + 65536 * 32 ELSE c = 0
   PALETTE 8, c
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN
LOOP

4 ' Lampeggio con timer e palette casuali
mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
sec! = .5
c = 0
COLOR 8: LOCATE row, col: PRINT mex$
RANDOMIZE TIMER
DO
   r = INT((63 * RND) + 1)
   g = INT((63 * RND) + 1)
   b = INT((63 * RND) + 1)
   IF c = 0 THEN c = r + 256 * g + 65536 * b ELSE c = 0
   PALETTE 8, c
   t! = TIMER: WHILE TIMER - t! < sec!: WEND
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN
LOOP

