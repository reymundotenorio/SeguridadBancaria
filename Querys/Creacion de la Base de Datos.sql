create database Seguridad_Bancaria
go
use Seguridad_Bancaria
go
create table Banco(
Codigo_Banco int identity(1,1) primary key not null,
Nombre nvarchar (50) not null,
Domicilio nvarchar (80) not null,
Estado bit
)
go
create table Sucursal(
Codigo_sucursal int identity(1,1) primary key not null,
Codigo_Banco int foreign key references Banco(Codigo_Banco) not null,
Nombre_Sucursal nvarchar(50) not null,
Domicilio nvarchar (80) not null,
No_Empleado int not null,
Estado bit
)
go
create table Vigilante(
Codigo_vigilante int identity(1,1) primary key not null,
PNombrev nvarchar(15) not null,
SNombreV nvarchar(15),
PApellidoV nvarchar(15) not null,
SApellidoV nvarchar(15) not null,
Cedula char(16) unique check(cedula like '[0-9][0-9][0-9]-[0-3][0-9][0-1][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][A-Z]') not null,
Sexo char(1) check(Sexo like('M') or sexo like ('F')),
Estado bit
)
go
create table Contrato(
id_Contrato int primary key identity(1,1) not null,
id_V int foreign key references Vigilante(Codigo_Vigilante) not null,
Fecha date default getdate() not null,
Estado bit
)
go
create table detalle_Contrato(
ID_Detalle_Contrato int primary key identity(1,1),
id_Contrato int foreign key references Contrato(id_Contrato) not null,
id_S int foreign key references Sucursal(Codigo_Sucursal) not null,
Arma bit not null,
fechaI date not null,
FechaF date not  null 
)
go
create table Banda(
Codigo_Banda int identity(1,1) primary key not null,
Nombre nvarchar (50) not null,
Estado bit not null
)
go
create table Atracador(
Codigo_Atracador int identity(1,1) primary key not null,
Codigo_Banda int foreign key references Banda(Codigo_Banda),
PNombreA nvarchar(15) not null,
SNombreA nvarchar(15)not null,
PApellidoA nvarchar(15) not null,
SApellidoA nvarchar(15) not null,
Cedula char(16) unique check(cedula like '[0-9][0-9][0-9]-[0-3][0-9][0-1][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][A-Z]') not null,
Sexo char(1) check(sexo like('M') or sexo like ( 'F')),
Estado bit
)
go
create table Delito(
id_delito int primary key identity (1,1) not null,
Codigo_Sucursal int foreign key references Sucursal(codigo_sucursal) not null,
Fecha date default getdate() not null,
Nombre nvarchar(50) not null
)
go
create table Detalle_Delito(
ID_Detalle_Delito int primary key identity(1,1),
id_delito int foreign key references Delito(id_delito) not null,
Codigo_Atracador int foreign key references Atracador(Codigo_Atracador) not null,
)

go
create table Juez(
Clave_Interna int identity(1,1) primary key not null,
PNombreJ nvarchar(15) not null,
SNombreJ nvarchar(15),
PApellidoJ nvarchar(15) not null,
SApellidoJ nvarchar(15) not null,
Cedula char(16) unique check(cedula like '[0-9][0-9][0-9]-[0-3][0-9][0-1][0-9][0-9][0-9]-00[0-9][0-9][A-Z]') not null,
sexo char(1) check(sexo like('M') or sexo like ( 'F')),
Fecha_Contrato date not null,
Estado bit
)
go

go
create table Juicio(
id_Juicio int primary key identity(1,1) not null,
Clave_Interna int  foreign key references Juez(Clave_Interna) not null,
id_delito int foreign key references Delito(id_delito) not null,
Fecha date not null,
Estado bit
)
go
create table Condena(
id int primary key not null identity(1,1),
Id_Juicio int foreign key references Juicio(id_Juicio) not null,
condena smallint not null,
fechaCondena date not null
)