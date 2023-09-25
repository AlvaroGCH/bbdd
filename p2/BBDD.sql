DROP DATABASE IF EXISTS libreria;
CREATE DATABASE IF NOT EXISTS libreria;
use libreria;
CREATE TABLE Autor(
	nombre_autor VARCHAR(20) PRIMARY KEY,
	direccion VARCHAR(40),
	ano_nacimiento DATE
);
CREATE TABLE Editores(
	nombre_editor VARCHAR(20) PRIMARY KEY,
	direccion_editor VARCHAR(40),
	web VARCHAR(30),
	telefono_editor Numeric(11,0)
);
CREATE TABLE Libro(
	ISBN VARCHAR(20) PRIMARY KEY,
	precio INT,
	titulo VARCHAR(80),
	ano_publicacion DATE,
	nombre_editor VARCHAR(20),
	FOREIGN KEY(nombre_editor)
	REFERENCES Editores (nombre_editor)
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Clientes(
	email VARCHAR(40) PRIMARY KEY,
	nombre_cliente VARCHAR(20),
	direccion_cliente VARCHAR(40),
	telefono_cliente Numeric(11,0)
);
CREATE TABLE Cesta(
	id_cesta INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(40),
	FOREIGN KEY(email)
	REFERENCES Clientes (email)
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Ejemplar(
	id_ejemplar INT PRIMARY KEY AUTO_INCREMENT,
	ISBN VARCHAR(20),
	FOREIGN KEY(ISBN)
	REFERENCES Libro (ISBN)
	ON DELETE CASCADE ON UPDATE CASCADE,
	id_cesta INT,
	FOREIGN KEY(id_cesta)
	REFERENCES Cesta(id_cesta)
	ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Almacen(
	id_almacen INT PRIMARY KEY AUTO_INCREMENT,
	nombre_almacen varchar(20)
);
CREATE TABLE EjemplarAlmacen(
	id_ejemplar INT,
	FOREIGN KEY(id_ejemplar)
	REFERENCES Ejemplar(id_ejemplar)
	ON DELETE CASCADE ON UPDATE CASCADE,
	id_almacen INT,
	FOREIGN KEY(id_almacen)
	REFERENCES Almacen(id_almacen)
	ON DELETE CASCADE ON UPDATE CASCADE,
	Stock INT
);
CREATE TABLE LibroAutor(
	ISBN VARCHAR(20),
	FOREIGN KEY(ISBN)
	REFERENCES Libro(ISBN)
	ON DELETE CASCADE ON UPDATE CASCADE,
	nombre_autor VARCHAR(20),
	FOREIGN KEY(nombre_autor)
	REFERENCES Autor(nombre_autor)
	ON DELETE CASCADE ON UPDATE CASCADE
);

/* Para evitar errores al insertar datos con FK*/
SET FOREIGN_KEY_CHECKS=0;

INSERT INTO Autor(nombre_autor,direccion,ano_nacimiento)
	VALUES ('Alejandro','Juan Bravo 66','1963-09-24'),
	('Beatriz','Giralda 43','1978-08-06'),
	('Carlos','Alcudia 4','1977-04-19'),
	('Daniel','Sorpresa 8','1980-02-17'),
	('Francisco','Roncesvalles ','1989-01-09'),
	('Irene','Misterio 30','1995-03-22'),
	('Juan','Delicias 3','2000-10-30'),
	('Julio','Rosalia 12','1990-12-01'),
	('María','Benito 15','2000-03-02'),
	('Rubén','Foliasero 30','1960-06-21');

INSERT INTO Clientes(nombre_cliente, direccion_cliente, telefono_cliente, email)
	VALUES ('Ángeles','Milagros 9',654239186,'angeles@gmail.com'),
	('Diana','Filigranas 26',619324984,'dianatur@hotmail.es'),
	('Hugo','Vicotria 8',657832129,'hugoV@gmail.com'),
	('Jorge','Guerrero 1',698765432,'jorge23@gmail.com'),
	('Leticia','Corredor 54',609314562,'leti@hotmail.com'),
	('Maite','Ciencia 34',678201255,'maite@gmail.com'),
	('Monica','Virgen 7',666198254,'monichu@gmail.com'),
	('Natalia','San mateo 12',654444198,'nati@gmail.com'),
	('Sonia','San cristóbal 10',679123123,'sonia12@hotmail.com'),
	('Eugenio','Colón 4',677773291,'uge@gmail.com');
	
INSERT INTO Cesta(email)
    VALUES ('angeles@gmail.com'),
	('dianatur@hotmail.es'),
	('hugoV@gmail.com'),
	('jorge23@gmail.com'),
	('leti@hotmail.com'),
	('maite@gmail.com'),
	('monichu@gmail.com'),
	('jorge23@gmail.com'),
	('nati@gmail.com'),
	('sonia12@hotmail.com'),
	('ebenfordg@google.ca'),
	('shardistry5@amazon.de'),
	('mmenicombf@jigsy.com'),
	('nati@gmail.com'),
	('sonia12@hotmail.com'),
	('uge@gmail.com'),
	('jorge23@gmail.com'),
	('angeles@gmail.com'),
	('nati@gmail.com'),
	('angeles@gmail.com'),
	('hugoV@gmail.com');

INSERT INTO Editores(nombre_editor, direccion_editor, telefono_editor, web)
	VALUES ('Alberto','Barajas de melo 24',633328475,'alberto.es'),
	('Álvaro','Las avenidas 13',639284756,'alvaro.es'),
	('Cristiano','La plazuela 6',678912345,'cris.es'),
	('Javier','Gregorio Marañon 6',674839156,'javier.es'),
	('Jose Luis','Los timbales ',610558832,'joselu.blogspot'),
	('Lucía','Primavera 7',620394857,'lucia.com'),
	('Nuria','Rompecuellos 26',628394857,'nuria.com'),
	('Pablo','Otomira 2',690234512,'pablo.es'),
	('Rocío','Geronimo 13',699112348,'rocio.com'),
	('Rodolfo','Germanos 20',663524123,'rodolfo.es');

INSERT INTO Libro(ISBN, precio, titulo, ano_publicacion, nombre_editor)
	VALUES ('1111W',15,'Soledad','2011-02-01','Pablo'),
	('1212R',17,'Lágrimas','2010-09-03','Lucía'),
	('1313M',20,'La vida','1990-01-01','Javier'),
	('1414M',15,'Rompecorazones','2001-01-02','Rocio'),
	('1414O',20,'Antaño','2022-12-12','Javier'),
	('1515M',40,'Locura','2002-01-03','Álvaro'),
	('1616A',35,'Reir','2001-02-02','Rodolfo'),
	('1616L',15,'Pasión','2000-02-01','Rodolfo'),
	('4040K',35,'Vientos cortantes','2006-10-10','Pablo'),
	('4040T',13,'Sol y luna','2009-05-02','Cristiano');
	
	
	
INSERT INTO Almacen(nombre_almacen)
	Values ('Almacen 1'),
	('Almacen 2'),
	('Almacen 3'),
	('Almacen 4'),
	('Almacen 5'),
	('Almacen 6'),
	('Almacen 7'),
	('Almacen 8'),
	('Almacen 9'),
	('Almacen 10');

INSERT INTO Ejemplar(id_cesta, ISBN)
	VALUES (4,'4040K'),
	(1,'1212R'),(3,'1111W'),
	(2,'4040T'),
	(7,'1414O'),
	(9,'1313M'),
	(10,'1515M'),
	(5,'1414M'),
	(8,'1616L'),
	(6,'1616A');

INSERT INTO EjemplarAlmacen(id_ejemplar, id_almacen, Stock)
	VALUES (2, 8, 10),
	(1, 10, 16),
	(3, 2, 12),
	(5, 2, 10),
	(7, 2, 18),
	(6, 3, 20),
	(9, 6, 5),
	(10, 8, 7),
	(8, 3, 16),
	(4, 3, 18);

INSERT INTO LibroAutor(ISBN, nombre_autor)
	VALUES ('Julio','4040K'),
	('Alejandro','1515M'),
	('Maria','1616L'),
	('Julio','1212R'),
	('Daniel','4040T'),
	('Alejandro','4040T'),
	('Rubén','1111W'),
	('Carlos','1212R'),
	('Irene','1414O'),
	('Beatriz','1616L');