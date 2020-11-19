
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


--Trigger
create trigger TriggerUsuario_insert
on Usuarios
for insert
as 
print 'el cambio se ha hecho exitosamente';

insert into Usuarios values ('Luis','Lopez','bla@bla',23546,23411,123);

--Pocedimientos almacenados
USE BoxTracking
GO

--Consulta de paquete por ID
CREATE PROCEDURE sp_consulta
@ID_Paquete INT 
AS
SELECT * FROM Paquetes
WHERE Id_paquete = @ID_Paquete


--Consulta por estado
CREATE PROCEDURE sp_consultapaquete_estado
    @Estado VARCHAR (20)
AS

SELECT * FROM Paquetes 
WHERE @Estado = Estado

--consulta por lugar de destino 
CREATE PROCEDURE sp_destino
    @Destino VARCHAR (50)
AS

SELECT * FROM Paquetes 
WHERE @Destino = LugarDestino

--consulta por lugar de Salida 
CREATE PROCEDURE sp_salida
    @Salida VARCHAR (50)
AS

SELECT * FROM Paquetes 
WHERE @Salida = LugarSalida

--Insertar Usuarios
CREATE PROCEDURE sp_InsertarUsuarios(
@Nombre VARCHAR(20),
@Apellido VARCHAR(20),
@Correo VARCHAR(50),
@Telefono1 INT,
@Telefono2 int,
@Contrasena varbinary(30)

) AS
BEGIN 

INSERT INTO Usuarios (Nombre, Apellido, Correo, Num_Telefono, Telefono_Sec, Constraseña) 
VALUES (@Nombre, @Apellido, @Correo, @Telefono1, @Telefono2, @Contrasena)
END

--Insertar Transporte
CREATE PROCEDURE sp_Transporte(
@NombreTrasnporte VARCHAR(30)
) AS
BEGIN 

INSERT INTO Transportes (Nombre) 
VALUES (@NombreTrasnporte)
END
--insertar en paquetes
CREATE PROCEDURE sp_Paquetes(
@NumSeguimiento INT,
@Id_usuario INT,
@Estado VARCHAR(20),
@Tiempo_Espera TIME,
@Peso FLOAT(30),
@LugarDestino varbinary(50),
@LugarSalida varbinary(50),
@Costo FLOAT

) AS
BEGIN 

INSERT INTO Paquetes (NumSeguimiento,Id_Usuario, Estado,TiempoEspera, Peso, LugarDestino, LugarSalida, Costo) 
VALUES (@NumSeguimiento, @Id_usuario, @Estado, @Tiempo_Espera, @Peso, @LugarDestino, @LugarSalida, @Costo)
END

--Muestra los costos menores al parametro ingresado
CREATE PROCEDURE Costo_Menor(
@costo FLOAT)
AS
BEGIN 
SELECT * FROM Paquetes 
WHERE Costo <= @costo
END

--Muestra el costo mayor al parametro ingresado
CREATE PROCEDURE Costo_Mayor(
@costoM FLOAT)
AS
BEGIN 
SELECT * FROM Paquetes 
WHERE Costo >= @costoM
END

GO

USE BoxTracking
GO
create function Seguimiento
(
@Id_Paquete int
)
returns int
as
begin
declare @Id_Seguimiento int
set @Id_Paquete = (case len(@Id_Paquete) when 1 then '0000' + @Id_Paquete
										 when 2 then '000' + @Id_Paquete
										 when 3 then '00' + @Id_Paquete
										 when 4 then '0' +@Id_Paquete
										 else
										 @Id_Paquete
										 end)
return  @Id_Seguimiento
end


select dbo.Seguimiento(12)

GO


