
create table Usuarios
(
Id_Usuario int identity(1,1) Primary key, 
Nombre varchar(20), 
Apellido varchar(20), 
Correo varchar(50), 
Num_Telefono int,
Telefono_Sec int,
Constraseña varbinary(30)
)

create table Paquetes 
(
Id_paquete int Primary key,
NumSeguimiento int,
Id_Usuario int,
Estado varchar(20), 
TiempoEspera time, 
Peso float(30),
LugarDestino varchar(50),
LugarSalida varchar(50),
Costo float
)

create table Seguimiento 
(
NumSeguimiento int Primary key,
EmpTransporte int, 
Ubicacion geography
)

create table Pagos 
(
Id_Paquete int,
TarifaPlana float
)

create table Transportes
(
EmpTransporte int identity(100, 1) Primary key,
Nombre varchar(30)

)