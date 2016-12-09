go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar contrato*/
create procedure NJUICIO
@CI int,
@IDDelito int,
@Fecha date
as 
insert into [dbo].[Juicio] values(@CI, @IDDelito, @Fecha, 1)
print 'Delito guardado con exito'

go


Create View JuicioV as (
Select J.id_Juicio, J.id_delito, JZ.PNombreJ, JZ.SNombreJ, JZ.PApellidoJ, JZ.SApellidoJ, J.Fecha, J.Estado
from [dbo].[Juicio] J
Inner Join Juez JZ
On J.Clave_Interna = JZ.Clave_Interna
)
