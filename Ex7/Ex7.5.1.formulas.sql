Select Producte.Codi_intern, Producte.Descripcio, Producte.IVA, Producte.Codi_barres
From Producte
Where Producte.Codi_barres != ''
and Producte.IVA = "5%"