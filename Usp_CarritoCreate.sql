
if exists (select *  from sys.procedures where name = 'Usp_CarritoCreate')
	drop procedure dbo.Usp_CarritoCreate
go

create procedure Usp_CarritoCreate
(

  @IdCarrito					int
	, @UserId			int                               
	, @productId							int                   
	, @cantidad								int    

)
as

begin
	
	declare
		 @latestInsertedId   int

		 set @latestInsertedId = (select top 1 idCarrito from carrito  order by idCarrito desc) 

	insert into dbo.carrito
	(
		idCarrito
		, userId
		, productId		        
		, cantidad			          
						         					              				      
	)
	values
	(
	case
		when @IdCarrito = 0
				then @latestInsertedId + 1
			else @IdCarrito
		end
		,@UserId
    , @productId
		, @cantidad	              
						           						              		   		       
	)

	set @latestInsertedId = scope_identity()

  return @latestInsertedId

end
go