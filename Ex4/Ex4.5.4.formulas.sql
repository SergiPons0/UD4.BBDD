Select *
From Polissa, Client, TIpusPolisa, Vendedor
Where Client_DNI = Polissa.Client_DNI
and Polissa.TIpusPolisa_ID = TIpusPolisa.ID
and Polissa.Vendedor_DNI/CIF = Vendedor.DNI/CIF
