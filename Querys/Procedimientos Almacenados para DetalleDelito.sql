go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar contrato*/
create procedure NDETALLEDELITO
@IDDelito int,
@CodAtracador int
as 

insert into [dbo].[Detalle_Delito] values(@IDDelito, @CodAtracador)
print 'Detalle Delito guardado con exito'

go



/*crear view de Jatracadores activos*/
create view DELITOS
 as 
select DD.ID_Detalle_Delito, DD.id_delito, A.PNombreA, A.SNombreA, A.PApellidoA, A.SApellidoA
from Detalle_Delito DD
Inner Join Atracador A
On DD.Codigo_Atracador =A.Codigo_Atracador
go
