SELECT numPersone.*,padiglioni.specializzazioneRichiesta
FROM (	SELECT codicePadiglioneS,count(codiceFiscaleS) AS 'Somma Visitatori'
		FROM `padiglioni-visitatori` 
		GROUP BY codicePadiglioneS ) AS numPersone , padiglioni
WHERE numPersone.`Somma Visitatori` = (	SELECT max(maxVisitatori.`Massimo Visitatori`)
										FROM (SELECT count(codiceFiscaleS) AS 'Massimo Visitatori'
											  FROM `padiglioni-visitatori` 
											  GROUP BY codicePadiglioneS ) AS maxVisitatori ) 
	AND numPersone.codicePadiglioneS = padiglioni.idPadiglione