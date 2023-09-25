-- Estructura

CREATE TABLE `Activa` (
  `ISBN_libro` varchar(100) DEFAULT NULL,
  `id_cesta` int(11) DEFAULT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  KEY `Activa_FK` (`email_cliente`),
  KEY `Activa_FK_1` (`id_cesta`),
  KEY `Activa_FK_2` (`ISBN_libro`),
  CONSTRAINT `Activa_FK` FOREIGN KEY (`email_cliente`) REFERENCES `Cliente` (`email`),
  CONSTRAINT `Activa_FK_1` FOREIGN KEY (`id_cesta`) REFERENCES `Cesta` (`id_cesta`),
  CONSTRAINT `Activa_FK_2` FOREIGN KEY (`ISBN_libro`) REFERENCES `Libros` (`isbn`)
);

CREATE TABLE `Almacen` (
  `id_almacen` int(11) NOT NULL,
  `stock_ejemplares` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_almacen`)
);

CREATE TABLE `Autores` (
  `Nombre_autor` varchar(100) NOT NULL,
  `dirección` varchar(100) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`Nombre_autor`)
);

CREATE TABLE `Cesta` (
  `id_cesta` int(11) NOT NULL,
  `num_libros` int(11) DEFAULT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cesta`),
  KEY `Cesta_FK` (`email_cliente`),
  CONSTRAINT `Cesta_FK` FOREIGN KEY (`email_cliente`) REFERENCES `Cliente` (`email`)
);

CREATE TABLE `Cliente` (
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
);

CREATE TABLE `Editor` (
  `nombre_editor` varchar(100) NOT NULL,
  `direccion_editor` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nombre_editor`)
);

CREATE TABLE `Ejemplares` (
  `id_ejemplar` int(11) NOT NULL,
  `id_almacen` int(11) DEFAULT NULL,
  `id_cesta` int(11) DEFAULT NULL,
  `id_libro` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ejemplar`),
  KEY `Ejemplares_FK` (`id_almacen`),
  KEY `Ejemplares_FK_1` (`id_cesta`),
  KEY `Ejemplares_FK_2` (`id_libro`),
  CONSTRAINT `Ejemplares_FK` FOREIGN KEY (`id_almacen`) REFERENCES `Almacen` (`id_almacen`),
  CONSTRAINT `Ejemplares_FK_1` FOREIGN KEY (`id_cesta`) REFERENCES `Cesta` (`id_cesta`),
  CONSTRAINT `Ejemplares_FK_2` FOREIGN KEY (`id_libro`) REFERENCES `Libros` (`isbn`)
);

CREATE TABLE `Escribe` (
  `nombre_autor` varchar(100) DEFAULT NULL,
  `isbn_libro` varchar(100) DEFAULT NULL,
  KEY `Escribe_FK` (`isbn_libro`),
  KEY `Escribe_FK_1` (`nombre_autor`),
  CONSTRAINT `Escribe_FK` FOREIGN KEY (`isbn_libro`) REFERENCES `Libros` (`isbn`),
  CONSTRAINT `Escribe_FK_1` FOREIGN KEY (`nombre_autor`) REFERENCES `Autores` (`Nombre_autor`)
);

