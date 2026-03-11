# BLINK*.BAS
  
### Lampeggiamenti speciali di messaggi in modalità VGA testo e grafica
                                                          
**Autore**: Marco da Venezia  
**Data**: 1988  
**Compatibilità**: QuickBASIC  
**Licenza**: Libera per nostalgici e restauratori di pixel

---

## BLINK1.BAS

Questo programma lampeggia un messaggio testuale alternandone il colore,
sfruttando l'istruzione COLOR seguita dal numero di colore + 16

---

## BLINK2.BAS, BLINK3.BAS e BLINK4.BAS 

### Descrizione

Questi programmi alternano un messaggio testuale con i caratteri sottostanti,
simulando effetti di lampeggiamento personalizzabili, in modalità testo VGA,
per evitare l'istruzione COLOR seguita dal numero di colore + 16 che cancella
i caratteri sottostanti.

---

### Funzionamento

1. **Riempimento dello schermo**  
   - Lo schermo viene popolato con caratteri casuali ognuno con colori casuali
   per il testo (BLINK2.BAS, BLINK3.BAS, BLINK4.BAS)
   e per lo sfondo (BLINK3.BAS e BLINK4.BAS).

2. **Memorizzazione del contesto**  
   - Il messaggio viene posizionato in una riga a piacere  
   - I caratteri e i colori sottostanti vengono salvati in array

3. **Lampeggiamento**  
   - Un ciclo `DO-LOOP` alterna il messaggio con i caratteri originali  
   - Il colore viene decodificato con le formule:

```
c1 = (c AND 15) + (c \ 8 AND 16)
c2 = (c \ 16) AND 7
```

---

## BLINK5.BAS, BLINK6.BAS

Questi programmi illustrano alcune tecniche per il lampeggiamento di messaggi
in modalità grafica SCREEN 12

---



