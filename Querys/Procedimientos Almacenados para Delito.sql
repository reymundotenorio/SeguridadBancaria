go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar contrato*/
create procedure NDELITO
@CS int,
@Fecha date,
@Nombre nvarchar(50)
as 

insert into [Delito] values(@CS,@Fecha, @Nombre)
print 'Delito guardado con exito'

go

