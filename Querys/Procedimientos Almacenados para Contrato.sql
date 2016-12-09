go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar contrato*/
create procedure NCONTRATO
@IIV int,
@IFC date
as 

insert into Contrato values(@IIV,@IFC,1)
print 'Contrato guardado con exito'

go


create procedure ECONTRATO
@ICA int
as
begin
	update [dbo].[Contrato] set Estado =  0  where ([id_Contrato] = @ICA)
	print 'Contrato Cancelado con exito'
end


go


/*crear view de Jatracadores activos*/
create view CACTIVOS
 as 
select C.id_Contrato, C.Fecha, V.PNombrev, V.SNombreV, V.PApellidoV, V.SApellidoV, C.Estado
from Contrato C
inner join Vigilante V
On C.id_V = V.Codigo_vigilante
go
