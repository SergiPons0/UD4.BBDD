SELECT Polissa.NumPolissa, TIpusPolisa.Nom, Client.DNI, Client.Nom, Client.Cognoms
From Polissa, Client, TIpusPolisa
Where Client.DNI= Polissa.Client_DNI
and Polissa.TIpusPolisa_ID = TIpusPolisa.ID
and TIpusPolisa.Nom = "Viatge"