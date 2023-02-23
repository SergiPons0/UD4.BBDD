Select Pasajero.DNI, Pasajero.Nombre, Pasajero.Apellido, Vuelo.ID, Vuelo.Origen, Vuelo.Destino, Reserva.import_tot
From Pasajero, Reserva, Vuelo
Where Pasajero.DNI = Reserva.DNI_Pasajeros
and Reserva.ID_vuelo = vuelo.ID
and Reserva.ID = "4";