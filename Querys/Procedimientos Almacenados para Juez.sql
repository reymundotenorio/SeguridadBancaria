go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar Juez*/
create procedure NJUEZ
@IPNJ nvarchar(15),
@ISNJ nvarchar(15),
@IPAJ nvarchar(15),
@ISAJ nvarchar(15),
@ICJ char(16),
@ISJ char(1),
@FechaContrato date
as 
declare @icej char(16)
set @iceJ=(select Cedula from Juez where(Cedula=@ICJ))
if( @icej=@ICJ)
begin
print concat('Juez ',@IPNJ,' ',@ISNJ,' ',@IPAJ,' ',@ISAJ, ' ya existe ')
end
else
begin
	if(@IPNJ is null)
	begin
	print 'El Nombre del Juez no puede ser nulo'
	end
	else
	begin
		if(@ISNJ is null)
		begin
		print 'El Segundo Nombre del Juez no puede ser nulo'
		end
		else
		begin
			if(@IPAJ is null)
			begin
			print 'El Primer  Apellido del Juez no puede ser nulo'
			end
			else
			begin
				if(@ISAj is null)
				begin
				print 'El Segundo Apellido del juez no puede ser nulo'
				end
				else
				begin
					if(@ICJ is null)
					begin
					print 'La cedula del Juez no puede ser nulo'
					end
					else
						begin
						if(@ISJ is null)
						begin
						print 'El sexo del Juez debe ser valido M ó F'
						end
						else
						begin
							--if(@IAJ>0 AND @IAJ<=47)
							--begin
							insert into Juez values(@IPNJ, @ISNJ, @IPAJ, @ISAJ,@ICJ,@ISJ, @FechaContrato,1)
							print 'Juez Insertado con Exito'
							--end
							--else
						--	print Concat('Insertar Antiguedad del Juez ',  @IPNJ,' ', @ISNJ,' ', @IPAJ,' ', @ISAJ, ' entre 1 y 47 años')
						end
					end
				end
			end
		end
	end
end
go
/*crear procedimiento almacenado para modificar juez*/
create procedure UJUEZ
@ICJ int,
@IPNJ nvarchar(15),
@ISNJ nvarchar(15),
@IPAJ nvarchar(15),
@ISAJ nvarchar(15),
@FechaContrato date
as
declare @icoj as int
set @icoj =(select  Clave_Interna from Juez where(Clave_Interna= @ICJ)) 
if(@icoj = @ICJ)
begin
	--if(@IAJ<0 AND @IAJ<=47)
	--begin
		update Juez set PNombreJ =  @IPNJ, SNombreJ= @ISNJ, PApellidoJ=@IPAJ, SApellidoJ=@ISAJ, [Fecha_Contrato]=@FechaContrato where (Clave_Interna= @ICJ)
		print 'Los datos del Juez se modificaron correctamente'
--	end
--	else
--	print 'Insertar la Antiguedad del Juez entre 0 a 47'
end
else
	print 'Juez no existente'
/*Crear procedimiento almacenado para eliminar juez*/
go
create procedure EJuez
@ICJ int
as
declare @icoj as int
set @icoj =(select Clave_Interna from Juez where(Clave_Interna = @ICJ)) 
if(@icoj = @ICJ)
begin
	update Juez set Estado =  0  where (Clave_Interna = @ICJ)
	print 'El Juez se Desactivo con exito'
end
else
	print 'Juez no existente'
go

create procedure AJuez
@ICJ int
as
declare @icoj as int
set @icoj =(select Clave_Interna from Juez where(Clave_Interna = @ICJ)) 
if(@icoj = @ICJ)
begin
	update Juez set Estado =  1  where (Clave_Interna = @ICJ)
	print 'El Juez se Activado con exito'
end
else
	print 'Juez no existente'
go
/*crear view de Jueces activos*/
create view JACTIVOS
 as 
select Clave_Interna, PNombreJ, SNombreJ, PApellidoJ, SApellidoJ from Juez where (Estado=1)
go

/*crear view de Jueces inactivas*/
create View JINACTIVOS
as
select Clave_Interna, PNombreJ, SNombreJ, PApellidoJ, SApellidoJ from Juez where (Estado=0)
Go
 
 ---




 
 /*Fecha Nacimiento*/

declare @años as integer
declare @meses as integer
declare @dias as integer
declare @fecha as datetime
declare @hoy as datetime

set @fecha = '10/07/02'
set @hoy = getdate()
set @años = datediff("yy", @fecha, @hoy)
if dateadd("yy", @años, @fecha) > @hoy set @años = @años - 1
set @fecha = dateadd("yy", @años, @fecha)
set @meses = datediff("mm", @fecha, @hoy)
if dateadd("mm", @meses, @fecha) > @hoy set @meses = @meses - 1
set @fecha = dateadd("mm", @meses, @fecha)
set @dias = datediff("dd", @fecha, @hoy)
set @fecha = dateadd("dd", @dias, @fecha)
print 'Tu edad es de ' + ltrim(str(@años)) + ' años ' +
 ltrim(str(@meses)) + ' meses y ' + ltrim(str(@dias)) + ' días.'