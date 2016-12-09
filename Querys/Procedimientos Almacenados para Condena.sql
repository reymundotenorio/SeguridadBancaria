go
use Seguridad_Bancaria
go
/*Crear procedimientos almacenados para insertar contrato*/
create procedure NCONDENA
@IDJuicio int,
@Condena int,
@Fecha date
as 
insert into [dbo].[Condena] values(@IDJuicio, @Condena, @Fecha)
print 'Condena guardado con exito'

go

