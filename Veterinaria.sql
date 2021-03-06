CREATE DATABASE Veterinaria
go
Use Veterinaria
go
create table Persona(
	Id_Persona int Not Null IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) Not Null,
	Apellidos varchar(100) Not Null,
	Direccion varchar(300) Not Null,
	Telefono varchar(8) Not Null,
	Id_Estado int Not Null,
	Chk_Cliente bit Not Null,
	Chk_Empleado bit Not Null,
	Chk_Proveedor bit Not Null
);

create table Usuarios(
	Id_Usuario int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Empleado int Not Null,
	Correo varchar(60) Not Null,
	Usuario varchar(50) Not Null,
	Contraseña varchar(50) Not Null,
	Id_Rol int Not Null,
	Id_Estado int Not Null
);
go
create table Empleado(
	Id_Empleado int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Persona int Not Null,
	Id_Estado int Not Null
);
go
create table Proveedor(
	Id_Proveedor int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Persona int Not Null,
	Id_Estado int Not Null,
	Nombre_Empresa varchar(50) Not Null,
	Telefono_Empresa varchar(12) Not Null,
	Direccion_Empresa varchar(400) Not Null
);
go
create table Cliente(
	Id_Cliente int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Persona int Not Null,
	Id_Estado int Not Null
);
go
create table Producto(
	Id_Producto int Not Null IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) Not Null,
	Descripcion varchar(50) Not Null,
	Precio float Not Null,
	Cantidad int Not Null,
	Id_Proveedor int Not Null,
	Id_Categoria int Not Null,
	Id_Estado int Not Null
);
go
create table Estado(
	Id_Estado int Not Null IDENTITY(1,1) PRIMARY KEY,
	Descripcion varchar(50) Not Null,
);
go
create table Roles(
	Id_Rol int Not Null IDENTITY(1,1) PRIMARY KEY,
	Descripcion varchar(50) Not Null,
	Id_Estado int Not Null
);
go
create table Factura(
	Numero_Factura int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Empleado int Not Null,
	Id_Cliente int ,
	Id_Proveedor int ,
	Fecha date Not Null,
	Precio_Total int Not Null,
	Id_Estado int Not Null
);
go
create table Detalle_Factura(
	Id_Detalle int Not Null IDENTITY(1,1) PRIMARY KEY,
	Numero_Factura int Not Null,
	Id_Producto int Not Null,
	Cantidad int Not Null,
	Precio_Unitario int Not Null,
	Precio_Total_Producto int Not Null
);
go
create table Paciente(
	Id_Paciente int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Cliente int Not Null,
	Animal varchar(50) Not Null,
	Nombre varchar(50) Not Null,
	Sexo varchar(50) Not Null,
	Raza varchar(50) Not Null,
	Edad int Not Null,
	Peso int Not Null,
	Id_Estado int Not Null
);
go
create table Cita(
	Id_Cita int Not Null IDENTITY(1,1) PRIMARY KEY,
	Fecha date Not Null,
	Hora_Inico time Not Null,
	Hora_Final time Not Null,
	Estado_Cita varchar(50) Not Null,
	Id_Cliente int Not Null,
	Id_Empleado int Not Null,
	Id_Paciente int Not Null,
	Descripcion Varchar(600) Not Null,
	Costo_Total int Not Null,
	Id_Estado int Not Null
);
go
create table Detalle_Servicio(
	Id_Detalle_Servicio int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Cita int Not Null,
	Id_Servicio int Not Null,
	Cantidad int not null,
	Precio_Total int not null,
);
go
create table Detalle_Medicina(
	Id_Detalle_Medicina int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Cita int Not Null,
	Id_Producto int Not Null,
	Cantidad int not null,
	Precio_Total int not null,
);
go
create table Servicio(
	Id_Servicio int Not Null IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(50) Not Null,
	Detalle varchar(600) Not Null,
	Costo int Not Null,
	Tiempo float Not null,
	Id_Estado int Not Null
);
go
create table Categoria(
	Id_Categoria int Not Null IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) Not Null,
);
go
--Alter Table Cliente 
--Add CONSTRAINT FK_Persona_Cliente Foreign Key (Id_Cliente) references 
--Persona(Id_Persona)
--go
--Alter Table Empleado 
--Add CONSTRAINT FK_Persona_Empleado Foreign Key (Id_Empleado) references 
--Persona(Id_Persona)
--go
--Alter Table Proveedor 
--Add CONSTRAINT FK_Persona_Proveedor Foreign Key (Id_Proveedor) references 
--Persona(Id_Persona)
go
ALTER TABLE Cliente     
ADD CONSTRAINT FK_Persona_Cliente FOREIGN KEY (Id_Persona)     
    REFERENCES Persona (Id_Persona)     
