SELECT cita.matricula,cita.dia,cita.hora,vehiculo_marca,cliente.nombre 
FROM client, vehicle, tipus_vehicle, cita
Where client.dni = vehicle.dni_client 
and vehicle.matricula=cita.vehiculo_matricula
and cita.data> '9/3/2022';