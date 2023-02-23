SELECT Pollissa.codi, tipus_polissa.nom, client.dni, client.nom, client.cognoms   
FROM Polissa, client, tipus_polissa
WHERE client.dni = polissa. dni_client and polissa.ID_tipus_polissa = tipus_polissa.ID and tipus_polissa.mm = "Viatge";
