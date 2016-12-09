go
use Seguridad_Bancaria
go
/*crear Procedimientos almacenados.*/
create procedure NBANCO
@INB nvarchar(50),
@IDB nvarchar(80)
as
declare @ib as nvarchar(50)
set @ib=(select Nombre from Banco where(Banco.Nombre=@INB))
if(@ib=@INB)
print 'El Nombre del Banco ya esta Registrado'
else
begin
	if(@INB is null)
	print 'El Nombre del Banco no puede ser nulo'
	else
	begin
		if(@IDB is null)
		print 'EL Domicilio del Banco no puede ser nulo'
		else
		begin
		insert into Banco Values(@INB, @IDB, 1)
		print 'Banco se registro con exito'
		end
	end
end

/*crear procedimiento Actualizar Banco*/
go
create procedure UBANCO
@ICB int,
@INB nvarchar(50),
@IDB nvarchar(80)
as
declare @icob as int
set @icob =(select Codigo_Banco from Banco where(Codigo_Banco = @ICB)) 
if(@icob = @ICB)
begin
	update Banco set Nombre =  @INB , Domicilio= @IDB where (Codigo_Banco = @ICB)
	print 'El Banco se Modifico correctamente'
end
else
	print 'Banco no existente'
go


create procedure EBANCO
@ICB int
as
declare @icob as int
set @icob =(select Codigo_Banco from Banco where(Codigo_Banco = @ICB)) 
if(@icob = @ICB)
begin
	update Banco set Estado =  0  where (Codigo_Banco = @ICB)
	update Sucursal set Estado=0 where (Sucursal.Codigo_Banco=@ICB)
	print 'Banco Desactivado  correctamente'
end
else
	print 'Banco no existente'

go


create procedure ABANCO
@ICB int
as
declare @icob as int
set @icob =(select Codigo_Banco from Banco where(Codigo_Banco = @ICB)) 
if(@icob = @ICB)
begin
	update Banco set Estado = 1  where (Codigo_Banco = @ICB)
	update Sucursal set Estado= 1 where (Sucursal.Codigo_Banco=@ICB)
	print 'Banco Activado  correctamente'
end
else
	print 'Banco no existente'

go
/*crear view de bancos activos*/
create view BACTIVOS
 as 
select Codigo_Banco, Nombre from Banco where (Estado=1)
go
/*crear procedimientos de banos inativos*/

create view BINACTIVOS
 as 
select Codigo_Banco, Nombre from Banco where (Estado=0)
/*crear prodecimiento almacenado para insertar una nueva sucursal*/

