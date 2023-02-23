Select Producte.Codi_Intern , Producte.Descripcio , Producte.IVA , Producte.Codi_Barres
From Producte
Where Producte.Codi_Barres !='32' 
and Producte.IVA = "5%";