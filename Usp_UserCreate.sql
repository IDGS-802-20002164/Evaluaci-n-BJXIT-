
if exists (select *  from sys.procedures where name = 'Usp_UserCreate')
	drop procedure dbo.Usp_UserCreate
go

create procedure Usp_UserCreate
(
 @Id					int
  , @Name					nvarchar(50)
	, @Email			nvarchar(50)                               
	, @Password							varchar(10)                   
	, @Telefono								int 
	, @Active			bit
	, @Confirmed_at		Datetime
	, @RoleId			int

)
as

begin
	
	declare
		 @latestInsertedId   int

		 set @latestInsertedId = (select top 1 id from users order by id desc) 

	insert into dbo.users
	(
		id
		, Name
		, Email		        
		, Password
		, Telefono	
		, Active
		, Confirmed_at
		, RoleId
						         					              				      
	)
	values
	(
	case
		when @Id = 0
				then @latestInsertedId + 1
			else @Id
		end
		,@Name
    , @Password
		, @Telefono
		, @Active
		, @Confirmed_at
		, @RoleId
						           						              		   		       
	)

	set @latestInsertedId = scope_identity()

  return @latestInsertedId

end
go