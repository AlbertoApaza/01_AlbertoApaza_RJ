-- CREAR LA BASE DE DATOS
CREATE DATABASE NuestraSC;

-- PONER EN USO LA BD
USE NuestraSC;

-- CREAR LA TABLA PERSONA
CREATE TABLE Persona 
(
	Id INT AUTO_INCREMENT,
    Nombre VARCHAR(80),
    Apellido VARCHAR(90),
    Email VARCHAR(80),
    Telefono CHAR(9),
    Mensaje VARCHAR(255),
    CONSTRAINT id_pk PRIMARY KEY (Id)
);

-- INSERTAR DATOS EN LA TB
INSERT INTO Persona(Nombre, Apellido, Email, Telefono, Mensaje) 
	VALUES 
		("JOHAN TOMAS", "MALASQUEZ VALERIO", "johan.malasquez@vallegrande.edu.pe", "903060835", "Funcionalidad a la pagina web"),
        ("OMAR RIVERA", "FELIX", "omar.rivera@vallegrande.edu.pe", "930720474", "Hola como estas"),
        ('PEDRO', 'RODRIGUEZ', 'pedrorodriguez@example.com', '97010014', "Hola como estas"),
		('ANA', 'GARCIA', 'anagarcia@example.com', '93072701', "Hola como estas"),
		('LUIS', 'GONZALES', 'luisgonzalez@example.com', '97099170', "Hola como estas");

-- SELECCIONAR O MOSTART LA TB
SELECT * FROM Persona;

-- MODIFICAR LOS DATOS DE LA TB x ID
UPDATE Persona set Nombre = "RIVERA OMAR", Apellido = "FELIX ROSAS" WHERE Id = 2;

-- ELIMINAR LOS DATOS DE LA TB X ID
DELETE FROM Persona WHERE Id = 3;

-- CREAR LA TABLA FECHA CIVICA
CREATE TABLE FechaCivica
(
	Id INT AUTO_INCREMENT,
    Fecha DATE,
    Evento VARCHAR(90),
    Descripcion VARCHAR(90),
    CONSTRAINT Id_pk PRIMARY KEY (Id)
);

-- INSERTAR DATOS EN LA TB
INSERT INTO FechaCivica (Fecha, Evento, Descripcion) 
VALUES 
	('2023-03-08', 'Día Internacional de la Mujer.', 'SE CELEBRA EL DIA INTERNACIONAL DE LA MUJER'),
    ('2023-03-14', 'Nacimiento de Albert Einstein.', 'SE CELEBRA EL NACIMIENTO DE ALBERT EINSTEIN'),
    ('2023-07-20', 'Día de la Independencia', 'Celebración del día en que el país logró su independencia.'),
	('2023-05-01', 'Día del Trabajo', 'Celebración del trabajo y los derechos laborales.'),
	('2023-05-14', 'Día de la Madre', 'Celebración en honor a las madres.');

-- SELECCIONAR O MOSTART LA TB
SELECT * FROM FechaCivica;

-- MODIFICAR LOS DATOS DE LA TB x ID
UPDATE FechaCivica SET Evento = "Día Internacional de la Mujer." WHERE Id = 1; 

-- ELIMINAR LOS DATOS DE LA TB X ID
DELETE FROM FechaCivica WHERE Id = 2;


-- PROCESO DE NOTA
CREATE TABLE CURSOS (
    id int  NOT NULL COMMENT 'Identificador único del curso',
    nombre_curso varchar(60)  NOT NULL COMMENT 'Nombre del Curso',
    CONSTRAINT CURSOS_pk PRIMARY KEY (id)
) COMMENT 'Eb esta tabla almacena información sobre los cursos ofrecidos  del colegio';

INSERT INTO CURSOS (id, nombre_curso) VALUES
(1, 'Matemáticas'),
(2, 'Lengua Española'),
(3, 'Historia'),
(4, 'Ciencias Naturales'),
(5, 'Educación Física');

-- Table: ESTUDIANTES
CREATE TABLE ESTUDIANTES (
    id int  NOT NULL COMMENT 'Identificador único del estudiante',
    Nombre Varchar(60)  NOT NULL COMMENT 'Nombre del estudiante',
    Apellido Varchar(60)  NOT NULL COMMENT 'Apellido del estudiante',
    Fecha_Nacimiento Date  NOT NULL COMMENT 'Fecha de nacimiento de estudiante',
    telefono Char(9)  NOT NULL COMMENT 'Numero de teléfono del estudiante',
    Grado Char(1)  NULL COMMENT 'Grado de estudiante',
    Seccion Varchar(1)  NOT NULL COMMENT 'Sección del estudiante',
    Nivel Varchar(10)  NOT NULL COMMENT 'Nivel del estudiante',
    Sexo Char(1)  NOT NULL COMMENT 'Sexo del estudiante',
    DNI Char(8)  NOT NULL COMMENT 'DNI del estudiante',
    Numero_de_documento Varchar(15)  NOT NULL COMMENT 'Numero de documentación del estudiante',
    CONSTRAINT ESTUDIANTES_pk PRIMARY KEY (id)
) COMMENT 'Esta tabla almacena información sobre los estudiantes inscritos en el colegio Nuestra Señora de la  Concepcion ';

