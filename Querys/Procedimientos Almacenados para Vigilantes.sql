go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar vigilantes*/
create procedure NVIGILANTE
@IPNV nvarchar(15),
@ISNV nvarchar(15),
@IPAV nvarchar(15),
@ISAV nvarchar(15),
@ICV char(16),
@ISV char(1)
as 
declare @icev char(16)
set @icev=(select Cedula from Vigilante where(Cedula=@ICV))
if( @icev=@ICV)
begin
print concat('Vigilante ',@IPNV,' ',@ISNV,' ',@IPAV,' ',@ISAV, ' ya existe ')
end
else
begin
	if(@IPNV is null)
	begin
	print 'El Nombre del vigilante no puede ser nulo'
	end
	else
	begin
		if(@ISNV is null)
		begin
		print 'El Segundo Nombre del Vigilante no puede ser nulo'
		end
		else
		begin
			if(@IPAV is null)
			begin
			print 'El Primer  Apellido del Vigilante no puede ser nulo'
			end
			else
			begin
				if(@ISAV is null)
				begin
				print 'El Segundo Apellido del Vigilante no puede ser nulo'
				end
				else
				begin
					if(@ICV is null)
					begin
					print 'La cedula del Vigilante no puede ser nulo'
					end
					else
						begin
						if(@ISV is null)
						begin
						print 'El sexo del vigilante debe ser valido M ó F'
						end
						else
						begin							
							insert into Vigilante values(@IPNV, @ISNV, @IPAV, @ISAV,@ICV,@ISV, 1)
							print 'Vigilante Insertado con Exito'									
						end
					end
				end
			end
		end
	end
end
go
/*crear procedimiento almacenado para modificar Vigilante*/
create procedure UVIGILANTE
@ICV int,
@IPNV nvarchar(15),
@ISNV nvarchar(15),
@IPAV nvarchar(15),
@ISAV nvarchar(15)
as
declare @icov as int
set @icov =(select Codigo_Vigilante from Vigilante where(Codigo_Vigilante= @ICV)) 
if(@icov = @ICV)
begin	
		update Vigilante set PNombreV=  @IPNV, SNombreV= @ISNV, PApellidoV=@IPAV, SApellidoV=@ISAV WHERE (Codigo_Vigilante= @ICV)
		print 'Los datos del vigilante se modificaron correctamente'	
end
else
	print 'Vigilante no existente'
/*Crear procedimiento almacenado para eliminar vigilante*/
go
create procedure EVIGILANTE
@ICV int
as
declare @icov as int
set @icov =(select Codigo_Vigilante from Vigilante where(Codigo_Vigilante = @ICV)) 
if(@icov = @ICV)
begin
	update Vigilante set Estado =  0  where (Codigo_Vigilante = @ICV)
	print 'El Vigilante se Desactivo con exito'
end
else
	print 'Vigilanteno existente'
go
/*crear procedimiento para activar vigilante*/
go
create procedure AVIGILANTE
@ICV int
as
declare @icov as int
set @icov =(select Codigo_Vigilante from Vigilante where(Codigo_Vigilante = @ICV)) 
if(@icov = @ICV)
begin
	update Vigilante set Estado =  1  where (Codigo_Vigilante = @ICV)
	print 'El Vigilante se Activo con exito'
end
else
	print 'Vigilanteno existente'


go
/*crear view de vigilantes activos*/
create view VJACTIVOS
 as 
select Codigo_Vigilante, PNombreV, SNombreV, PApellidoV, SApellidoV from Vigilante where (Estado=1)
go
/*crear view de Jueces inactivas*/
create View VINACTIVOS
as
select Codigo_Vigilante, PNombreV, SNombreV, PApellidoV, SApellidoV from Vigilante where (Estado=0)


Go
create function Edad(@cedula nvarchar(16)) returns integer
as
begin 

declare /*@cedula nvarchar(16),*/ @Fecha1 nvarchar(2), @Fecha2 nvarchar(2), @Fecha3 nvarchar(2), @Edad nvarchar(6), @Final nvarchar(8);
/*set @cedula1 = '201-100792-0006U'*/

Set @Edad = Substring(@cedula,5,6);

Set @Fecha1 = Substring(@Edad,1,2);
Set @Fecha2 = Substring(@Edad,3,2);
Set @Fecha3 = Substring(@Edad,5,2);

set @Final = CONCAT(@Fecha1,'/',@Fecha2,'/',@Fecha3)

 /*Fecha Nacimiento*/

declare @años as integer
declare @meses as integer
declare @dias as integer
declare @fecha as datetime
declare @hoy as datetime

set @fecha = @Final

--set @fecha = '10/07/02'
set @hoy = getdate()
set @años = datediff("yy", @fecha, @hoy)
if dateadd("yy", @años, @fecha) > @hoy set @años = @años - 1
set @fecha = dateadd("yy", @años, @fecha)
set @meses = datediff("mm", @fecha, @hoy)
if dateadd("mm", @meses, @fecha) > @hoy set @meses = @meses - 1
set @fecha = dateadd("mm", @meses, @fecha)
set @dias = datediff("dd", @fecha, @hoy)
set @fecha = dateadd("dd", @dias, @fecha)
--print 'Tu edad es de ' + ltrim(str(@años)) + ' años ' +
 --ltrim(str(@meses)) + ' meses y ' + ltrim(str(@dias)) + ' días.'
 Declare @EdadFinal nvarchar(50)
 set @EdadFinal = ltrim(str(@años)) + ' años ' + ltrim(str(@meses)) + ' meses y ' + ltrim(str(@dias)) + ' días.'


 return @años

 End

 Create view VigilanteV as (
 select Codigo_Vigilante, PNombreV, SNombreV, PApellidoV, SApellidoV, [dbo].[Edad](Cedula) as Edad, Estado from Vigilante 

)