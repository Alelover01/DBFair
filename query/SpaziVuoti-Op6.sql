SELECT numeroSpaziEsposizione - numeroSpaziOccupati AS 'SpaziVuoti'
FROM padiglioni
WHERE codicePadiglione=?