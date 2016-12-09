go
use Seguridad_Bancaria
go
/*crear Procedimientos almacenados para insertar banda.*/
create procedure NBANDA
@INB nvarchar(50)
as
declare @ib as nvarchar(50)
set @ib=(select Nombre from Banda where(Nombre=@INB))
if(@ib=@INB)
print 'El Nombre de la Banda ya esta Registrado'
else
begin
	if(@INB is null)
	print 'El Nombre de la Banda no puede ser nulo'
	else
	begin
		insert into Banda Values(@INB, 1)
		print 'Banda se registro con exito'
	end
end
go
/*crear procedimiento almacenado para modificar banda*/
create procedure UBANDA
@ICB int,
@INB nvarchar(50)
as
declare @icob as int
set @icob =(select Codigo_Banda from Banda where(Codigo_Banda= @ICB)) 
if(@icob = @ICB)
begin
	update Banda set Nombre =  @INB  where (Codigo_Banda= @ICB)
	print 'Los datos de la Banda se modificaron correctamente'
end
else
	print 'Banda no existente'
/*Crear procedimiento almacenado para eliminar banda*/
go
create procedure EBANDA
@ICB int
as
declare @icob as int
set @icob =(select Codigo_Banda from Banda where(Codigo_Banda = @ICB)) 
if(@icob = @ICB)
begin
	update Banda set Estado =  0  where (Codigo_Banda = @ICB)
	update Atracador set Codigo_Banda= null where (Atracador.Codigo_Banda=@ICB)
	print 'La Banda se Desactivo con exito'
end
else
	print 'Banda no existente'
go

create procedure ABANDA
@ICB int
as
declare @icob as int
set @icob =(select Codigo_Banda from Banda where(Codigo_Banda = @ICB)) 
if(@icob = @ICB)
begin
	update Banda set Estado = 1  where (Codigo_Banda = @ICB)
	update Atracador set Codigo_Banda= null where (Atracador.Codigo_Banda=@ICB)
	print 'La Banda se Desactivo con exito'
end
else
	print 'Banda no existente'
go
/*crear view de Bandas activas*/
create view BANDAS_ACTIVOS
 as 
select Codigo_Banda, Nombre from Banda where (Estado=1)
go

/*crear view de Bandas inactivas*/
create view BANDAS_INACTIVOS
as
select Codigo_Banda, Nombre from Banda where (Estado=0)

