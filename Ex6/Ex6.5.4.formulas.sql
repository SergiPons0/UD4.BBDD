Select reserva.ID, pasajero.Nombre
From pasajero, Vuelo, reserva
Where pasajero.Pasaporte = reserva.Pasajero_Pasaporte
and reserva.Vuelo_ID= Vuelo.ID
and Vuelo.Dia_llegada= "1/5/2023"