update banco set estado=0 where Codigo_Banco=1

go
create trigger ActualizarSucursales
on Banco
after update
as
begin
	if(0=(select estado from inserted))
	begin
		update Sucursal set estado=0 where Codigo_Banco=(select i.Codigo_Banco from inserted i)
	end
	else
	begin
		update Sucursal set estado=1 where Codigo_Banco=(select i.Codigo_Banco from inserted i)
	end
end
go

