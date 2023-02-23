Select count(LineadeTicket) as "Numero linies" 
From LineadeTicket, Ticket, Empleat
Where Empleat.DNI = Ticket.DNI_Empleat
and Ticket.ID = LineadeTicket.Id_Ticket
and Empleat.Nom like "o%"
and Ticket.data < "23/2/2023" ;