CREATE TABLE `Libros` (
  `isbn` varchar(100) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `año` date DEFAULT NULL,
  `nombre_editor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `Libros_FK` (`nombre_editor`),
  CONSTRAINT `Libros_FK` FOREIGN KEY (`nombre_editor`) REFERENCES `Editor` (`nombre_editor`)
);

-- Inserts

INSERT INTO `Activa` VALUES ('1313M',1,'dianatur@hotmail.es'),('1313M',3,'nati@gmail.com'),('1414M',1,'dianatur@hotmail.es'),('1111W',4,'sonia12@hotmail.com'),('1313M',2,'hugoV@gmail.com'),('4040T',3,'nati@gmail.com'),('1212R',4,'sonia12@hotmail.com'),('1515M',4,'sonia12@hotmail.com'),('4040K',4,'sonia12@hotmail.com'),('1616L',3,'nati@gmail.com');

INSERT INTO `Almacen` VALUES (1,2),(2,1),(3,2),(4,3),(5,0),(6,5),(7,2),(8,2),(9,1),(10,1);

INSERT INTO `Autores` VALUES ('Alejandro','Juan Bravo 66','1963-09-24'),('Beatriz','Giralda 43','1978-08-06'),('Carlos','Alcudia 4','1977-04-19'),('Daniel','Sorpresa 8','1980-02-17'),('Francisco','Roncesvalles ','1989-01-09'),('Irene','Misterio 30','1995-03-22'),('Juan','Delicias 3','2000-10-30'),('Julio','Rosalia 12','1990-12-01'),('María','Benito 15','2000-03-02'),('Rubén','Foliasero 30','1960-06-21');

INSERT INTO `Cesta` VALUES (1,2,'dianatur@hotmail.es'),(2,1,'hugoV@gmail.com'),(3,3,'nati@gmail.com'),(4,4,'sonia12@hotmail.com'),(5,0,'jorge23@gmail.com'),(6,0,'monichu@gmail.com'),(7,0,'maite@gmail.com'),(8,0,'leti@hotmail.com'),(9,0,'angeles@gmail.com'),(10,0,'uge@gmail.com');

INSERT INTO `Cliente` VALUES ('Ángeles','Milagros 9',654239186,'angeles@gmail.com'),('Diana','Filigranas 26',619324984,'dianatur@hotmail.es'),('Hugo','Vicotria 8',657832129,'hugoV@gmail.com'),('Jorge','Guerrero 1',698765432,'jorge23@gmail.com'),('Leticia','Corredor 54',609314562,'leti@hotmail.com'),('Maite','Ciencia 34',678201255,'maite@gmail.com'),('Monica','Virgen 7',666198254,'monichu@gmail.com'),('Natalia','San mateo 12',654444198,'nati@gmail.com'),('Sonia','San cristóbal 10',679123123,'sonia12@hotmail.com'),('Eugenio','Colón 4',677773291,'uge@gmail.com');

INSERT INTO `Editor` VALUES ('Alberto','Barajas de melo 24','633328475','alberto.es'),('Álvaro','Las avenidas 13','639284756','alvaro.es'),('Cristiano','La plazuela 6','678912345','cris.es'),('Javier','Gregorio Marañon 6','674839156','javier.es'),('Jose Luis','Los timbales ','610558832','joselu.blogspot'),('Lucía','Primavera 7','620394857','lucia.com'),('Nuria','Rompecuellos 26','628394857','nuria.com'),('Pablo','Otomira 2','690234512','pablo.es'),('Rocío','Geronimo 13','699112348','rocio.co '),('Rodolfo','Germanos 20','663524123','rodolfo.es');

INSERT INTO `Ejemplares` VALUES (1,1,4,'4040K'),(2,3,1,'1212R'),(3,2,3,'1111W'),(4,2,2,'4040T'),(5,1,7,'1414O'),(6,5,9,'1313M'),(7,6,10,'1515M'),(8,3,5,'1414M'),(9,9,8,'1616L'),(10,8,6,'1616A');

INSERT INTO `Escribe` VALUES ('Julio','4040K'),('Alejandro','1515M'),('Maria','1616L'),('Julio','1212R'),('Daniel','4040T'),('Alejandro','4040T'),('Rubén','1111W'),('Carlos','1212R'),('Irene','1414O'),('Beatriz','1616L');

INSERT INTO `Libros` VALUES ('1111W',15,'Soledad','2011-02-01','Pablo'),('1212R',17,'Lágrimas','2010-09-03','Lucía'),('1313M',20,'La vida','1990-01-01','Javier'),('1414M',15,'Rompecorazones','2001-01-02','Rocio'),('1414O',20,'Antaño','2022-12-12','Javier'),('1515M',40,'Locura','2002-01-03','Álvaro'),('1616A',35,'Reir','2001-02-02','Rodolfo'),('1616L',15,'Pasión','2000-02-01','Rodolfo'),('4040K',35,'Vientos cortantes','2006-10-10','Pablo'),('4040T',13,'Sol y luna','2009-05-02','Cristiano');