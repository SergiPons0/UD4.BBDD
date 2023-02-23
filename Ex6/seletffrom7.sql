Select Reserva.ID , Pasajero.Nombre
From Pasajero , vuelo , Reserva
Where Pasajero.DNI = Reserva.DNI_Pasajero
and Reserva.ID_vuelo = vuelo.ID
vuelo.data = "6/5/2022";
