
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
	Estado int Not Null,
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
	Precio int Not Null,
	Precio_Total_Producto int Not Null,
	Precio_Unitario int Not Null,
);
go
create table Paciente(
	Id_Paciente int Not Null IDENTITY(1,1) PRIMARY KEY,
	Id_Cliente int Not Null,
	Animal varchar(50) Not Null,
	Raza varchar(50) Not Null,
	Edad int Not Null,
	Peso int Not Null,
	Id_Estado int Not Null
);
go
create table Cita_Medica(
	Id_Cita_Medica int Not Null IDENTITY(1,1) PRIMARY KEY,
	Fecha date Not Null,
	Hora time Not Null,
	Id_Medicina int Not Null,
	Id_Cliente int Not Null,
	Id_Paciente int Not Null,
	Descripcion Varchar(600) Not Null,
	Id_Estado int Not Null
);
go
create table Medicina(
	Id_Medicina int Not Null IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(50) Not Null,
	Id_Estado int Not Null
);
--go
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
ALTER TABLE Cita_Medica    
ADD CONSTRAINT FK_Cita_Medica_Medicina FOREIGN KEY (Id_Medicina)     
    REFERENCES Medicina (Id_Medicina)          
go
ALTER TABLE Cita_Medica    
ADD CONSTRAINT FK_Cita_Medica_Cliente FOREIGN KEY (Id_Cliente)     
    REFERENCES Cliente (Id_Cliente)     
go
ALTER TABLE Cita_Medica    
ADD CONSTRAINT FK_Cita_Medica_Paciente FOREIGN KEY (Id_Paciente)     
    REFERENCES Paciente (Id_Paciente)     
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
ALTER TABLE Cita_Medica    
ADD CONSTRAINT FK_Cita_Medica_Estado FOREIGN KEY (Id_Estado)     
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
ALTER TABLE Medicina    
ADD CONSTRAINT FK_Medicina_Estado FOREIGN KEY (Id_Estado)     
REFERENCES Estado (Id_Estado)
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
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (2,'alevillacha360@hotmail.com','cajero','cajero',1,1);
go
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (3,'alevillacha360@hotmail.com','doctor','doctor',1,1);
go
INSERT INTO Usuarios(Id_Empleado,Correo,Usuario,Contraseña,Id_Rol,Id_Estado) VALUES (4,'alevillacha360@hotmail.com','inven','inven',1,1);
