go
use Seguridad_Bancaria
go
create procedure NSUCURSAL
@ICB int,
@INS nvarchar(50),
@IDS nvarchar (80),
@NES int 
as
declare @icob as int
set @icob= (select Codigo_Banco from Banco where(Codigo_Banco=@ICB))
declare @is as nvarchar(50)
set @is=(select Nombre_Sucursal from Sucursal	where (Nombre_Sucursal=@INS))
if(@icob=@ICB)
begin
   	if(@INS=@is)
	begin
   	print 'Sucursal ya existe'
	end
	else
	begin
		if(@INS is null)
		begin
		print 'Nombre de La Sucursal no puede ser nula'
		end
		else
		begin
			if(@IDS is null)
			begin
			print 'Domicilio de la Sucursal no puede ser nula'
			end
			else
			begin
			insert into Sucursal values(@ICB,@INS,@IDS,@NES, 1)
			print 'Sucursal se registro con exito'
			end
		end
	end
end
else
print 'Codigo de Banco no existe'


go
create procedure USUCURSAL
@ICS int,
@INS nvarchar(50),
@IDS nvarchar(80)
as
declare @icos as int
set @icos =(select Codigo_Sucursal from Sucursal where(Codigo_sucursal= @ICS)) 
if(@icos = @ICS)
begin
	update Sucursal set Nombre_sucursal =  @INS , Domicilio= @IDS where (Codigo_sucursal= @ICS)
	print 'Los datos de la Sucursal se modificaron correctamente'
end
else
	print 'Sucursal no existente'
go
/*crear procedimiento almacenado para eliminar sucursales*/

create procedure ESUCURSAL
@ICS int
as
declare @icos as int
set @icos =(select Codigo_sucursal from Sucursal where(Codigo_sucursal = @ICS)) 
if(@icos = @ICS)
begin
	update Sucursal set Estado =  0  where (Codigo_sucursal = @ICS)
	print 'La Sucursal se Desactivo con exito'
end
else
	print 'Sucursal no existente'
go
create procedure ASUCURSAL
@ICS int
as
declare @icos as int
set @icos =(select Codigo_sucursal from Sucursal where(Codigo_sucursal = @ICS)) 
if(@icos = @ICS)
begin
	update Sucursal set Estado =  1  where (Codigo_sucursal = @ICS)
	print 'La Sucursal se Activo con exito'
end
else
	print 'Sucursal no existente'
go
go
/*crear view de sucursales activas*/
create view SucursalV
 as 
Select S.Codigo_sucursal, B.Nombre, S.Nombre_Sucursal, S.Domicilio, S.No_Empleado, S.Estado
from [dbo].[Sucursal] S
Inner Join Banco B
On S.Codigo_Banco = B.Codigo_Banco
go


