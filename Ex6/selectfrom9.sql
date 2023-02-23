Select Ticket.Nº_factura , Ticket.Data , Ticket.hora, Empleat.Nom, suma(LineadeTicket.Import_IVA)
From Ticket, Empleat, LineadeTicket, Producte
Where Ticket.DNI_Empleat = Empleat.DNI
and Ticket.ID = LineadeTicket.ID_Ticket
and Producte.ID = LineadeTicket.ID_producte
and Producte.Codi_barres="343";