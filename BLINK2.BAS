' BLINK2.BAS
' by Marco da Venezia, 1988
' Alterna un messaggio con i caratteri sottostanti (per sfondo nero)

DECLARE SUB Messaggio (mex$, riga, daColonna, aColonna, colore)
DECLARE SUB Riempimento ()

Riempimento ' Riempie il display

mex$ = "Premi un tasto per continuare" ' messaggio d'esempio
riga = 12 ' numero di riga per mex$
daColonna = 40 - LEN(mex$) \ 2 ' colonna iniziale per mex$
aColonna = daColonna + LEN(mex$) ' colonna finale per mex$
colore = 14 ' colore per mex$

Messaggio mex$, riga, daColonna, aColonna, colore

SUB Messaggio (mex$, riga, daColonna, aColonna, colore)
    
    DIM colori(daColonna TO aColonna)
    FOR i = daColonna TO aColonna
        c$ = c$ + CHR$(SCREEN(riga, i)) ' memorizza i caratteri in riga
        colori(i) = SCREEN(riga, i, 1)  ' ed i loro colori
    NEXT
    DO
        ' alterna i caratteri memorizzati in c$ e mex$
        IF c = colore THEN
            s$ = c$
            FOR i = daColonna TO aColonna
                c = colori(i)
                COLOR c, 0
                LOCATE riga, i: PRINT MID$(s$, i - daColonna + 1, 1);
            NEXT
        ELSE
            s$ = mex$
            c = colore
            COLOR c, 0
            LOCATE riga, daColonna, 0: PRINT s$;
        END IF
        t = TIMER: WHILE TIMER - t < .5: WEND
    LOOP WHILE INKEY$ = ""
END SUB

SUB Riempimento

    ' Riempie lo schermo con caratteri in testo a colori e sfondo nero
    FOR r = 1 TO 25
        FOR c = 1 TO 80
            colore = INT(14 * RND) + 1
            a$ = CHR$(INT((255 - 32) * RND) + 32)
            COLOR colore, 0: LOCATE r, c: PRINT a$;
        NEXT
    NEXT
END SUB

