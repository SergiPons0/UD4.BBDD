Select Avion.ID, Avion.Modelo, Avion.Capacidad, Vuelo.ID, Vuelo.Dia_llegada, Vuelo.Hora_salida, reserva.Origen, Vuelo.Destino, Vuelo.Hora_vuelta
From Avion , Vuelo, Reserva
Where Avion.Modelo = "Airbus A320"
and Avion.ID = Vuelo.Avion_ID
and reserva.Vuelo_ID = Vuelo.ID;