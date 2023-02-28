Select pasajero.DNI , pasajero.Nombre , pasajero.Apellido, Vuelo.Avion_ID, Vuelo.Origen, Vuelo.Destino, reserva.Importe_tot
From pasajero, reserva, Vuelo
Where pasajero.Pasaporte = reserva.Pasajero_Pasaporte
and reserva.Vuelo_ID = Vuelo.ID
and Reserva.ID = "WTG487855"