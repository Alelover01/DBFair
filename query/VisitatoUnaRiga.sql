SELECT ciao.codicePadiglioneS, max(ciao.`Somma Visitatori`) AS 'Visitatori Totali', padiglioni.specializzazioneRichiesta
FROM(SELECT codicePadiglioneS,count(codiceFiscaleS) AS 'Somma Visitatori'
FROM `padiglioni-visitatori` 
GROUP BY codicePadiglioneS ) AS ciao, padiglioni