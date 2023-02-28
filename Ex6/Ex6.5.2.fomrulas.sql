Select count(distinct(Vuelo.ID)) as "Numero de vols reservat"
From reserva, Vuelo
Where reserva.Vuelo_ID = Vuelo.ID