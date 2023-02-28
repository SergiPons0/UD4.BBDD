Select *
From client, vehicle, TipusVehicle, cita
Where client.Usuario = vehicle.Client_Usuario
and vehicle.TipusVehicle_ID= TipusVehicle.ID
and vehicle.Matricula = cita.Vehicle_Matricula
