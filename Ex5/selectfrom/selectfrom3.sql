SELECT * 
FROM Ex5.insert.client, vehicle2, TipusVehicle, Ex5.insert.cita, 
where client.dni = vehicle.dni_client
and vehicle.ID_tipus_vehicle   = tipus_vehicle.ID
and vehicle.matricula = cita.matricula_vehicle;
