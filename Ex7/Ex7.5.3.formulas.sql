Select count(LineadeTicket) as "Numero Linies"
From LineadeTicket, Ticket, Empleat
Where Empleat.DNI = Ticket.Empleat_DNI
and Ticket.ID = LineadeTicket.Ticket_ID
and Empleat.Nom like "o%"
and Ticket.Data < "23/8/2024"