go
ALTER TABLE Empleado     
ADD CONSTRAINT FK_Persona_Empleado FOREIGN KEY (Id_Persona)     
    REFERENCES Persona (Id_Persona)     
go
ALTER TABLE Proveedor     
ADD CONSTRAINT FK_Persona_Proveedor FOREIGN KEY (Id_Persona)     
    REFERENCES Persona (Id_Persona) 
go
ALTER TABLE Detalle_Factura     
ADD CONSTRAINT FK_Factura_Detalle_Factura FOREIGN KEY (Numero_Factura)     
    REFERENCES Factura (Numero_Factura) 
go
ALTER TABLE Detalle_Servicio    
ADD CONSTRAINT FK_Detalle_Servicio_Servicio FOREIGN KEY (Id_Servicio)     
    REFERENCES Servicio (Id_Servicio)          
go
ALTER TABLE Cita    
ADD CONSTRAINT FK_Cita_Cliente FOREIGN KEY (Id_Cliente)     
    REFERENCES Cliente (Id_Cliente)     
go
ALTER TABLE Cita    
ADD CONSTRAINT FK_Cita_Paciente FOREIGN KEY (Id_Paciente)     
    REFERENCES Paciente (Id_Paciente)     
go
ALTER TABLE Cita    
ADD CONSTRAINT FK_Cita_Empleado FOREIGN KEY (Id_Empleado)     
    REFERENCES Empleado (Id_Empleado)     
go
ALTER TABLE Detalle_Servicio     
ADD CONSTRAINT FK_Cita_Detalle_Servicio FOREIGN KEY (Id_Cita)     
    REFERENCES Cita (Id_Cita) 
go
ALTER TABLE Detalle_Medicina     
ADD CONSTRAINT FK_Cita_Detalle_Medicina FOREIGN KEY (Id_Cita)     
    REFERENCES Cita (Id_Cita) 
