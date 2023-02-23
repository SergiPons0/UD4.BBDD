Select count(Distint(Vuelo.ID)) as "Numero de vuelos reservados"
From Reserva, vuelo
Where reserva.ID_vuelo = vuelo.ID;