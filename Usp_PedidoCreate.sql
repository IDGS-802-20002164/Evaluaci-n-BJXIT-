
if exists (select *  from sys.procedures where name = 'Usp_PedidoCreate')
	drop procedure dbo.Usp_PedidoCreate
go

create procedure Usp_PedidoCreate
(

  @Fecha					Datetime
	, @IdUser			int                               
	, @Direccion							int                   
	, @Folio								nvarchar(50)     
	, @Estatus							int 

)
as

begin
	
	declare
		 @latestInsertedId   int

		 set @latestInsertedId = (select top 1 id from pedido  order by id desc) 

	insert into dbo.pedido
	(
		id,
		 fecha
    , iduser
		, direccion		        
		, folio			          
		, estatus							         					              				      
	)
	values
	(
	@latestInsertedId + 1,
		@Fecha
    , @IdUser
		,case
			when  @Direccion = null
				then 2
			else  @Direccion
			end
		, @Folio			           
		, @Estatus							           						              		   		       
	)

	set @latestInsertedId = scope_identity()

  return @latestInsertedId

end
go