go
ALTER TABLE Detalle_Medicina    
ADD CONSTRAINT FK_Producto_Detalle_Medicina FOREIGN KEY (Id_Producto)     
REFERENCES Producto (Id_Producto) 
go
ALTER TABLE Detalle_Factura    
ADD CONSTRAINT FK_Producto_Detalle_Factura FOREIGN KEY (Id_Producto)     
REFERENCES Producto (Id_Producto) 
go
ALTER TABLE Factura    
ADD CONSTRAINT FK_Factura_Empleado FOREIGN KEY (Id_Empleado)     
REFERENCES Empleado (Id_Empleado) 
go
ALTER TABLE Factura    
ADD CONSTRAINT FK_Factura_Cliente FOREIGN KEY (Id_Cliente)     
REFERENCES Cliente (Id_Cliente) 
go
ALTER TABLE Paciente    
ADD CONSTRAINT FK_Paciente_Cliente FOREIGN KEY (Id_Cliente)     
REFERENCES Cliente (Id_Cliente) 
go
ALTER TABLE Usuarios    
ADD CONSTRAINT FK_Usuarios_Empleado FOREIGN KEY (Id_Empleado)     
REFERENCES Empleado (Id_Empleado) 
go
ALTER TABLE Usuarios    
ADD CONSTRAINT FK_Usuarios_Roles FOREIGN KEY (Id_Rol)     
REFERENCES Roles (Id_Rol) 
go
ALTER TABLE Persona    
ADD CONSTRAINT FK_Persona_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado) 
go
ALTER TABLE Cita    
ADD CONSTRAINT FK_Cita_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado) 
go
ALTER TABLE Cliente    
ADD CONSTRAINT FK_Clientea_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado) 
go
ALTER TABLE Empleado    
ADD CONSTRAINT FK_Empleado_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado) 
go
ALTER TABLE Factura    
ADD CONSTRAINT FK_Factura_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
go
ALTER TABLE Servicio
ADD CONSTRAINT FK_Servicio_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado(Id_Estado)
go
ALTER TABLE Paciente    
ADD CONSTRAINT FK_Paciente_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
go
ALTER TABLE Producto    
ADD CONSTRAINT FK_Producto_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
go
ALTER TABLE Proveedor    
ADD CONSTRAINT FK_Proveedor_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
go
ALTER TABLE Roles    
ADD CONSTRAINT FK_Roles_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
go
ALTER TABLE Usuarios    
ADD CONSTRAINT FK_Usuarios_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
go
ALTER TABLE Producto    
ADD CONSTRAINT FK_Proveedor_Producto FOREIGN KEY (Id_Proveedor)     
REFERENCES Proveedor (Id_Proveedor)
go
ALTER TABLE Producto    
ADD CONSTRAINT FK_Proveedor_Categoria FOREIGN KEY (Id_Categoria)     
REFERENCES Categoria (Id_Categoria)
go
ALTER TABLE Factura    
ADD CONSTRAINT FK_Proveedor_Factura FOREIGN KEY (Id_Proveedor)     
REFERENCES Proveedor (Id_Proveedor)
go
INSERT INTO Estado(Descripcion) VALUES ('Activo');
go
INSERT INTO Estado (Descripcion) VALUES ('Desactivado');
go
INSERT INTO Roles (Descripcion,Id_Estado) VALUES ('Administrador',1);
go
INSERT INTO Roles (Descripcion,Id_Estado) VALUES ('Cajero',1);
go
INSERT INTO Roles (Descripcion,Id_Estado) VALUES ('Doctor',1);
go
INSERT INTO Roles (Descripcion,Id_Estado) VALUES ('Invetario',1);
go
INSERT INTO Persona(Nombre,Apellidos,Telefono,Direccion,Id_Estado,Chk_Cliente,Chk_Empleado,Chk_Proveedor) 
VALUES ('Alejandro','Villalobos','85207410','Calle 124',1,1,1,0);
go
INSERT INTO Persona(Nombre,Apellidos,Telefono,Direccion,Id_Estado,Chk_Cliente,Chk_Empleado,Chk_Proveedor)  
VALUES ('Santiago','Villalobos','85654110','Calle 123',1,1,1,0);
go
INSERT INTO Persona(Nombre,Apellidos,Telefono,Direccion,Id_Estado,Chk_Cliente,Chk_Empleado,Chk_Proveedor)  
VALUES ('Marlon','Villalobos','85208520','Calle 122',1,0,1,1);
go
INSERT INTO Persona(Nombre,Apellidos,Telefono,Direccion,Id_Estado,Chk_Cliente,Chk_Empleado,Chk_Proveedor)  
VALUES ('Leonardo','Villalobos','87854410','Calle 121',1,0,1,1);
go
INSERT INTO Empleado(Id_Persona,Id_Estado) VALUES (1,1);
go
INSERT INTO Empleado(Id_Persona,Id_Estado) VALUES (2,1);
go
INSERT INTO Empleado(Id_Persona,Id_Estado) VALUES (3,1);
go
INSERT INTO Empleado(Id_Persona,Id_Estado) VALUES (4,1);
go
INSERT INTO Cliente(Id_Persona,Id_Estado) VALUES (1,1);
go
INSERT INTO Cliente(Id_Persona,Id_Estado) VALUES (2,1);
go
INSERT INTO Proveedor(Id_Persona,Nombre_Empresa,Telefono_Empresa,Direccion_Empresa,Id_Estado) VALUES (3,'Empresa1','Telefono1','Direccion1',1);
go
INSERT INTO Proveedor(Id_Persona,Nombre_Empresa,Telefono_Empresa,Direccion_Empresa,Id_Estado) VALUES (4,'Empresa2','Telefono2','Direccion2',1);
go
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (1,'alevillacha360@hotmail.com','admin','admin',1,1);
go
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (2,'alenano360@hotmail.com','cajero','cajero',1,1);
go
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (3,'alevilla360@hotmail.com','doctor','doctor',1,1);
go
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (4,'alecha360@hotmail.com','inven','inven',1,1);
go
INSERT INTO Categoria(Nombre) VALUES ('Producto');
go
INSERT INTO Categoria(Nombre) VALUES ('Medicina');
go