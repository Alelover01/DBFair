SELECT *
FROM(SELECT codicePadiglione,count(codiceFiscale) AS 'Somma Visitatori'
FROM `padiglioni-visitatori` 
GROUP BY codicePadiglione ) AS ciao
WHERE ciao.`Somma Visitatori`= max(ciao.`Somma Visitatori`)