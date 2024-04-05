
if exists (select *  from sys.procedures where name = 'Usp_ProvedorCreate')
	drop procedure cash.Usp_ContactCreate
go

create procedure Usp_ProvedorCreate
(

  @Nombre					nvarchar(200)
	, @Empresa				nvarchar(200)                               
	, @Telefono							nvarchar(10)                   
	, @Rfc								nvarchar(13)      
	, @Email							nvarchar(100) 
  , @Estatus		        int  

)
as

begin
	
	declare
		 @latestInsertedId   int
     , @alreadyExists    int

   select 
    @alreadyExists = (
      select 
        isnull(id, 0)
      from 
        dbo.proveedor 
      where 
        nombre = @Nombre
    )

  if(@alreadyExists > 0) 
    return 0

	insert into dbo.proveedor
	(
		 nombre
    , empresa
		, telefono		        
		, rfc			          
		, email							         					              
		, estatus				      
	)
	values
	(
		@Nombre
    , @Empresa
		, @Telefono	              
		, @Rfc			           
		, @Email							           						              
		, @Estatus			   		       
	)

	set @latestInsertedId = scope_identity()

  return @latestInsertedId

end
go