go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar contrato*/
create procedure NDETALLECONTRATO
@IIC int,
@IIS int,
@Arma bit, 
@IFI date, 
@IFF date
as 

insert into [dbo].[detalle_Contrato] values(@IIC, @IIS, @Arma,@IFI, @IFF)
print 'Detalle Contrato guardado con exito'

go



/*crear view de Jatracadores activos*/
create view DCACTIVOS
 as 
select DC.ID_Detalle_Contrato, DC.id_Contrato, S.Nombre_Sucursal, DC.Arma, DC.fechaI, DC.FechaF
from Detalle_Contrato DC
inner join Sucursal S
On DC.id_S = S.Codigo_sucursal
go
