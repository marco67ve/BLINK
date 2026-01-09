' BLINK4.BAS
' by Marco da Venezia, 1988 - rev. Bishop 2025
' Alterna un messaggio con i caratteri sottostanti
' accedendo direttamente alla memoria video B800h (modo testo VGA 80x25)

DEFINT A-Z

DECLARE SUB Messaggio (mex$, riga, daCol, coloreTesto, coloreSfondo)
DECLARE SUB Riempimento ()

DEF SEG = &HB800

Riempimento

mex$ = "Premi un tasto per continuare"
riga = 12
daCol = 40 - LEN(mex$) \ 2
coloreTesto = 14
coloreSfondo = 1

Messaggio mex$, riga, daCol, coloreTesto, coloreSfondo

DEF SEG
END

'---------------------------------------------------------------------------
' Nota tecnica:
' LÆindirizzo video parte da &HB800 per la pagina 0 in modalitα testo 80x25.
' Ogni cella video = 2 byte:
'   byte 0: codice ASCII del carattere
'   byte 1: attributo colore (4 bit testo, 3 sfondo, 1 blink)
' Calcolo indirizzo: &HB800 + ((riga-1)*160) + ((colonna-1)*2)
'---------------------------------------------------------------------------

SUB Messaggio (mex$, riga, daCol, coloreTesto, coloreSfondo)
    DIM t AS SINGLE
    DIM original(1 TO LEN(mex$) * 2)
    baseAddr = (riga - 1) * 160 + (daCol - 1) * 2
    attrib = coloreTesto + coloreSfondo * 16

    ' --- memorizza i caratteri e gli attributi originali
    FOR i = 0 TO LEN(mex$) - 1
        addr = baseAddr + i * 2
        original(i * 2 + 1) = PEEK(addr)
        original(i * 2 + 2) = PEEK(addr + 1)
    NEXT

    DO
        IF alt = 0 THEN
            alt = 1
            ' --- mostra il messaggio
            FOR i = 0 TO LEN(mex$) - 1
                addr = baseAddr + i * 2
                POKE addr, ASC(MID$(mex$, i + 1, 1))
                POKE addr + 1, attrib
            NEXT
        ELSE
            alt = 0
            ' --- ripristina i caratteri originali
            FOR i = 0 TO LEN(mex$) - 1
                addr = baseAddr + i * 2
                POKE addr, original(i * 2 + 1)
                POKE addr + 1, original(i * 2 + 2)
            NEXT
        END IF
        t = TIMER: WHILE TIMER - t < .5: WEND
    LOOP WHILE INKEY$ = ""
END SUB

SUB Riempimento
    CLS
    RANDOMIZE TIMER
    FOR r = 1 TO 25
        FOR c = 1 TO 80
            addr = (r - 1) * 160 + (c - 1) * 2
            car = INT((255 - 32) * RND) + 32
            coloreT = INT(14 * RND) + 1
            coloreS = INT(7 * RND)
            POKE addr, car
            POKE addr + 1, coloreT + coloreS * 16
        NEXT
    NEXT
END SUB
