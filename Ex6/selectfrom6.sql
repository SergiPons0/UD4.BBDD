Select Avion.Modelo, Avion.Capacidad, Vuelo_ID, Vuelo.Dia_llegada, Vuelo.Hora_salida,  
From Avion , Vuelo, Reserva
Where Avion.Modelo = "Airbus A320";