SELECT prodotti.*, aziende.codicePadiglione, aziende.specializzazione
FROM prodotti,aziende
WHERE prodotti.codiceAzienda = aziende.idAzienda
ORDER BY aziende.codicePadiglione