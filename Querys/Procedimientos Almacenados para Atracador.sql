go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar Atracador*/
create procedure NATRACADOR
@ICB int,
@IPNA nvarchar(15),
@ISNA nvarchar(15),
@IPAA nvarchar(15),
@ISAA nvarchar(15),
@ICA char(16),
@ISA char(1)
as 
declare @icea char(16)
set @icea=(select Cedula from Atracador where(Cedula=@ICA))
if( @icea=@ICA)
begin
print concat('Atracador ',@IPNA,' ',@ISNA,' ',@IPAA,' ',@ISAA, ' ya existe ')
end
else
begin
	if(@IPNA is null)
	begin
	print 'El Nombre del Atracador no puede ser nulo'
	end
	else
	begin
		if(@ISNA is null)
		begin
		print 'El Segundo Nombre del Atracador no puede ser nulo'
		end
		else
		begin
			if(@IPAA is null)
			begin
			print 'El Primer  Apellido del Atracador no puede ser nulo'
			end
			else
			begin
				if(@ISAA is null)
				begin
				print 'El Segundo Apellido del Atracador no puede ser nulo'
				end
				else
				begin
					if(@ICA is null)
					begin
					print 'La cedula del Atracador no puede ser nulo'
					end
					else
					begin
						if(@ISA is null)
						begin
						print 'El sexo del Atracador debe ser valido M ó F'
						end
						else
						begin
						insert into Atracador values(@ICB,@IPNA, @ISNA, @IPAA, @ISAA,@ICA,@ISA,1)
						print 'Atracador Insertado con Exito'
						end					
					end
				end
			end
		end
	end
end
go
/*crear procedimiento almacenado para modificar atracador*/
create procedure UATRACADOR
@ICA int,
@ICB int,
@IPNA nvarchar(15),
@ISNA nvarchar(15),
@IPAA nvarchar(15),
@ISAA nvarchar(15),
@ICEA char(16),
@ISA char(1)
as
declare @icoa as int
set @icoa =(select Codigo_Atracador from Atracador where(Codigo_Atracador = @ICA)) 
if(@icoa = @ICA)
begin
	update Atracador set Codigo_Banda=@ICB, PNombreA =  @IPNA , SNombreA=@ISNA, PApellidoA=@IPAA, SApellidoA=@ISAA  where (Codigo_Atracador = @ICA)
	print 'El Atracador se Modifico correctamente'
end
else
	print 'Atracador no existente'
/*Crear procedimiento almacenado para eliminar Atracador*/
go


create procedure EATRACADOR
@ICA int
as
declare @icoA as int
set @icoa =(select Codigo_Atracador from Atracador where(Codigo_Atracador = @ICA)) 
if(@icoa = @ICA)
begin
	update Atracador set Estado =  0  where (Codigo_Atracador = @ICA)
	print 'El Atracador se Desactivo con exito'
end
else
	print 'Atracador no existente'

go


create procedure AATRACADOR
@ICA int
as
declare @icoA as int
set @icoa =(select Codigo_Atracador from Atracador where(Codigo_Atracador = @ICA)) 
if(@icoa = @ICA)
begin
	update Atracador set Estado =  1  where (Codigo_Atracador = @ICA)
	print 'El Atracador se Desactivo con exito'
end
else
	print 'Atracador no existente'

go

/*crear view de Jatracadores activos*/
create view AACTIVOS
 as 
select Codigo_Atracador, PNombreA, SNombreA, PApellidoA, SApellidoA from Atracador where (Estado=1)
go
/*crear view de Jueces inactivas*/
create View AINACTIVOS
as
select Codigo_Atracador, PNombreA, SNombreA, PApellidoA, SApellidoA from Atracador where (Estado=0)