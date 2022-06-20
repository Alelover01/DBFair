SELECT *
FROM prodotti
WHERE idProdotto = ANY 
				(SELECT p.codProdotto 
				FROM prodottiazienda AS p 
				WHERE p.codAzienda = 1);