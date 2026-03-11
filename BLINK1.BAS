' BLINK1.BAS
' PD 1988 by Marco da Venezia
' Esempio di lampeggio del testo in modalita' testo
' con timer e due colori impostabili (eg. rosso e blu)
' Non preserva i caratteri sottostanti...
' per preservarli: BLINK2.BAS, BLINK3.BAS, BLINK4.BAS

mex$ = " * Esc: esci - Enter: riavvia * "
row = 15: col = 25
sec! = .5 ' imposta ritardo di 5/10 di secondo
c = 0
DO
   IF c = 12 + 16 THEN c = 9 + 16 ELSE c = 12 + 16
   COLOR c: LOCATE row, col: PRINT mex$;
   t! = TIMER: WHILE TIMER < t! + sec!: WEND
   k$ = INKEY$
   IF k$ = CHR$(27) THEN END
   IF k$ = CHR$(13) THEN RETURN
LOOP