INSERT INTO ESTUDIANTES (id, Nombre, Apellido, Fecha_Nacimiento, telefono, Grado, Seccion, Nivel, Sexo, DNI, Numero_de_documento) VALUES
(1, 'Juan', 'Pérez', '2005-02-15', '123456789', '10', 'A', 'Secundaria', 'M', '12345678', 'ABC123456'),
(2, 'Ana', 'Gómez', '2006-05-20', '987654321', '8', 'B', 'Primaria', 'F', '87654321', 'XYZ987654'),
(3, 'Carlos', 'López', '2003-11-10', '555666777', '12', 'C', 'Secundaria', 'M', '11223344', 'DEF112233'),
(4, 'María', 'Martínez', '2004-07-02', '111222333', '9', 'A', 'Primaria', 'F', '99887766', 'PQR998877'),
(5, 'Javier', 'Sánchez', '2007-03-25', '444555666', '11', 'B', 'Secundaria', 'M', '55443322', 'LMN554433');

-- Table: NOTAS
CREATE TABLE NOTAS (
    id int  NOT NULL COMMENT 'Identificador único de la calificación',
    calificacion decimal(4,2)  NOT NULL COMMENT 'Calificación numérica otorgada al estudiante en el curso',
    ESTUDIANTES_id int  NOT NULL,
    CURSOS_id int  NOT NULL,
    PROFESORES_id int  NOT NULL,
    CONSTRAINT NOTAS_pk PRIMARY KEY (id)
) COMMENT 'Esta tabla almacena las calificaciones de los estudiantes en los cursos.';

INSERT INTO NOTAS (id, calificacion, ESTUDIANTES_id, CURSOS_id, PROFESORES_id) VALUES
(1, 15.5, 1, 1, 1),
(2, 17.0, 2, 2, 2),
(3, 18.5, 3, 3, 3),
(4, 12.0, 4, 4, 4),
(5, 08.5, 5, 5, 5);

-- Table: PROFESORES
CREATE TABLE PROFESORES (
    id int  NOT NULL COMMENT 'Identificador del estudiante',
    nombre Varchar(60)  NOT NULL COMMENT 'Nombre del Profesor',
    apellido Varchar(60)  NOT NULL COMMENT 'Apellido del profesor',
    Correo_Electronico Varchar(80)  NULL COMMENT 'Dirección de correo electronico del Profesor',
    telefono Char(9)  NULL COMMENT 'Numero de telefono del Profesor',
    Sexo Char(1)  NOT NULL,
    DNI Char(8)  NOT NULL,
    CONSTRAINT PROFESORES_pk PRIMARY KEY (id)
) COMMENT 'En esta tabla almacena información sobre los profesores del colegio';

INSERT INTO PROFESORES (id, nombre, apellido, Correo_Electronico, telefono, Sexo, DNI) VALUES
(1, 'Profesor1', 'Apellido1', 'profesor1@email.com', '111222333', 'M', '11223344'),
(2, 'Profesor2', 'Apellido2', 'profesor2@email.com', '444555666', 'F', '22334455'),
(3, 'Profesor3', 'Apellido3', 'profesor3@email.com', '777888999', 'M', '33445566'),
(4, 'Profesor4', 'Apellido4', 'profesor4@email.com', '123456789', 'F', '44556677'),
(5, 'Profesor5', 'Apellido5', 'profesor5@email.com', '987654321', 'M', '55667788');

-- Reference: NOTAS_CURSOS (table: NOTAS)
ALTER TABLE NOTAS ADD CONSTRAINT NOTAS_CURSOS FOREIGN KEY NOTAS_CURSOS (CURSOS_id)
    REFERENCES CURSOS (id);

-- Reference: NOTAS_ESTUDIANTES (table: NOTAS)
ALTER TABLE NOTAS ADD CONSTRAINT NOTAS_ESTUDIANTES FOREIGN KEY NOTAS_ESTUDIANTES (ESTUDIANTES_id)
    REFERENCES ESTUDIANTES (id);

-- Reference: NOTAS_PROFESORES (table: NOTAS)
ALTER TABLE NOTAS ADD CONSTRAINT NOTAS_PROFESORES FOREIGN KEY NOTAS_PROFESORES (PROFESORES_id)
    REFERENCES PROFESORES (id);
    