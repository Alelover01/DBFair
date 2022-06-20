SELECT vob.*, visitatori.nome, visitatori.cognome
FROM `visitatori-ordini-biglietti` as vob, visitatori
WHERE vob.codVisitatore = "?" AND vob.codVisitatore = visitatori.`codiceFiscale`