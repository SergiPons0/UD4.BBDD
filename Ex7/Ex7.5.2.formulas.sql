Select Ticket.ID, Ticket.Data, Ticket.hora, Empleat.Nom, sum(LineadeTicket.Preu_unitari_(IVA))
From Ticket, Empleat, LineadeTicket, Producte
Where Ticket.Empleat_DNI = Empleat.DNI
and Ticket.ID = LineadeTicket.Ticket_ID
and Producte.Codi_intern = LineadeTicket.Producte_Codi_intern
and Producte.Codi_barres= "542458"