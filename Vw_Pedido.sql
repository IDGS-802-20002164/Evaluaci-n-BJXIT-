if exists (select 1 from sys.all_views where name = 'Vw_Pedido')
	drop view dbo.Vw_Pedido
go	
	
	
create view dbo.Vw_Pedido
as
select
		ped.id,
		ped.fecha,
		ped.iduser,
		ped.direccion,
		ped.folio,
		ped.estatus
     
from 
	dbo.pedido ped