' BLINK3.BAS
' by Marco da Venezia, 1988
' Alterna un messaggio con i caratteri sottostanti (per sfondo colorato)

DECLARE SUB Messaggio (mex$, riga, daColonna, aColonna, coloreTesto, coloreSfondo)
DECLARE SUB Riempimento ()

Riempimento

mex$ = "Premi un tasto per continuare" ' messaggio d'esempio
riga = 12 ' esempio di numero di riga per mex$
daColonna = 40 - LEN(mex$) \ 2 ' colonna iniziale per mex$
aColonna = daColonna + LEN(mex$) ' colonna finale per mex$
coloreTesto = 14 ' esempio di colore per il testo di mex$
coloreSfondo = 1 ' esempio di colore per lo sfondo di mex$

Messaggio mex$, riga, daColonna, aColonna, coloreTesto, coloreSfondo

SUB Messaggio (mex$, riga, daColonna, aColonna, coloreTesto, coloreSfondo)
    DIM colori(daColonna TO aColonna)
    FOR i = daColonna TO aColonna
        c$ = c$ + CHR$(SCREEN(riga, i)) ' memorizza i caratteri in riga
        colori(i) = SCREEN(riga, i, 1)  ' e il loro colore
    NEXT
    DO
        ' alterna i caratteri memorizzati in c$ e mex$
        IF alt = 1 THEN
            alt = 0: s$ = c$
            FOR i = daColonna TO aColonna
                c = colori(i)
                c1 = (c AND 15) + (c \ 8 AND 16)
                c2 = (c \ 16) AND 7
                COLOR c1, c2
                LOCATE riga, i: PRINT MID$(s$, i - daColonna + 1, 1);
            NEXT
        ELSE
            alt = 1: s$ = mex$
            COLOR coloreTesto, coloreSfondo
            LOCATE riga, daColonna, 0: PRINT s$;
        END IF
        t = TIMER: WHILE TIMER - t < .5: WEND
    LOOP WHILE INKEY$ = ""
END SUB

SUB Riempimento
    ' Riempie lo schermo con caratteri in testo e sfondo a colori
    CLS
    FOR r = 1 TO 25
        FOR c = 1 TO 80
            coloreT = INT(14 * RND) + 1
            coloreS = INT(7 * RND)
            car$ = CHR$(INT((255 - 32) * RND) + 32)
            COLOR coloreT, coloreS: LOCATE r, c: PRINT car$;
        NEXT
    NEXT
END SUB

