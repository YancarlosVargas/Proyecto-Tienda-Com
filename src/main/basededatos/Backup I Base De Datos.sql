-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_com
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Admin',1),(2,'Cliente',1),(3,'Usuario',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` int NOT NULL,
  `idsexo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `idcliente_sexo_idx` (`idsexo`),
  CONSTRAINT `idcliente_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123,1,'Johan','312020202020','johanvanegas@gmail.com','Quibdo',1,'2023-10-09','Cedula'),(127,1,'1','11','1','1',1,'2003-12-12','1'),(322,1,'djwojwdo','1122121','1211','ewew',1,'2023-10-04','Nit'),(999,2,'joj','oj','ojo','ojoj',1,'2023-10-04','Tarjeta de Identidad'),(1234,1,'1','1','1','1',1,'2023-11-09','Pasaporte'),(2334,3,'jajdwwdopj','oo','joj','fefee',1,'2023-10-10','Tarjeta de Identidad'),(21112,2,'1','121','232','1',1,'2023-10-04','Tarjeta de Identidad'),(77474,2,'JOOOOOOOOOOOOOO','jawdpojowjpoawd','32332','1',0,'2023-10-03','Seleccionar:'),(121211,1,'1','1','1','1',1,'2023-11-01','Tarjeta de Identidad'),(1233333,2,'11','11','1','1',0,'2023-11-15','Cedula'),(1929292,2,'EA','1','1','1',0,'2023-11-13','Cedula');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_com_prod`
--

DROP TABLE IF EXISTS `fact_com_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_com_prod` (
  `idfact_com_prod` int NOT NULL AUTO_INCREMENT,
  `idfact_com` int NOT NULL,
  `idpro` int NOT NULL,
  `cantidad_com` int NOT NULL,
  `pre_uni` int NOT NULL,
  `pre_total` int NOT NULL,
  PRIMARY KEY (`idfact_com_prod`),
  KEY `idproducto_idx` (`idpro`),
  KEY `idfact_comp_idx` (`idfact_com`),
  CONSTRAINT `idfact_comp` FOREIGN KEY (`idfact_com`) REFERENCES `fact_comp` (`idfact_comp`),
  CONSTRAINT `idpro` FOREIGN KEY (`idpro`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_com_prod`
--

LOCK TABLES `fact_com_prod` WRITE;
/*!40000 ALTER TABLE `fact_com_prod` DISABLE KEYS */;
INSERT INTO `fact_com_prod` VALUES (24,16,1,122,122,14884),(25,13,2,8989,7878,70815342),(26,13,1,1,1,1),(27,13,3,800,111,88800),(28,18,3,5,10000,50000),(29,18,3,5,10000,50000),(30,18,4,5,10000,50000),(31,13,1,2,1000,2000),(32,17,1,2,1000,2000),(33,19,4,9999,9999,99980001),(34,18,20,444,444,197136),(35,18,20,444,444,197136);
/*!40000 ALTER TABLE `fact_com_prod` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Total_Compra` BEFORE INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
set new.pre_total = new.cantidad_com * new.pre_uni;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Cantidad_Precio` AFTER INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
update producto inner join fact_com_prod on fact_com_prod.idpro = producto.idproducto set cantidad = cantidad + new.cantidad_com, precio = new.pre_uni+ (new.pre_uni*0.20) where idpro = producto.idproducto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fact_comp`
--

DROP TABLE IF EXISTS `fact_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_comp` (
  `idfact_comp` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `idusu` int NOT NULL,
  `fecha` date NOT NULL,
  `total_comp` int NOT NULL,
  `descuento` float DEFAULT NULL,
  `tipodepago` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  PRIMARY KEY (`idfact_comp`),
  KEY `idProveedor_idx` (`idProveedor`),
  KEY `idusuario_idx` (`idusu`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_comp`
--

LOCK TABLES `fact_comp` WRITE;
/*!40000 ALTER TABLE `fact_comp` DISABLE KEYS */;
INSERT INTO `fact_comp` VALUES (13,1,2,'2005-12-12',1,1,'bombaclaw',1,0),(14,1,2121,'2023-11-19',1,1,'Efectivo',1,0),(15,1,2121,'2023-11-19',1,1,'Seleccionar:',1,0),(16,1,2121,'2023-11-19',1,1,'Tarjeta de Credito',1,0),(17,1,2121,'2023-11-19',1,1,'Tarjeta de Credito',0,0),(18,1,19191,'2023-11-22',0,0,'Tarjeta de Credito',1,0),(19,1,2838,'2023-11-22',0,0,'Tarjeta de Credito',1,0),(20,1,19191,'2023-11-22',0,0.19,'Tarjeta de Credito',1,0),(21,1,19191,'2023-11-22',0,0.19,'Efectivo',1,0),(22,1,2838,'2023-11-24',0,0.19,'Tarjeta de Credito',1,0),(23,1,19191,'2023-11-24',0,0.19,'Efectivo',0,0),(24,3,19191,'2023-11-24',0,0.19,'Tarjeta de Credito',1,0),(25,3,2,'2023-11-24',0,0.19,'Efectivo',1,0),(26,3,2121,'2023-11-30',0,0.19,'Tarjeta de Credito',1,2),(28,3,1,'2023-11-30',0,0.19,'111',1,11);
/*!40000 ALTER TABLE `fact_comp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipopago` varchar(45) NOT NULL,
  `impuesto` float NOT NULL,
  `totalfactura` float NOT NULL,
  `cedula` int NOT NULL,
  `idusuario` int NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `cedula_idx` (`cedula`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `cliente` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2001-10-12','BEMBITA',0.19,1,123,1,1,0),(7,'2023-11-29','1',0.19,1,123,1,1,0),(11,'2023-11-29','Tarjeta de Credito',0.19,1,21112,2,1,0);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_cargo`
--

DROP TABLE IF EXISTS `mostrar_cargo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cargo` AS SELECT 
 1 AS `idcargo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_cliente`
--

DROP TABLE IF EXISTS `mostrar_cliente`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cliente` AS SELECT 
 1 AS `Cedula`,
 1 AS `Genero`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_detalle_factura`
--

DROP TABLE IF EXISTS `mostrar_detalle_factura`;
/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_detalle_factura` AS SELECT 
 1 AS `IdentificadorFacturaCompra`,
 1 AS `Producto`,
 1 AS `CantidadComprada`,
 1 AS `PrecioUnitario`,
 1 AS `PrecioTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_factura_compra`
--

DROP TABLE IF EXISTS `mostrar_factura_compra`;
/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_factura_compra` AS SELECT 
 1 AS `Identificador`,
 1 AS `IdProveedor`,
 1 AS `IdUsuario`,
 1 AS `Fecha`,
 1 AS `TotalCompra`,
 1 AS `Descuento`,
 1 AS `TipoDePago`,
 1 AS `NumeroDeComprobante`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_producto`
--

DROP TABLE IF EXISTS `mostrar_producto`;
/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_producto` AS SELECT 
 1 AS `Identificador`,
 1 AS `NombreDelProducto`,
 1 AS `DescripcionDelProducto`,
 1 AS `Existencias`,
 1 AS `ImagenDelProducto`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_proveedor`
--

DROP TABLE IF EXISTS `mostrar_proveedor`;
/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_proveedor` AS SELECT 
 1 AS `Identificacion`,
 1 AS `Genero`,
 1 AS `TipoDeDocumento`,
 1 AS `Nombre`,
 1 AS `Correo`,
 1 AS `Telefono`,
 1 AS `Direccion`,
 1 AS `TipoDePersona`,
 1 AS `FechaDeNacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_sexo`
--

DROP TABLE IF EXISTS `mostrar_sexo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_sexo` AS SELECT 
 1 AS `idsexo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_usuario`
--

DROP TABLE IF EXISTS `mostrar_usuario`;
/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_usuario` AS SELECT 
 1 AS `Identificador`,
 1 AS `Genero`,
 1 AS `Cargo`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_venta`
--

DROP TABLE IF EXISTS `mostrar_venta`;
/*!50001 DROP VIEW IF EXISTS `mostrar_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_venta` AS SELECT 
 1 AS `Identificador`,
 1 AS `Fecha`,
 1 AS `TipoDePago`,
 1 AS `Impuesto`,
 1 AS `TotalFactura`,
 1 AS `Cedula`,
 1 AS `IDUsuario`,
 1 AS `NumeroDeComprobante`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` longblob,
  `precio` float NOT NULL,
  `condicion` tinyint NOT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Mouse','Funciona',20926,NULL,532.8,1,''),(2,'TV','nose',20890,_binary 'Ã¿ÃÃ¿Ã \0JFIF\0\0\0\0\0\0Ã¿Ã\0C\0\n\n\Z \"\"\ZÃ¿Ã\0C\r\rÃ¿Ã\0\0h\0h\0Ã¿Ã\0\0\0\0\0\0\0\0\0\0\0\0\0	Ã¿Ã\0A\0\0\0\0\0\0!1Q\"Aaq2ÂÂÂ¡	$BÂ#3Â±Â²Ã%RSTdrÂ¢Â³ÃÃ¡Ã±Ã¿Ã\0\Z\0\0\0\0\0\0\0\0\0\0\0\0Ã¿Ã\01\0\0\0\0\0\0\0!1AQaqÂÂ\"2Â¡Â±Ã°#Ã3BSÃ¡ÃÃ¿Ã\0\0\0?\0ÃÃª\0Â \n\0Â \n\0Â \n\0Â \n\0Â \n\0Â \n\0Â \n\0Â \n\0Â +ÃÂ®ÃµÂÃÃÃKÂ¥Ã¦,Â¹)ÂÃ¹ÂÃqÂÃJÂÃWÂÂ§VÂÂ~9Ã£Âµ	QÂ´ÃqDZÃ¿\0hÂLÃ¦a2Â¬ÂºÂª\"Ã½}ÂÂSÃ¹Â¥ÃÃ¾Â pÂ·xÃÃ¨Ã´Ã ÂÃµÃªÃ¥?Ã¯6ÂÂÂ¡@4[Ã¼UÃ´rÃ¤pÃP,Ã¨?Ã±*[Ã·ÂÂ¶ÃÃÂ]ÃL\rqÂ¦Â¥v\r]XQÃ¼Â·Ã¦ÂiÂsÂqNÃ¨ÂÃ£ÃOÂ«.Â¥cÃ´4V~Â¿ÂÃ»@@@Â©Ã¾Ã{`ÂÃfÂ¤mÃÂyÂÃ±>ÂIqÂ¿Ã³ÂGÂ¡ÃÂ¬ÂÂ­Ã¶Ã·QlÂÃÃÃJÃÂ¦AÃ³ÃÂ¼HP=ÂÂlÃ\'ÂÂÃFÃ±Ã¡/iÃÃµ$Â½ÂÃÂ¶<x,Ã+\'rÃ¼ÃÂ«Â¼1ÃºÃ¼jeuGÂ9N\nÃÃ¢ÃÂÃiÃÃBÂ¶Ã¹ÂÃÂ%Ã£Â´ÂÂ´Â¥_ÃÃ$ÃÃºÂ¬#Ã³\'ÃªÂÃ°G#Â¡ÃÃ¯Ã¥ÃµY\\mjgÃÃ¥4YRrx<Ã·Ã¬/ÂtOÂ±Â¥ÃÂ¥ÂXÃ¸Ã¬sVÂ¶Âµ7Ku^ÂÃÂAÂ\rÂÃTÂÂ¨Â#ÃÃ=Ã«\'ÂÂfÂÃ´EÂ½Ã¡ÃÃ©~ÂÃ=kÂ{Â»Â¦*Ã®Â¹z\ZgÃ	-6ÃÂw!\\Ã±ÃIÃ¯ÂÃzÃÂ¥vÂ¬ÃªÃ Ã¬*JÂÂ´@@Ã£Ã/ÃÂµÂ}Ã©BÃDy	RÂ»Â\rÂÃ®ÃCtÂ¬Â´ Ã§%Â»9Â¯kÂ¹\"$Â£yÃ±ÂÂÃ­RRÂÃ\nÃÂ·ÃÂ¡Ã£SÃÃ,QxÂ¥\rÂ6$Â¸Â³ÂmÂ²ÂÃ£Ã»VÂuÃÂÂÃÂ³Â	Â­Âµ83OÂ:3Ã­ÃÂ¸ÃÃÃÃ¤Â¡\n[#zÃÃÂSÂÃÂxÃÃ£ÂÃ¦Â§ÂÂK]ÂÃÂÂ¦OÂs\'ÃµÃÃ_;ÃÂvÂdw\"\\ÃSÃ(,ÂRBAUÃª~Ã¡ÃÂ¾ÂÂÂrEÃ£Â6=>\nR]Ã?QÃµEÃ}<Â¿BÂ.KÃ}Ã¨m\'Ã@9kZÂ°Â­Â Ã¿\0>ÂÃ§Ã±Â±ÂeQTzÃ¹Â±B#Ã\ZÃÃOvÃÂ´:Ã¿\0\nBÂÂÃ»>ÂÃÂ¢rÂÂ?ÃÃ¿\0+ÃÂ½JIÂ¾hÂ£ÂªÃ&Â@@@xLÂÃ¡ÃÂ²ÃjDgÂPÃ£O -IÃ®\nO}h\nOYÃ¸AÃ©6Â³.Â¸Â­6ÂDÂ·LÂ3Â)Ã¾AÂÃÃ¢ÂÂÃ^Ã¯6Â-Ã½Â­PÃªFJc]Y-+Ã©Ã¦Â·Â\nÂ\"ÂcXtÂÂ¬\ZÂ·xÃÃ²Ã®Ã2aÂ¶&ÂµÂ·ÃÂÃ²Â >Â©*Tg,0ÂÃ¨BÂ¶j9ÂÂÃ³ÃÃÃ;ÃypÂ>ZÃ\nAÃ¤`ÃcÂÃ¨ÂÂ\nÂ1\\3ÂÂ¹Â Ãµ0ÂµÂ·Â·]lÃ²-M6Ã£ÃÂÃ£O<Â©bÂ-Â@Â¹Ã?*Ã6gÂÃ7JrÂ>MÃªÂÂÃ½ÂÃ¶hÃÂ¨ÂÂ¢Ã¡Â¢ÂÃÂµÂÂÂÂÃ·ÂÃªp~I5ÂzÃÃÃ¨}\rÂ(Â(Â(Â(ÂÂ©(BÂÂ¢ÂÂÂN0>Â´\ZwMÃµNÃ.wÂ­/ÃÃ³Â·*:Ã@/;Ã°ÂÂ©@\'zpÂ­Â¹8gÂÂÂ©uÂ·Â}Â©\\Â¹IÂ¶Ã\'ÃÂ¥ÃÂ§]Ã³Ãf6VÂ¡ÂÂ¡Â¼oJÂ¸Ã®@JÃ¸dÃ°ÃÂ¾ÂJÃ¼ÃÂº.Â.Â®4Ã+m*J[aÂ°HÃ¢*RÂÃ¯ÃO=Ã¨\rÂÂ \n\0Â \n\0Â \n\"Ã¯ÂªÃ¬6\0MÃÃµmÂ·ÂÃÃÂÃ_Ã¢\"Â[Â·uÂ§@]Ã®ÃZÂ jÃ\\Â©ÃÂ­Â¡ÂÂ·Â@Â¡Ã®Ã¾Â´2\\uUÂÃÂ¥Â¦}Ã¢UÂ£Âº^ÂÂÂ¨~Ã¦ÂÂ¯ÂµÃ·VtÂÃº?PBÂ|isdÃÂÃ\nmÂJ	ÃvÂÂÃÃNuÂGÃ©ÃdÂÂ¨}ÃÂ´!Â¶Â\rÂ¶Ã\\ÃÂ@YHX}Ã*bLÃ¿\0Ã±T-ÃVÃ¡#ÃOÂ¼ÂÃÃ¨Ac.ÂÃ±`ÃÃbÃµLÃ/2-ÃÂ)Ã±Ã¥ÃÃ¹6Â³Â{Â6ÂF3AeÂ¿BBÂÃÂ»Ã-Â~Â¶]Â®1-Ã±7yÃÃKHÃ{\rÃ gÂÂ¥Â¼Ã¸Â¨Ã©ÃÂÃ,Â¹rÂÃ³ÂÃÂ¢Â Ãec)I^2qÃ ÂÂ¥Â´WÃ·Ã¯zn3Â²ZÂµÃCÂfJ#mÂÂ¥!y_ÃRÂ@?Ã³1Ã\ng_Ã¸Â¬WQWjSÂ¶ÂrlÃ°ÂÃ¶Â·Ã­f8ÃÃÃÂ¦Ã¶)MÂÂ ÃÂ±ÂÂ9ÃWÂlqÃ¹Â¤Â½ÃÂ¼<Â\\XÂ¥.Âº\'Â·yÂqÃªÂÃ¶Ã2Ã¥LÃ´SNGÂ\rÂÂÃ«vuÃX|+AtÃ£;~\'Â¹=ÂªqdÂfÃ£mrÃ½ÂÂyÃ¥ÂÂ\\ÃÂ¶ÂÂ®ÃµÂ¯ÃqXÃª^Â¬kÃ«Â¬_Â´Â­ÃÂ­Ã©Â%-Ã}Ã¦Â£Ãj<w6ÂÂ´Âe_wÂ±Ã¬ÂÃ´#ÃIÃrÂÂ7Ã¶<ÃÂeÃÂ¯MEÂÃ¼Â_~Â¹^nÂªÃÃÃ#IdGÂ&mÃ!Ã¤8	J\\)OÂ¾RÂÂ®ÃwÂ­WÂÃ©Ã¥ZÂ«TÂÃ§Â©ÃÂn+>Â­MÂÂ¨ÃÂrÃP.Â·qÃÂÃ¤8fCÃÂ¸Ã¢ÂTÃ³Â¥i	\'b\\ÃNw(qÃÂ°ÃÂ`Â¥ÂmÂ¾ÂºWÂ±ÂrdsÃ¥ÂiyÂÃµK5\n<Â¶Â%qÃwÃBÂ	Ã³9Ãy Ã§ ÂÃ>ÂµÃjÂÂ¹ÂÂ­ÃzÂ±wmDIÃ)uÃ¢Ã¢ÂQÂ·i=Ã~<c=ÂÃÂÂÃºÃ®Ã¿\0Â¥-VHÃ¥WkÂÂ¿Â¨`Â¬pÃ¢ÂI=Â\nÂ³Ã¨3FÂ¨Â¬dÂ¤Ã]Â¤ÃKÃÂÃÂÂ¤Â©Ã°ÂÂÂÃXÃ¤ÂÂsPj{P\ZeÃ£Â]ÃlXÃ´sÃ¶_Â´Ã£)&Ã¨ÃªÃÃ»Â(R7aÂµÂ({ÂªHQ9ÃÂjÃ\'ÂªÂ£Rf^Ã2Ã­2lÃ,ÃÃ%)ÃW)8/Ã¬).ÂÂuIHÃ®HÃ¬ÂÃÃ¡OÂ«Ã·9Ã°`XÂ´RoÃÃ¹cZ]Ã£1Z-qÂ£Â°Ã£oÃ¹QÃÂÃJÃ¼ÃÃÃÂÂ¬%	\'8	$wÃWÃºLOu~Â¬Ã¯ÂyÃÃ¥tuY{ÂÂB#~Ã¬ÃºJÃÂ[ÃÂw*XJÂNB>Â¦Â¯tQFÃÂÃÃ¾ÃÃ¹Ã¹ÃªCNÃÂ*BÃÂ¾GÃÃÂ¦Â¤Ã¹>ÃÂµÂÂ·F<Â¾WÂÂÃ½Ã¥SÃk[Ã,Ã¥Ã³IÂ¾ÂÂVÂÂÃÂ«ÃµÃÃ©Â·XsaÃÂ¶Ãp{3 Â¼Â¬6Ã\'qÃ¤)A\\Ãº|Ã«ÃÃ #>Ã+ÂÂ»Â¥]]Â³ÃNÂÂÃyÃ¦Ã.wrÂ©)CiBÂ§\0Â}ÃÂ¥`Â¸<ÃªÂ¯Ã®Ãµ2ÂÃVÂ¬mtÃÂ´h9ÃfÃÂºÂ¡ÃÃÃÃ§[|Ã®ÂºÂÃ­Â£%)O+\'Â·ÃÂ¶Ã¢1Â¼<4 Ã·vÃÂÂ¿Ã°Ã¤Ã5ÂÂmlÂÃ§ÃEÂÃÂµ\rÃr\rÃÃ3Ân\r3jG9(Â·{ÃÃµÃ¤Ã*ÂÂÂÃÂ²Ã¶Ã3IN.Ã£Ã¹ÂÂ:Ã­Ã¹Ã¦JXÃ­VÂ»ÂÂÂ©UÂ¯Ã· Ã®XÃ¶ÂÂ¨9Ã	Ã§$ÂÃ¹Ã£Ã§TzbJÂ·eÃ£Â®fÃ¯dÂÂ»Â³b<:ZÂÃ¢#KÂ°Ã[cÃÂ¢(ÂÃ|Â¸Â¤}rÂ¡QÂtÂ¼NU\'Ã¢ÃÂÂdv.8ÂÂ[ÂPJ	$Ã¼\0Â 9GÃÃdÃQÂºÂyÂ¾7Ã¬oÃyEÂÂTÃqÂÂ©-Â¶JDsÃÂÂPÃÂ¦ÃÃÂ¶c.K_ÃZWÂ¹ÃpÂ©Â«ÃÂ¬Â¾Â¿ÂÃ¬;Ã¼Â{ÂªÂªLQÂÃQÃM(GÂ³9Â0Â¬yÂ.eÃ¥cÃ¿\0ÃÂÃ³Â§Â¡Â¬|Ã«ÃÃº\rÂ£bÂÂho-ÃGÂÂÃ±ÃÂ²Â§1Ã¨>ÃªGÃ£QOÂ¸Ã2ÂZÃÃ»ÃjÃÂ»+ÂWjlICE-Â¸?Â²	OÃ¹ÂÃ¤ÂÃ-Ã´Ã²\"sNÃ¾6Ã¿\0<ÃSÂ§Ã±nÃÃ«Ã®*MÃkLÂ©,3Â´:Ã@Â½Â¸+Ã+ÃÃ£Ã§ÂÃ´Ã³Â®ÃÂÃÃ¯+ÂÃµÃ®F3UÃ¢0Z/Â±oÂ		Â&Z#Ã@RÂÃ¶ÂµÂÂ¬$\'Â¾A%iÃ£Ã«\\Ã±Ã¡Ã²KÃ¢/DÃ«Ã©g,Â²EMc{ÃÂÂ·\\f*(TxÃ²RÃ%Â3+~]u[ÃÂÂe^Â\'Ã¡ÃsÂ¦ÂJLÂºM_*ÃFmÂ»ÂÃ´ÂÂºF2Ã­Ã°ÂÂÂ Â[KgÃ ÂÂ®UÂ·Â?Ã±ÃÂ®\'Â¯ÂÂ¿RÂµ;ÂÂÂºÃ»t=Ã´ÃÂ¦tÂ{SÃ¡OÃÂÂ¯nÂÂ§bd-eÃ=ÃÂ»ÂÂÃªÂ¦j)E.Ã­}YHJwÂÂ´Â´zz.Â¦ÃÃ¸gÂ»GÂ·uÂÂ½ÂÃlÃ/3Ã YRIÂÃ¡aÂ¢ÃÂNrÂ¤2Ã¸Â¶AÃ´5\\ÃÃ£cÂÂ³ÃoOzÃÃ« ÂµÂ­ÂFÂ¢Ã7Â»TIÃÃÂ6#ÂÂ·)ÂÃ®[JRH3Ã´ÃÃºÂÃ´-n2ÂYqÂ¶Â¦Ã[Âª!EÃÃYÃÂÃÂ²qÂxÃ=VÂ¼XÂ©Â¹Ã¼QUÃzÃ½Â¿Ã´Ã¸wDÃÃOÂl#Ã§ÃÃ·Â¢Â¢Â¼\rÃ¢Â¨ÂÂ¸Ã¨{Â³ÃÃhÂlJFHq)Ã·BÂ#;~ \ZÂÃ°4ÂkiNÃ¨KÂ¼ÂÂ§8ZÂ´0Â©RZ@Q*mÂ´ÂÃ§ÂÂ¤ÂÂÃÃ¯ÂÃ¼qUÂ¤Ã¿\0ÃÃ©ÃÂ\"IÃ¶Âµ^,Ã´:6Ã ÃÃlÂ¥ÃÂ³8ÃÃJgwÂºÂ3ÂÃ©Ã¹ÂÃVÃÂ´Â©:3ÃÃ¦Ã9Â§ÃªNÃMÃ®ÂÃvÂ«\"cÃÂ\rlÂ©1ÂK>[Â®=ÂÂpv6Ã8 gÃ³]ÂfeÂiÃDÂ_ÃÃÃnÃÂºÃ]AÃÃ³ÂmÃ­ÃUÃÃ¦ÂF3Ã­$7Â´Ã§y\\ÂÂyÃÃ´Â¨ÃÂRÂcÂÃ¼7Â®ÃÂÃ§Â$ÃÃÂÃÃ¢ÃÃµÂ_aÂ½11ÃÃ¤GÂRÂÂÂo	\nNH8*\nVqÃ¼UÂÃ¥Ã»ÂÃ£Ã^ÂcÃ½Â´Â²oZÂÂ­Ã©ÃÃÃÃ£~ÂwÃÃ)1ÂÃÂÂ´Â Ã½Ã¢@Ã§Ã©DÃ²v|ÂµÂ§ÂFÃ±vÂ¼Ã®ZÂ¥ÃÃ«Â¸ÃÂ¥\"ÃÂ·ÂL9Â¶ÃQÂmhqÃ¯ÃTÂÃÂ³Â08Ãe,ÂÃqNÃpÃÂWÂ¿]zÂÃ¡IÃÃ¯ÃºÂ¦ÃÂ¨]ÃÃ\"ÃhzSÃ©Â½Â¨ÃÃ²ÂiHÃ²Ã»`Â­Ã_ÃÃ¯Ã»ÃÂ¬Â¤Ã­Â¶uÃ¢Â,WC}*ÂÂ¡@)\\:]Â£nÂÂ¸Ã¬Â­3k[Â®(Â©kÃÂ(ÂÂIÃ¦ÂÂÂÃÂÃÃ½\0ÂÂÂ«2GÃ·*ÂE:Â¢\ZNÂ¦RZÂ²1/ÃÃÂÃ»ÃHÃ¯ÃÃÃ´Â©Â±HÃ·ÂÃ}3>nÂÂµÃ³Ã¾Â£[?ÃÂÂÂiÂ¾Âºs-ÂµÂ¥6JÂ±)ÃÂÃ¼ÃÂ¼GÃ©SbÂFÃÃ¼ÃªtÂ¼Ã·ÃÃ·Ã»KÃ¬/ÃÃ£k)ÃÃT3ÂÂ#ÂVÂÃ¡OÂ¨ÃÃ¥1iÂo*n3Ã¼ÃrÂ±nÃ¡Ã¡ÃÂ©Ã°Ã²UÂ¥ÂxÂYsÃ¼Ãµ:\nbÂ´Ã®ÂkÃ¸!EÃ­}\0wR!)cÃ³H4ÃQ!ÃÂÂjÂ®Â¡jÂÂ­[\'ZÂ Â·ÂÃÂ6*ÃK\rÃ§Ã Ã¥ÂÃ#Ã£ÃÃÂ¦Ã¨ÂDÃ·GHÃ ÃbÃÂÂÂCQÃB[mÂ´$%)H\0ÃÃ¼*Â¥ÂÂPX(Â(Â(Â(Â0(Â P\0PÃ¿Ã',532.8,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\teclado-gamer-esca-gxt-853.jpg'),(3,'PC','ei',11726,NULL,532.8,1,''),(4,'Laptop','membe',10980,NULL,532.8,1,''),(5,'Celular','bemba',30,NULL,2000,1,''),(6,'Bomba','idk',40,NULL,24000,0,''),(14,'1q3','123',0,NULL,0,1,NULL),(15,'BOMBANUCLEAR','BEMBARAYO',0,_binary 'ÃÂ¿ÃÂÃÂ¿ÃÂ \0JFIF\0\0`\0`\0\0ÃÂ¿ÃÂ¾\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÃÂ¿ÃÂ\0C\0ÃÂ¿ÃÂ\0CÃÂ¿ÃÂ\0\0h\0h\"\0ÃÂ¿ÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÃÂ¿ÃÂ\0=\0\0\0\0\0\0\0!1	QÃÂ\n\"AaqÃÂ2ÃÂ¡ÃÂ±ÃÂÃÂÃÂ°ÃÂ¡#RrBÃÂÃÂ¢ÃÂ£ÃÂ±ÃÂ¿ÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÃÂ¿ÃÂ\0 \0\0\0\0\0\0\0\0\0\0\0\01QÃÂ!qÃÂÃÂÃÂ°ÃÂ±ÃÂ¿ÃÂ\0\0\0?\0ÃÂÃÂ)ÃÂ&ÃÂÃÂÃÂrÃÂºÃÂ¼ÃÂ¿MKÃÂªÃÂ¥ÃÂ¸}ÃÂ¶ÃÂÃÂ£ÃÂ¹ÃÂ¼ÃÂºÃÂªQÃÂ¤>ÃÂ¬ÃÂ.ÃÂÃÂ¯ÃÂ¸ÃÂ¼9ÃÂªÃÂ­ÃÂ®ÃÂºÃÂ:ÃÂ(w(d@ÃÂÃÂm@SHÃÂ©ÃÂ¿\0ÃÂ?}U0ÃÂ¤:ÃÂ¤3ÃÂ²ÃÂ¼:ÃÂ²ÃÂ¥ÃÂÃÂÃÂ]IÃÂ¦ÃÂÃÂ¯ÃÂ¯ÃÂ²xÃÂ¹:IÃÂ#ÃÂ¾ÃÂÃÂ¿\0ÃÂ´?}CÃÂ¹K?pÃÂ¸ÃÂ¿\0ÃÂgÃÂ³ÃÂ½ÃÂMU)J ÃÂÃÂÃÂÃÂ³ÃÂ«ÃÂ¦ÃÂÃÂ¯ÃÂµ2u<ÃÂ7rÃÂÃÂ¸ÃÂÃÂ·ÃÂµ(y{ÃÂ¿\0ÃÂÃÂºÃÂ°ÃÂªÃÂÃÂ¶ÃÂÃÂÃÂÃÂ´ÃÂ®kÃÂÃÂ{,ÃÂÃÂÃÂ£ZÃÂu<<ÃÂ¢IÃÂª$ÃÂÃÂÃÂ¥.ÃÂ½ÃÂÃÂÃÂ¦ÃÂUÃÂMc\"\ngTÃÂ6ÃÂÃÂÃÂp)JaÃÂ >ÃÂ°ÃÂ´/ÃÂÃÂ\"ÃÂPÃÂ¶ÃÂÃÂ\0\0zÃÂ¦ÃÂÃÂ¿ÃÂÃÂ¿\0^ÃÂ½ÃÂÃÂ¯fÃÂ»WÃÂÃÂÃÂ·ÃÂÃÂºBÃÂÃÂÃÂ®ÃÂ¤({`ÃÂÃÂÃÂ®jhH&6ÃÂ®ÃÂÃÂ¨zFÃÂÃÂkÃÂ¡ÃÂ¤bfÃÂªÃÂÃÂ´=FÃÂµtÃÂ¢$ÃÂºsXÃÂ¢ÃÂABÃÂ·@ÃÂmÃÂ¦ÃÂÃÂµ2N$ÃÂgFZÃÂªÃÂÃÂÃÂQÃÂ§ÃÂªÃÂº>wÃÂ#PÃÂJÃÂ³ÃÂpÃÂºÃÂÃÂ·YÃÂpÃÂ£ÃÂ¥ÃÂÃÂÃÂªÃÂ¨<SÃÂÃÂ[sÃÂ	ÃÂ§ÃÂcÃÂ¦0=@|C\\ÃÂÃÂ£ÃÂ«ÃÂÃÂÃÂ7	#ÃÂºÃÂ½ÃÂ¬\\WÃÂ¡ÃÂÃÂGÃÂ*ÃÂ©uÃÂR%ÃÂ¸7K<1ÃÂ9ÃÂÃÂÃÂµÃÂÃÂ§PÃÂ«ÃÂÃÂÃÂ¶ÃÂ¥ÃÂ¯ÃÂ.ÃÂ¯ÃÂÃÂ5\ZÃÂ}yG1DÃÂ«DÃÂ3EÃÂ²ÃÂ¬ÃÂ¦ÃÂÃÂUÃÂµz!W*ÃÂ£EÃÂªtLÃÂg ÃÂ¥QÃÂÃÂ©ÃÂ4ÃÂ¬\"ÃÂÃÂq0ÃÂÃÂ¦\0oxÃÂPÃÂ±ÃÂªÃÂÃÂ­ÃÂ¤ÃÂ­-\nÃÂÃÂÃÂ®ÃÂyÃÂ¯\nÃÂ±ÃÂÃÂÃÂÃÂ sÃÂNÃÂÃÂ´ÃÂÃÂ¯FÃÂ»p{ÃÂ¨ÃÂuÃÂ ÃÂÃÂc~.Mot-ÃÂ´EÃÂºÃÂÃÂ§lÃÂ¤ÃÂw(ÃÂ¼ÃÂ¬ÃÂBÃÂ£M8ÃÂ¨n1,ÃÂ´ÃÂªHÃÂ+ÃÂÃÂµHxÃÂÃÂÃÂ¼mÃÂºÃÂ¯ÃÂÃÂ³PÃÂ*ÃÂ .\\ÃÂÃÂ¿ÃÂ¹-ÃÂ¶N6ÃÂÃÂÃÂ|ÃÂ®~RI7$ÃÂÃÂ³ÃÂmÃÂ¼ÃÂ¶ÃÂÃÂ-ÃÂºÃÂ©ÃÂ!YÃÂÃÂ9S\0ÃÂ$ÃÂªQ)ÃÂÃÂÃÂ¾ÃÂ£ÃÂ3ÃÂyÃÂ»ÃÂ´k ^@ÃÂÃÂ¼ÃÂ©ÃÂÃÂ1ÃÂÃÂ¦>ÃÂLÃÂ¨ÃÂVQ\0ÃÂÃÂ©ÃÂÃÂ#ÃÂÃÂÃÂ¨=1ÃÂÃÂsÃÂ¾51ÃÂºÃÂÃÂ´RÃÂMÃÂ!\0\0ÃÂµÃÂ¸\0tÃÂºÃÂ¸ÃÂª<ÃÂ¢ÃÂÃÂ­ÃÂ ÃÂGÃÂ¥ÃÂºÃÂÃÂªÃÂ¨)pÃÂ~?ÃÂ¶ÃÂª\0`\0ÃÂÃÂ¨ÃÂ¨ÃÂ&wkÃÂÃÂ§ÃÂiÃÂÃÂÃÂ·ÃÂ¶ÃÂ¢EÃÂ>ÃÂ·ÃÂ©iÃÂ¿ÃÂ­%ÃÂ³?xÃÂ¢nÃÂ¯nÃÂÃÂ©JFÃÂ¾bdÃÂÃÂ¦TÃÂKÃÂ¹ÃÂÃÂ >ÃÂ4ÃÂªÃÂªpÃÂuÃÂÃÂªÃÂ¡T\nÃÂÃÂÃÂ­8ÃÂ­ÃÂUyqÃÂ¨8ÃÂ¶ÃÂ¨ÃÂÃÂ¥CÃÂR3QU=CÃÂÃÂÃÂ¦ÃÂ«ÃÂ¤ÃÂ©ÃÂÃÂÃÂ¡ÃÂÃÂÃÂÃÂpCÃÂ©ÃÂÃÂvÃÂ©	P]ÃÂ»ÃÂ´ÃÂ9ÃÂº*ÃÂSÃÂ¯uÃÂhÃÂuMÃÂÃÂ5ÃÂo)ÃÂ1ÃÂ£|ÃÂ·bÃÂ¶ÃÂÃÂÃÂ©ÃÂ¥ÃÂL\n\'ÃÂ«VJÃÂ¤EBa6_ÃÂ·ÃÂÃÂ·ÃÂ¦O~ÃÂ.uÃÂÃÂ¤(MÃÂv}ÃÂ®:ÃÂºpÃÂ¨\"ÃÂÃÂ¯~*ÃÂiYSÃÂ´ÃÂÃÂ ÃÂÃÂÃÂµÃÂÃÂ©ÃÂÃÂ«ÃÂ<ÃÂÃÂ)ÃÂ¨ÃÂÃÂÃÂ»H@-ÃÂUÃÂ«ÃÂ¦4ÃÂÃÂ¤ÃÂ£ÃÂÃÂ®ÃÂÃÂ6ZEÃÂÃÂ¦ÃÂ\\ÃÂ ÃÂ­g/KÃÂeJÃÂ JbÃÂ¢ÃÂ ÃÂÃÂÃÂº@BÃÂ3ÃÂ»FÃÂ¢ÃÂ³ÃÂ	OÃÂ±ÃÂ ÃÂ§ÃÂ¦*ÃÂªÃÂ¦ÃÂÃÂXÃÂ¥TÃÂ:ÃÂ\\ÃÂÃÂÃÂzKÃÂÃÂÃÂYÃÂ¡ÃÂÃÂ¤ÃÂÃÂÃÂÃÂªw$IAÃÂ¢PÃÂ¹ZÃÂÃÂ«ÃÂ9DADÃÂNÃÂ°\ZÃÂªE?ÃÂÃÂÃÂEÃÂ»8ÃÂÃÂ¾ÃÂ :ÃÂ&ÃÂ¡@Dy5ÃÂÃÂ´ÃÂÃÂÃÂ³ÃÂmÃÂ¡ÃÂ»}ÃÂ²moÃÂ¯}ÃÂ¡JÃÂÃÂ·ÃÂ¶ÃÂ« pWÃÂ¾ÃÂZÃÂÃÂ¾ÃÂ¦tÃÂÃÂªÃÂS6ÃÂ³ÃÂ±ÃÂ´ÃÂ84ÃÂBÃÂTZÃÂ \"@ÃÂSÃÂ¼ÃÂ»!ÃÂ¶ÃÂ¶;=ÃÂ¬ÃÂ²ÃÂUÃÂ¢ÃÂÃÂMÃÂlÃÂ¦ÃÂBÃÂ¤ÃÂÃÂ *\'EÃÂÃÂ®MÃÂ\\ÃÂµÃÂ¥VÃÂÃÂ°(ÃÂ¸ÃÂ^iÃÂµ*ÃÂÃÂ°\0VÃÂ\rÃÂÃÂ¦ÃÂ¥*ÃÂ£ÃÂ¼?}SÃÂzÃÂqdGaÃÂÃÂ³ÃÂgÃÂ°\0\0\0ZÃÂÃÂ]ÃÂ¡[ÃÂºÃÂ<cÃÂÃÂ¾ÃÂ³||>ÃÂ½:hÃÂ+ÃÂ¼`-ÃÂ¿ÃÂ¨ÃÂ³ÃÂ¯ÃÂqÃÂÃÂÃÂ©ÃÂ9@ÃÂ±Z4DÃÂ½ÃÂ§ÃÂºÃÂ©jÃÂ©ÃÂºyÃÂ¾ÃÂÃÂ¨ÃÂ !ÃÂ?ÃÂ§ÃÂ¼ÃÂ©ÃÂ¥ÃÂ ÃÂ>ÃÂ°ÃÂ¼ÃÂÃÂ³\rUÃÂ\0ÃÂ ÃÂ?ÃÂtÃÂ¼2rbcÃÂJIÃÂ»AÃÂtsG/ÃÂ¤9TÃÂ¨7dÃÂÃÂ*9xÃÂ­uÃÂ DÃÂjÃÂ%WUCÃÂÃÂ¦cÃÂ ^ÃÂ­#ovÃÂ¬[ÃÂ­7ÃÂ³^ÃÂ¶ÃÂ6ÃÂjÃÂ®ÃÂ²$ÃÂÃÂÃÂOP\nÃÂ¡ÃÂÃÂ®Q\\ÃÂ³ÃÂ¬ÃÂ¦ÃÂY4ÃÂ ÃÂ­ÃÂJÃÂµÃÂ¯ÃÂ®\nVÃÂ¯EÃÂT*ÃÂ\"CÃÂÃÂ·ÃÂÃÂ¹ÃÂÃÂ·9ÃÂ»=ÃÂÃÂ®ÃÂª`ÃÂ«=ÃÂÃÂ¨ÃÂ«zÃÂÃÂ¤ÃÂÃÂ´vÃÂ ÃÂÃÂºÃÂ·t\ZhDZÃÂtÃÂ~@ÃÂÃÂ¨xÃÂÃÂÃÂ@ÃÂ¬ÃÂ«ÃÂÃÂ¥CÃÂÃÂ9ÃÂ]ÃÂµGÃÂ¶oÃÂÃÂ¤ÃÂÃÂÃÂ±ÃÂ«\Zn.ÃÂ´ÃÂ¶ÃÂ¥ÃÂ»+ÃÂ*ÃÂ½ÃÂT+ÃÂµÃÂ¨8ÃÂ«WZÃÂvÃÂ5ÃÂÃÂ¥\nmÃÂ£ÃÂª:ÃÂ­ÃÂ¡ÃÂ² tÃÂ«ÃÂTÃÂ¼ÃÂ3T-ÃÂÃÂ¼{ÃÂ¹ÃÂÃÂ·ÃÂ¶ÃÂH3ÃÂÃÂ«wAyÃÂ­ÃÂµÃÂÃÂ¦TÃÂ]%ÃÂ&%ÃÂÃÂ¬JRÃÂ²ÃÂHÃÂÃÂVl>ÃÂm4ÃÂªÃÂHÃÂBÃÂ»\\2ÃÂ1>ÃÂºjÃÂ¯ÃÂªÃÂÃÂµ{pÃÂ¬ÃÂÃÂÃÂÃÂ²lÃÂVÃÂªÃÂÃÂ¬ÃÂÃÂ»ÃÂ³tÃÂ»P*g*ÃÂZÃÂµÃÂ­}ÃÂH	ÃÂGRoBÃÂÃÂ ÃÂYÃÂ«ÃÂ ÃÂÃÂ9ZÃÂ¶>Ej*ÃÂÃÂ0ÃÂRÃÂµ9c\"ÃÂÃÂPÃÂ9jÃÂªÃÂÃÂ@ÃÂÃÂ«ÃÂ«ÃÂÃÂ´ÃÂlpÃÂÃÂQÃÂ¨ÃÂ³Z\nfÃÂ¬ÃÂ¹ÃÂ»ÃÂÃÂ9ÃÂ%ÃÂRÃÂ©ÃÂ[tÃÂ·ÃÂ\"ÃÂÃÂ°ÃÂ´ÃÂÃÂ¦IÃÂ5ÃÂ²ÃÂÃÂ¥DÃÂ²ÃÂÃÂ°ÃÂ¶ÃÂº0ÃÂÃÂÃÂ»ÃÂ,DÃÂ*$#ÃÂÃÂ´ÃÂÃÂ¤ÃÂ§ÃÂ¡j)ÃÂ£-/MÃÂDp\nROU(8ÃÂgÃÂ\0\0dÃÂ¬`ÃÂ/ÃÂ\0\0ÃÂÃÂ§ÃÂ/(ÃÂ´IQUÃÂ½ÃÂÃÂJkÃÂ¥\\/ÃÂ­uÃÂ`ÃÂÃÂÃÂºÃÂ¶ÃÂ=US\nf8ÃÂ@qÃÂ%ÃÂ¥ÃÂÃÂ¹ÃÂ>_ÃÂ¨ÃÂªMLnÃÂ¾_O~:ÃÂÃÂ³ÃÂ KÃÂ ÃÂ±ÃÂ®!HjeÃÂ©T)NC\0ÃÂrÃÂÃÂrÃÂRÃÂÃÂ¦)ÃÂ!ÃÂ@ÃÂ !ÃÂ@CFÃÂ©\\ÃÂµÃÂÃÂÃÂÃÂ\\ÃÂ¢ DÃÂ1ÃÂ \"\0ÃÂ²\0ÃÂ\0ÃÂ¼ÃÂ´h2ÃÂºyÃÂ¾ÃÂÃÂ ÃÂ<ÃÂ¾ÃÂÃÂÃÂ¾zÃÂÃÂÃÂ«ÃÂu}ÃÂ?ÃÂ®ÃÂm\Z4h5ÃÂ»t[ÃÂÃÂµÃÂAÃÂ²5ÃÂÃÂ¾ÃÂ¼ÃÂ²R1ÃÂÃÂAd	ÃÂ¶ÃÂC)#PNGSÃÂPÃÂÃÂ´)\\6R^fZbQÃÂ£VÃÂ¬ÃÂY \nÃÂ®ÃÂ,ÃÂFÃÂ®MÃÂÃÂ¾ÃÂ/iMÃÂÃÂ­	ÃÂÃÂ°VÃÂÃÂÃÂNTÃÂÃÂªÃÂÃÂÃÂÃÂ¬ÃÂª9ÃÂiÃÂº*jJÃÂ½ÃÂ~ÃÂfÃÂ¢ÃÂzÃÂ£I9ÃÂÃÂ¨(8ÃÂ¸ÃÂÃÂÃÂpwÃÂºÃÂ²iÃÂ¶YS5TÃÂ¤~vÃÂ¨ÃÂ¶ÃÂ¿eÃÂ·ÃÂdÃÂ«;)+wZÃÂµnWmAu#ÃÂ¦af#\\ÃÂµ?UÃÂÃÂÃÂÃÂ°ÃÂ¶ÃÂÃÂ«)ÃÂDÃÂÃÂÃÂÃÂfnÃÂ±ÃÂ³ÃÂ´ÃÂ»ÃÂ§	:`ÃÂ¡ÃÂ£7ÃÂ«ÃÂ·ÃÂÃÂ3ÃÂyÃÂ·+ÃÂp\"lÃÂ¥ÃÂÃÂ¸ÃÂÃÂ²ÃÂ°ÃÂÃÂ¤ÃÂ­ÃÂ}JÃÂÃÂÃÂ,ÃÂQGÃÂÃÂdÃÂÃÂÃÂ¼iQÃÂÃÂ¦ÃÂÃÂ©ÃÂÃÂ¢ÃÂ¡hÃÂÃÂ¨D)ÃÂ¯Qu,ÃÂgÃÂ°ÃÂªÃÂ½ÃÂÃÂµÃÂªBÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂ¼ÃÂ®ÃÂ ÃÂ«f4ÃÂÃÂºÃÂ¤ÃÂ¶ÃÂDÃÂ¹JÃÂÃÂ»n]HÃÂÃÂÃÂÃÂ­xZÃÂÃÂÃÂ´shÃÂÃÂÃÂxÃÂªÃÂwsÃÂ§ÃÂr*ÃÂ) ÃÂzbpÃÂÃÂ´ÃÂwKhl/gÃÂUE\\z=ÃÂÃÂ\rÃÂL#f)ÃÂ#CÃÂ¿ZNÃÂ´ÃÂ¨ÃÂ5ÃÂ»ÃÂ,%ÃÂÃÂ¶)ÃÂÃÂÃÂ!ÃÂÃÂ±HÃÂµ\ZÃÂ´ÃÂ¹ÃÂ\\ÃÂ¨ÃÂÃÂÃÂ®ÃÂÃÂ¨ÃÂÃÂ.ÃÂGÃÂÃÂÃÂ¢ÃÂ­ÃÂµÃÂ¦oSÃÂºÃÂ¾ÃÂ©ÃÂNÃÂjZÃÂÃÂ®cjÃÂ©zUÃÂYÃÂÃÂÃÂ¦ÃÂ¥a\"aÃÂ«ÃÂÃÂ¦ÃÂÃÂÃÂ¥jÃÂµ^SÃÂ ÃÂÃÂÃÂ,ÃÂ¡ÃÂ<ÃÂfLÃÂÃÂ¯uu%iihÃÂÃÂÃÂ¯ÃÂ¹ÃÂ¥ÃÂÃÂ¶ÃÂµÃÂ¶ÃÂÃÂªÃÂªÃÂ¢ÃÂXjiÃÂeÃÂ»ÃÂ¦ÃÂÃÂI[ÃÂQÃÂ2ÃÂ¨(ÃÂ«ÃÂ_SOÃÂªÃÂ§4ÃÂ¥*ÃÂ¡ÃÂGpÃÂµ4LÃÂiHÃÂMÃÂG}ÃÂ«ÃÂ¦.LÃÂÃÂ«hÃÂÃÂÃÂ·t=?gÃÂÃÂ§ÃÂrÃÂÃÂÃÂpÃÂ¢=FnÃÂi+ ÃÂÃÂ,ÃÂ£AÃÂÃÂ+ÃÂ	ÃÂ\nÃÂ¦\nÃÂ;jCTÃÂÃÂ·jÃÂÃÂÃÂÃÂºz6mmjv&ÃÂ½ÃÂ¿\0NÃÂ®w4ÃÂ¾ÃÂ±ky;ÃÂ²ÃÂ­,ÃÂ¼3hÃÂ´-ÃÂº|ÃÂ¥CkXB6ÃÂMÃÂ»ÃÂ¥j1ÃÂmLP/$ÃÂ³8ÃÂÃÂ·V@#ÃÂÃÂ±Q6ÃÂÃÂ¸ÃÂ£ÃÂÃÂ¬ÃÂ¢M.Y[ÃÂÃÂ¶ÃÂiÃÂÃÂZ~ÃÂÃÂtÃÂÃÂmÃÂÃÂÃÂÃÂBÃÂ7MÃÂcÃÂ­N5ÃÂd\nbÃÂÃÂ¨ÃÂ¤C,ÃÂS1ÃÂÃÂ¯ÃÂÃÂ]ÃÂÃÂ¹UÃÂÃÂ7m*ÃÂºÃÂzÃÂ¦ÃÂ¢ÃÂ¬mÃÂÃÂ¦iS2ÃÂ»WHQ4ÃÂ­EF)XÃÂCDÃÂ¹MÃÂ²nÃÂdÃÂ¾ÃÂ¨ÃÂÃÂÃÂ1^ÃÂº{ÃÂ.ÃÂ¨ÃÂ¤hfÃÂ­\nÃÂrÃÂªMÃÂÃÂ<_ÃÂ¾|ÃÂ¹ÃÂ§RÃÂªcÃÂµÃÂ«ÃÂÃÂ§O.ÃÂÃÂ¿<ÃÂª]3ÃÂ»ÃÂÃÂÃÂ¡ÃÂ¤!ÃÂ¤sÃÂtHÃÂÃÂ¿\0wÃÂFÃÂ§ÃÂ»EÃÂsÃÂ 8ÃÂÃÂÃÂÃÂXÃÂ¥(ÃÂ¦9$ÃÂÃÂ¶p\0ÃÂ·ÃÂÃÂ°ÃÂÃÂN?O?ÃÂu}ÃÂ?ÃÂ¦ÃÂ ~ÃÂ^CÃÂ¨ÃÂÃÂ®ÃÂ¹ÃÂ½thÃÂÃÂ¼eÃÂ·p8dp?ÃÂ|sÃÂ\0ÃÂ¦8\rjÃÂÃÂ©ÃÂÃÂ¦ÃÂÃÂ¶ÃÂ°ÃÂÃÂÃÂÃÂÃÂ¸+[BÃÂRÃÂª+ÃÂ°ÃÂÃÂ«#\\ÃÂÃÂRÃÂ¬XÃÂÃÂIÃÂÃÂ¢!ÃÂPQÃÂ²aÃÂÃÂ@\0GAÃÂ´ÃÂºÃÂ¤rÃÂyÃÂÃÂÃÂÃÂ´`ÃÂÃÂÃÂÃÂO,0ÃÂÃÂEÃÂ¸OJ7avÃÂGÃÂÃÂÃÂ~ÃÂ¦ÃÂÃÂdÃÂVÃÂÃÂ$\r4wÃÂÃÂlÃÂÃÂQÃÂÃÂÃÂÃÂ¢ÃÂ\0ÃÂ;rÃÂÃÂÃÂÃÂ¸ÃÂ«ÃÂ²ÃÂÃÂÃÂKwl,tJÃÂtÃÂÃÂÃÂ3ÃÂÃÂÃÂ¦EÃÂaÃÂªÃÂFÃÂÃÂ`ÃÂ:RÃÂ¢BÃÂÃÂ\0ÃÂAÃÂÃÂ®bnÃÂÃÂ3ÃÂÃÂÃÂÃÂ±ÃÂ}.ÃÂ½ÃÂ¤c\0ÃÂ¤DUtÃÂ¹fÃÂ¨1ÃÂÃÂ¥OÃÂ!I]ÃÂ¦LvIn*ÃÂÃÂ¹ÃÂÃÂÃÂ§&ÃÂ¬;ÃÂÃÂÃÂ¶ÃÂÃÂÃÂ¦ÃÂ§ÃÂ¯;ÃÂª*ÃÂCLÃÂ°EÃÂ²ÃÂ±LR7ÃÂ²BÃÂÃÂÃÂÃÂÃÂ¨ÃÂ©ÃÂ#ÃÂÃÂÃÂ»m6ÃÂ°ÃÂ±ÃÂÃÂ$ÃÂÃÂ«ÃÂ«ÃÂEMÃÂº~ÃÂÃÂ¼ÃÂÃÂªÃÂ³-yÃÂ¸-ÃÂ>ÃÂXÃÂ©ÃÂ«H[vÃÂÃÂBÃÂ¬ÃÂZ.z\rÃÂ¢$fÃÂDxD%ÃÂ¦ÃÂÃÂÃÂ{ÃÂ¾16ÃÂ/ÃÂÃÂ±ÃÂÃÂÃÂÃÂÃÂ(ÃÂÃÂÃÂ¯;ÃÂÃÂ¸ÃÂ±ÃÂ³-*ÃÂmÃÂSBÃÂ¹ÃÂ¨dÃÂO,ÃÂ²ÃÂ	ISÃÂ°ÃÂµltÃÂÃÂÃÂ¬ÃÂ¢4{ÃÂ]ÃÂÃÂÃÂÃÂ±ÃÂÃÂÃÂÃÂ WÃÂÃÂ¼ÃÂPÃÂÃÂ´}#UHÃÂÃÂJÃÂ¶ÃÂ¨eJNÃÂ£ ÃÂ¹ÃÂ¤ÃÂ­2ÃÂ~EÃÂ´ÃÂ²ÃÂ®ÃÂ¡[;ÃÂMÃÂÃÂ\"dÃÂÃÂ{ÃÂ!ÃÂ2ÃÂÃÂÃÂ&ÃÂ²DPÃÂ³6{r%ÃÂ¦AMÃÂÃÂÃÂ ÃÂ»GGvÃÂÃÂÃÂ¡jÃÂÃÂªÃÂÃÂlÃÂÃÂ,aÃÂÃÂ·gL!ÃÂÃÂ²ÃÂ1L,zÃÂ¸6rÃÂ­ÃÂ­ÃÂj>ÃÂÃÂ¼ÃÂÃÂ«ÃÂÃÂªÃÂÃÂÃÂºxÃÂ:ÃÂNÃÂ|ÃÂ¹ÃÂ\"ÃÂBÃÂ£ÃÂ¬ÃÂMeÃÂAÃÂÃÂ*ÃÂ»TLÃÂ¢ÃÂ¡SLGÃÂD7kÃÂ»ÃÂÃÂ½ÃÂ»nÃÂ¦ÃÂª[3ÃÂ½[ÃÂ¢ÃÂ´e[\"ÃÂBj\"ÃÂÃÂ¨%*JÃÂ®aÃÂÃÂUIÃÂÃÂ\naÃÂÃÂ¸ÃÂÃÂµÃÂÃÂ;ÃÂ¨ÃÂ¦+ÃÂÃÂ©ÃÂMÃÂWAÃÂpÃÂ«ÃÂ\"<ÃÂ0?ÃÂ¨ÃÂµÃÂ«ÃÂ¹ÃÂ³ÃÂÃÂ¡ÃÂ®xÃÂÃÂ·wÃÂµRÃÂ0ÃÂ§ZÃÂÃÂ«ÃÂ¯g^3ÃÂMÃÂ-ÃÂµÃÂ¢ÃÂ©ÃÂªÃÂºÃÂ¶ÃÂªHÃÂHPÃÂ¯ÃÂ©ÃÂ«\\ZNb%eSÃÂÃÂ¬ÃÂ¢ÃÂÃÂeÃÂ¢ÃÂªd\nRÃÂ»[ÃÂ²CÃÂ´ÃÂº3ÃÂ´ÃÂÃÂÃÂJÃÂÃÂ4eyfÃÂªÃÂ¸ÃÂ2ÃÂ¹ÃÂ;JÃÂÃÂ¨ÃÂTPFÃÂ©!\'ÃÂ©ÃÂOTÃÂ±-V`UÃÂ?ÃÂÃÂ¨ÃÂÃÂ.ÃÂÃÂFÃÂÃÂlÃÂ&ÃÂª@ÃÂ§5ÃÂ¢2.)idÃÂ¢ÃÂ*oÃÂÃÂP@ÃÂ¦PR\08ÃÂxCÃÂ|dqÃÂJbÃÂÃÂ¼FÃÂ¾ÃÂ¼ÃÂ¹ÃÂ$SÃÂ³:WÃÂ¸l	ÃÂÃÂ®ÃÂ·KÃÂÃÂ¤\0<gÃÂ¢7ÃÂ²!ÃÂ\"ÃÂÃÂ´h0ÃÂ¶ÃÂ§ÃÂ·#nÃÂ¶ÃÂejÃÂÃÂ¥tUÃÂ-)J-OÃÂ°3HÃÂÃÂ±<ÃÂÃÂ¬ÃÂ¥YQFRtÃÂ+ÃÂÃÂ½ÃÂÃÂlÃÂ¬ÃÂ¬ÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂnÃÂ¢ÃÂ²RÃÂÃÂÃÂ°jÃÂºÃÂCÃÂ»ÃÂÃÂqÃÂ_ÃÂ°UÃÂÃÂ,ÃÂÃÂWÃÂ§ÃÂ48ÃÂ¥&ÃÂÃÂ¸E^\nÃÂ±ÃÂÃÂ¦ ÃÂ·*ÃÂ¢ÃÂ!ÃÂ¼=G)ÃÂÃÂ«60ÃÂÃÂ´:ÃÂ ÃÂµTÃÂ°ÃÂ¨ÃÂ«AÃÂ¼\rÃÂ´[}ÃÂÃÂ­ÃÂ¾ÃÂ»ÃÂ°ÃÂ^!ÃÂ¤ÃÂYÃÂ¥ÃÂ²ÃÂ¤ÃÂÃÂ{\r-/NÃÂÃÂ±ÃÂ¨iÃÂÃÂÃÂ©6\"ÃÂÃÂ¤!&ÃÂ£ÃÂH7ÃÂvÃÂÃÂµ~ÃÂÃÂ5ÃÂ@ÃÂ­kÃÂ¯=yhÃÂ®dÃÂ¬ÃÂÃÂ¿\0ÃÂ®ÃÂ©uÃÂPÃÂªÃÂ²,ÃÂR*ÃÂ¤%0ÃÂ08%)i<ÃÂxGÃÂ½ÃÂ¯ÃÂ8ÃÂµÃÂt	ÃÂÃÂ¼;ÃÂ»ÃÂotM,ÃÂÃÂÃÂºÃÂÃÂÃÂÃÂ\\W:ÃÂÃÂ\'GÃÂ¯JÃÂ ÃÂÃÂÃÂ§ÃÂjÃÂÃÂ\"ÃÂ¢\0LV(ÃÂÃÂ1ÃÂ%ÃÂÃÂ^ÃÂºÃÂºÃÂ»oOTÃÂEÃÂ¼ÃÂ§%$U0ÃÂ­VÃÂÃÂÃÂÃÂ­+ÃÂÃÂ¢ÃÂ¡J\'ÃÂÃÂÃÂ®ÃÂ£(ÃÂsÃÂÃÂb ÃÂ2ÃÂÃÂ¨ ÃÂ§	C\ZtkÃÂ­ÃÂÃÂ¶ÃÂmÃÂ¨ÃÂÃÂ¿\0ÃÂ¹ÃÂ¸ÃÂ¬ÃÂ¸ÃÂ»ÃÂ¨ÃÂ©\nÃÂ®YÃÂ+&@ÃÂRÃÂ»ÃÂ¡DTQ@\0ÃÂ2ÃÂÃÂ\" \06KÃÂjÃÂ½ÃÂvÃÂ[ÃÂ¤cÃÂ¹]ÃÂÃÂÃÂ·ÃÂ\rÃÂ¸ÃÂÃÂ¯dÃÂYÃÂ^ÃÂ ÃÂ ÃÂªÃÂnÃÂ:ÃÂhQÃÂÃÂq^FÃÂ ÃÂ»ÃÂ!ÃÂvÃÂÃÂ¨ÃÂ¥3ÃÂ¿da5rÃÂ·ÃÂeÃÂ¦ÃÂ¢ÃÂTÃÂÃÂ¼ÃÂ§ÃÂ¶ÃÂ«SRuÃÂÃÂ¢ÃÂ ÃÂªÃÂÃÂ%E0ÃÂmÃÂÃÂÃÂ¢ÃÂ£]*-RÃÂ¦\0\'\0ÃÂ©IÃÂh~ÃÂÃÂgÃÂKÃÂr-MÃÂÃÂ¹EÃÂ¯ÃÂÃÂ©ÃÂªwÃÂ»ÃÂÃÂ®ÃÂAÃÂ°ÃÂ³HhjHÃÂ²t#ÃÂ³*Q\0BJ&,ÃÂÃÂ#ÃÂÃÂ \ZLÃÂºwtÃÂÃÂwvb\nÃÂ¢vsCÃÂUÃÂ±`zÃÂ´ÃÂÃÂÃÂ¡ÃÂ©XÃÂ¤ÃÂÃÂÃÂÃÂÃÂ%dz~\"yÃÂ¬ÃÂÃÂÃÂÃÂPPÃÂ°ÃÂ>!8ÃÂÃÂ©-ÃÂ­ÃÂ¦ÃÂ/ÃÂ¥ÃÂÃÂÃÂGmÃÂ@ÃÂJjÃÂÃÂ BÃÂ¨ÃÂªÃÂ¡ÃÂH2F8ÃÂÃÂ²	F	:ÃÂ°ÃÂ´ÃÂ2)!VÃÂ+ÃÂ¢%1ÃÂÃÂÃÂJbÃÂªÃÂ9\ZÃÂ»ÃÂ´ÃÂÃÂ¬ÃÂ­ÃÂµÃÂÃÂ£ÃÂ°ZÃÂÃÂ³fÃÂ?VÃÂÃÂªÃÂ®Y\"ÃÂ­MÃÂºfTÃÂÃÂ7EÃÂ¢(D9;BÃÂ ÃÂ¦ÃÂ sPÃÂÃÂÃÂ»ÃÂ¤~ÃÂ´GÃÂÃÂvÃÂÃÂ¶ÃÂn)(kÃÂ³ÃÂ¼ÃÂÃÂI=RqgÃÂ¶ÃÂÃÂ9$-TÃÂtÃÂ¥]LÃÂpÃÂ¿ÃÂ°\"ÃÂÃÂÃÂµmÃÂÃÂ¹ÃÂÃÂ°\rl]ÃÂ ÃÂ´ÃÂ·ÃÂ|ÃÂÃÂÃÂÃÂtXQpN15;ÃÂÃÂªÃÂÃÂÃÂ¤leÃÂ£ÃÂÃÂÃÂÃÂ¢ÃÂÃÂ¥ÃÂ	rÃÂyÃÂªÃÂ[MÃÂºz0ÃÂZÃÂ£	\ZÃÂºÃÂ«ÃÂ«=pHRYÃÂ\\ÃÂ²ÃÂÃÂ±PC1ÃÂ¥iÃÂ²A@$ <$ÃÂBHÃÂ¥ÃÂÃÂ·ÃÂcÃÂ1ÃÂºÃÂ$\rKR.ÃÂÃÂYÃÂºÃÂÃÂ²ÃÂÃÂnEW3ÃÂÃÂÃÂÃÂºÃÂ©$ÃÂÃÂ¨qw!M\ZjeÃÂÃÂPÃÂc)=QÃÂÃÂ¹1ÃÂ»ÃÂ(qiTldj.ÃÂ¨ÃÂÃÂD) ÃÂ²4KÃÂ³&SXÃÂ©ÃÂ-QjÃÂ¨ÃÂLÃÂ­-AÃÂ¦ÃÂ®iÃÂÃÂ¦ÃÂªJÃÂ8ÃÂKÃÂÃÂ¹ÃÂVOc[UÃÂÃÂ[HÃÂ]fhÃÂª}iÃÂÃÂÃÂ(8ÃÂ¿\0hÃÂwÃÂ¦jÃÂÃÂ«xÃÂ°PqÃÂÃÂÃÂªÃÂp|B<ÃÂlPAÃÂ¨ÃÂÃÂ»dRnÃÂeÃÂ¦ÃÂ	ÃÂHPÃÂ\nDÃÂ)(\0RÃÂÃÂÃÂ¥ÃÂ»kÃÂ´V,\r$ÃÂ|ÃÂ¶ÃÂ©ÃÂ¯5utÃÂ¤ÃÂRZBÃÂÃÂ£DÃÂ¶ÃÂ¾ÃÂUq\0:ÃÂÃÂ/ÃÂ»ÃÂªÃÂÃÂºg 9ÃÂÃÂ©ÃÂ*DÃÂÃÂÃÂ6ÃÂÃÂµÃÂÃÂ¾ÃÂ­ÃÂÃÂ·ÃÂµ[pÃÂµtÃÂÃÂ©ÃÂ¡ÃÂ|ÃÂ´ÃÂ«ÃÂ¨ÃÂºv5&ÃÂÃÂLÃÂ®ÃÂMÃÂOT2*\nÃÂ²ÃÂÃÂÃÂÃÂ·nÃÂ¤ÃÂ¬ÃÂÃÂÃÂ¯ÃÂÃÂ²ÃÂµ\"ÃÂjÃÂHÃÂaÃÂ¹{ÃÂÃÂAÃÂ³ÃÂ¾QÃÂ¼ÃÂºÃÂ£ÃÂ3ÃÂÃÂÃÂ¹ÃÂAÃÂnÃÂ¶ÃÂÃÂÃÂÃÂ=I|ÃÂ3ÃÂÃÂ 0c ÃÂÃÂCÃÂAÃÂº5ÃÂ® 4ÃÂ¨ÃÂ WkÃÂ¦@ÃÂÃÂÃÂ¥ÃÂÃÂ¼ÃÂ´h21ÃÂ dÃÂÃÂÃÂ`<ÃÂ<tÃÂ<3ÃÂ®ÃÂ«ÃÂ¯9ÃÂÃÂsÃÂTÃÂ¹ÃÂ»ÃÂÃÂÃÂ¼ÃÂÃÂ®ÃÂ\ZÃÂÃÂ¼lBÃÂ \"ÃÂ³vÃÂ¦ÃÂ!)DÃÂÃÂÃÂ§ÃÂ¿\0:jÃÂ{BÃÂÃÂÃÂµÃÂÃÂ¶\n	ÃÂ\'IÃÂ°ÃÂÃÂÃÂ¿w=\Z4ÃÂºkkVJÃÂ¢wÃÂ¶ÃÂÃÂ¥JIÃÂ»ÃÂ©ÃÂ«nb8uÃÂYQ+ÃÂÃÂÃÂ ;ÃÂg8ÃÂ§WDÃÂÃÂ¶tÃÂÃÂ¦xÃÂºbÃÂt\0TÃÂ\ZÃÂ£ÃÂÃÂ¡ÃÂÃÂÃÂ a(\0`\nRCÃÂ\0-\Z4-ÃÂ±!#JnÃÂtA0ÃÂ¤b&ÃÂ\0ÃÂ·ÃÂ\08ÃÂÃÂ-xVÃÂ¬ÃÂ ÃÂÃÂÃÂÃÂ<ÃÂÃÂÃÂ±\0ÃÂz|<4hÃÂ|ÃÂÃÂ®ÃÂÃÂpÃÂ¢]\rÃÂaa~#ÃÂÃÂÃÂ:ÃÂ¢[ÃÂ³AÃÂ®ÃÂ1ÃÂ¦ÃÂ¿\0ÃÂÃÂÃÂ?ÃÂ>?ÃÂ¦ÃÂ\Z\nÃÂ©ÃÂ*\rAÃÂÃÂqÃÂÃÂ´ÃÂ¦ÃÂ¢ÃÂÃÂ²ÃÂÃÂ:ÃÂ³}5ÃÂ¬VÃÂ¢ÃÂI .BÃÂ¢ÃÂUÃÂ±qÃÂWÃÂÃÂ2 nÃÂÃÂÃÂ°  \r\Z4ÃÂªÃÂ§ÃÂÃÂhÃÂÃÂ Jn=ÃÂÃÂ½Ma\"ep@)ÃÂHlÃÂ¤xyÃÂ0ÃÂ£fÃÂ\ZÃÂ¿ÃÂ',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg'),(16,'SAPO','BEMBARAYO',0,_binary 'ÃÂ¿ÃÂÃÂ¿ÃÂ \0JFIF\0\0`\0`\0\0ÃÂ¿ÃÂ¾\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÃÂ¿ÃÂ\0C\0ÃÂ¿ÃÂ\0CÃÂ¿ÃÂ\0\0h\0h\"\0ÃÂ¿ÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÃÂ¿ÃÂ\0=\0\0\0\0\0\0\0!1	QÃÂ\n\"AaqÃÂ2ÃÂ¡ÃÂ±ÃÂÃÂÃÂ°ÃÂ¡#RrBÃÂÃÂ¢ÃÂ£ÃÂ±ÃÂ¿ÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÃÂ¿ÃÂ\0 \0\0\0\0\0\0\0\0\0\0\0\01QÃÂ!qÃÂÃÂÃÂ°ÃÂ±ÃÂ¿ÃÂ\0\0\0?\0ÃÂÃÂ)ÃÂ&ÃÂÃÂÃÂrÃÂºÃÂ¼ÃÂ¿MKÃÂªÃÂ¥ÃÂ¸}ÃÂ¶ÃÂÃÂ£ÃÂ¹ÃÂ¼ÃÂºÃÂªQÃÂ¤>ÃÂ¬ÃÂ.ÃÂÃÂ¯ÃÂ¸ÃÂ¼9ÃÂªÃÂ­ÃÂ®ÃÂºÃÂ:ÃÂ(w(d@ÃÂÃÂm@SHÃÂ©ÃÂ¿\0ÃÂ?}U0ÃÂ¤:ÃÂ¤3ÃÂ²ÃÂ¼:ÃÂ²ÃÂ¥ÃÂÃÂÃÂ]IÃÂ¦ÃÂÃÂ¯ÃÂ¯ÃÂ²xÃÂ¹:IÃÂ#ÃÂ¾ÃÂÃÂ¿\0ÃÂ´?}CÃÂ¹K?pÃÂ¸ÃÂ¿\0ÃÂgÃÂ³ÃÂ½ÃÂMU)J ÃÂÃÂÃÂÃÂ³ÃÂ«ÃÂ¦ÃÂÃÂ¯ÃÂµ2u<ÃÂ7rÃÂÃÂ¸ÃÂÃÂ·ÃÂµ(y{ÃÂ¿\0ÃÂÃÂºÃÂ°ÃÂªÃÂÃÂ¶ÃÂÃÂÃÂÃÂ´ÃÂ®kÃÂÃÂ{,ÃÂÃÂÃÂ£ZÃÂu<<ÃÂ¢IÃÂª$ÃÂÃÂÃÂ¥.ÃÂ½ÃÂÃÂÃÂ¦ÃÂUÃÂMc\"\ngTÃÂ6ÃÂÃÂÃÂp)JaÃÂ >ÃÂ°ÃÂ´/ÃÂÃÂ\"ÃÂPÃÂ¶ÃÂÃÂ\0\0zÃÂ¦ÃÂÃÂ¿ÃÂÃÂ¿\0^ÃÂ½ÃÂÃÂ¯fÃÂ»WÃÂÃÂÃÂ·ÃÂÃÂºBÃÂÃÂÃÂ®ÃÂ¤({`ÃÂÃÂÃÂ®jhH&6ÃÂ®ÃÂÃÂ¨zFÃÂÃÂkÃÂ¡ÃÂ¤bfÃÂªÃÂÃÂ´=FÃÂµtÃÂ¢$ÃÂºsXÃÂ¢ÃÂABÃÂ·@ÃÂmÃÂ¦ÃÂÃÂµ2N$ÃÂgFZÃÂªÃÂÃÂÃÂQÃÂ§ÃÂªÃÂº>wÃÂ#PÃÂJÃÂ³ÃÂpÃÂºÃÂÃÂ·YÃÂpÃÂ£ÃÂ¥ÃÂÃÂÃÂªÃÂ¨<SÃÂÃÂ[sÃÂ	ÃÂ§ÃÂcÃÂ¦0=@|C\\ÃÂÃÂ£ÃÂ«ÃÂÃÂÃÂ7	#ÃÂºÃÂ½ÃÂ¬\\WÃÂ¡ÃÂÃÂGÃÂ*ÃÂ©uÃÂR%ÃÂ¸7K<1ÃÂ9ÃÂÃÂÃÂµÃÂÃÂ§PÃÂ«ÃÂÃÂÃÂ¶ÃÂ¥ÃÂ¯ÃÂ.ÃÂ¯ÃÂÃÂ5\ZÃÂ}yG1DÃÂ«DÃÂ3EÃÂ²ÃÂ¬ÃÂ¦ÃÂÃÂUÃÂµz!W*ÃÂ£EÃÂªtLÃÂg ÃÂ¥QÃÂÃÂ©ÃÂ4ÃÂ¬\"ÃÂÃÂq0ÃÂÃÂ¦\0oxÃÂPÃÂ±ÃÂªÃÂÃÂ­ÃÂ¤ÃÂ­-\nÃÂÃÂÃÂ®ÃÂyÃÂ¯\nÃÂ±ÃÂÃÂÃÂÃÂ sÃÂNÃÂÃÂ´ÃÂÃÂ¯FÃÂ»p{ÃÂ¨ÃÂuÃÂ ÃÂÃÂc~.Mot-ÃÂ´EÃÂºÃÂÃÂ§lÃÂ¤ÃÂw(ÃÂ¼ÃÂ¬ÃÂBÃÂ£M8ÃÂ¨n1,ÃÂ´ÃÂªHÃÂ+ÃÂÃÂµHxÃÂÃÂÃÂ¼mÃÂºÃÂ¯ÃÂÃÂ³PÃÂ*ÃÂ .\\ÃÂÃÂ¿ÃÂ¹-ÃÂ¶N6ÃÂÃÂÃÂ|ÃÂ®~RI7$ÃÂÃÂ³ÃÂmÃÂ¼ÃÂ¶ÃÂÃÂ-ÃÂºÃÂ©ÃÂ!YÃÂÃÂ9S\0ÃÂ$ÃÂªQ)ÃÂÃÂÃÂ¾ÃÂ£ÃÂ3ÃÂyÃÂ»ÃÂ´k ^@ÃÂÃÂ¼ÃÂ©ÃÂÃÂ1ÃÂÃÂ¦>ÃÂLÃÂ¨ÃÂVQ\0ÃÂÃÂ©ÃÂÃÂ#ÃÂÃÂÃÂ¨=1ÃÂÃÂsÃÂ¾51ÃÂºÃÂÃÂ´RÃÂMÃÂ!\0\0ÃÂµÃÂ¸\0tÃÂºÃÂ¸ÃÂª<ÃÂ¢ÃÂÃÂ­ÃÂ ÃÂGÃÂ¥ÃÂºÃÂÃÂªÃÂ¨)pÃÂ~?ÃÂ¶ÃÂª\0`\0ÃÂÃÂ¨ÃÂ¨ÃÂ&wkÃÂÃÂ§ÃÂiÃÂÃÂÃÂ·ÃÂ¶ÃÂ¢EÃÂ>ÃÂ·ÃÂ©iÃÂ¿ÃÂ­%ÃÂ³?xÃÂ¢nÃÂ¯nÃÂÃÂ©JFÃÂ¾bdÃÂÃÂ¦TÃÂKÃÂ¹ÃÂÃÂ >ÃÂ4ÃÂªÃÂªpÃÂuÃÂÃÂªÃÂ¡T\nÃÂÃÂÃÂ­8ÃÂ­ÃÂUyqÃÂ¨8ÃÂ¶ÃÂ¨ÃÂÃÂ¥CÃÂR3QU=CÃÂÃÂÃÂ¦ÃÂ«ÃÂ¤ÃÂ©ÃÂÃÂÃÂ¡ÃÂÃÂÃÂÃÂpCÃÂ©ÃÂÃÂvÃÂ©	P]ÃÂ»ÃÂ´ÃÂ9ÃÂº*ÃÂSÃÂ¯uÃÂhÃÂuMÃÂÃÂ5ÃÂo)ÃÂ1ÃÂ£|ÃÂ·bÃÂ¶ÃÂÃÂÃÂ©ÃÂ¥ÃÂL\n\'ÃÂ«VJÃÂ¤EBa6_ÃÂ·ÃÂÃÂ·ÃÂ¦O~ÃÂ.uÃÂÃÂ¤(MÃÂv}ÃÂ®:ÃÂºpÃÂ¨\"ÃÂÃÂ¯~*ÃÂiYSÃÂ´ÃÂÃÂ ÃÂÃÂÃÂµÃÂÃÂ©ÃÂÃÂ«ÃÂ<ÃÂÃÂ)ÃÂ¨ÃÂÃÂÃÂ»H@-ÃÂUÃÂ«ÃÂ¦4ÃÂÃÂ¤ÃÂ£ÃÂÃÂ®ÃÂÃÂ6ZEÃÂÃÂ¦ÃÂ\\ÃÂ ÃÂ­g/KÃÂeJÃÂ JbÃÂ¢ÃÂ ÃÂÃÂÃÂº@BÃÂ3ÃÂ»FÃÂ¢ÃÂ³ÃÂ	OÃÂ±ÃÂ ÃÂ§ÃÂ¦*ÃÂªÃÂ¦ÃÂÃÂXÃÂ¥TÃÂ:ÃÂ\\ÃÂÃÂÃÂzKÃÂÃÂÃÂYÃÂ¡ÃÂÃÂ¤ÃÂÃÂÃÂÃÂªw$IAÃÂ¢PÃÂ¹ZÃÂÃÂ«ÃÂ9DADÃÂNÃÂ°\ZÃÂªE?ÃÂÃÂÃÂEÃÂ»8ÃÂÃÂ¾ÃÂ :ÃÂ&ÃÂ¡@Dy5ÃÂÃÂ´ÃÂÃÂÃÂ³ÃÂmÃÂ¡ÃÂ»}ÃÂ²moÃÂ¯}ÃÂ¡JÃÂÃÂ·ÃÂ¶ÃÂ« pWÃÂ¾ÃÂZÃÂÃÂ¾ÃÂ¦tÃÂÃÂªÃÂS6ÃÂ³ÃÂ±ÃÂ´ÃÂ84ÃÂBÃÂTZÃÂ \"@ÃÂSÃÂ¼ÃÂ»!ÃÂ¶ÃÂ¶;=ÃÂ¬ÃÂ²ÃÂUÃÂ¢ÃÂÃÂMÃÂlÃÂ¦ÃÂBÃÂ¤ÃÂÃÂ *\'EÃÂÃÂ®MÃÂ\\ÃÂµÃÂ¥VÃÂÃÂ°(ÃÂ¸ÃÂ^iÃÂµ*ÃÂÃÂ°\0VÃÂ\rÃÂÃÂ¦ÃÂ¥*ÃÂ£ÃÂ¼?}SÃÂzÃÂqdGaÃÂÃÂ³ÃÂgÃÂ°\0\0\0ZÃÂÃÂ]ÃÂ¡[ÃÂºÃÂ<cÃÂÃÂ¾ÃÂ³||>ÃÂ½:hÃÂ+ÃÂ¼`-ÃÂ¿ÃÂ¨ÃÂ³ÃÂ¯ÃÂqÃÂÃÂÃÂ©ÃÂ9@ÃÂ±Z4DÃÂ½ÃÂ§ÃÂºÃÂ©jÃÂ©ÃÂºyÃÂ¾ÃÂÃÂ¨ÃÂ !ÃÂ?ÃÂ§ÃÂ¼ÃÂ©ÃÂ¥ÃÂ ÃÂ>ÃÂ°ÃÂ¼ÃÂÃÂ³\rUÃÂ\0ÃÂ ÃÂ?ÃÂtÃÂ¼2rbcÃÂJIÃÂ»AÃÂtsG/ÃÂ¤9TÃÂ¨7dÃÂÃÂ*9xÃÂ­uÃÂ DÃÂjÃÂ%WUCÃÂÃÂ¦cÃÂ ^ÃÂ­#ovÃÂ¬[ÃÂ­7ÃÂ³^ÃÂ¶ÃÂ6ÃÂjÃÂ®ÃÂ²$ÃÂÃÂÃÂOP\nÃÂ¡ÃÂÃÂ®Q\\ÃÂ³ÃÂ¬ÃÂ¦ÃÂY4ÃÂ ÃÂ­ÃÂJÃÂµÃÂ¯ÃÂ®\nVÃÂ¯EÃÂT*ÃÂ\"CÃÂÃÂ·ÃÂÃÂ¹ÃÂÃÂ·9ÃÂ»=ÃÂÃÂ®ÃÂª`ÃÂ«=ÃÂÃÂ¨ÃÂ«zÃÂÃÂ¤ÃÂÃÂ´vÃÂ ÃÂÃÂºÃÂ·t\ZhDZÃÂtÃÂ~@ÃÂÃÂ¨xÃÂÃÂÃÂ@ÃÂ¬ÃÂ«ÃÂÃÂ¥CÃÂÃÂ9ÃÂ]ÃÂµGÃÂ¶oÃÂÃÂ¤ÃÂÃÂÃÂ±ÃÂ«\Zn.ÃÂ´ÃÂ¶ÃÂ¥ÃÂ»+ÃÂ*ÃÂ½ÃÂT+ÃÂµÃÂ¨8ÃÂ«WZÃÂvÃÂ5ÃÂÃÂ¥\nmÃÂ£ÃÂª:ÃÂ­ÃÂ¡ÃÂ² tÃÂ«ÃÂTÃÂ¼ÃÂ3T-ÃÂÃÂ¼{ÃÂ¹ÃÂÃÂ·ÃÂ¶ÃÂH3ÃÂÃÂ«wAyÃÂ­ÃÂµÃÂÃÂ¦TÃÂ]%ÃÂ&%ÃÂÃÂ¬JRÃÂ²ÃÂHÃÂÃÂVl>ÃÂm4ÃÂªÃÂHÃÂBÃÂ»\\2ÃÂ1>ÃÂºjÃÂ¯ÃÂªÃÂÃÂµ{pÃÂ¬ÃÂÃÂÃÂÃÂ²lÃÂVÃÂªÃÂÃÂ¬ÃÂÃÂ»ÃÂ³tÃÂ»P*g*ÃÂZÃÂµÃÂ­}ÃÂH	ÃÂGRoBÃÂÃÂ ÃÂYÃÂ«ÃÂ ÃÂÃÂ9ZÃÂ¶>Ej*ÃÂÃÂ0ÃÂRÃÂµ9c\"ÃÂÃÂPÃÂ9jÃÂªÃÂÃÂ@ÃÂÃÂ«ÃÂ«ÃÂÃÂ´ÃÂlpÃÂÃÂQÃÂ¨ÃÂ³Z\nfÃÂ¬ÃÂ¹ÃÂ»ÃÂÃÂ9ÃÂ%ÃÂRÃÂ©ÃÂ[tÃÂ·ÃÂ\"ÃÂÃÂ°ÃÂ´ÃÂÃÂ¦IÃÂ5ÃÂ²ÃÂÃÂ¥DÃÂ²ÃÂÃÂ°ÃÂ¶ÃÂº0ÃÂÃÂÃÂ»ÃÂ,DÃÂ*$#ÃÂÃÂ´ÃÂÃÂ¤ÃÂ§ÃÂ¡j)ÃÂ£-/MÃÂDp\nROU(8ÃÂgÃÂ\0\0dÃÂ¬`ÃÂ/ÃÂ\0\0ÃÂÃÂ§ÃÂ/(ÃÂ´IQUÃÂ½ÃÂÃÂJkÃÂ¥\\/ÃÂ­uÃÂ`ÃÂÃÂÃÂºÃÂ¶ÃÂ=US\nf8ÃÂ@qÃÂ%ÃÂ¥ÃÂÃÂ¹ÃÂ>_ÃÂ¨ÃÂªMLnÃÂ¾_O~:ÃÂÃÂ³ÃÂ KÃÂ ÃÂ±ÃÂ®!HjeÃÂ©T)NC\0ÃÂrÃÂÃÂrÃÂRÃÂÃÂ¦)ÃÂ!ÃÂ@ÃÂ !ÃÂ@CFÃÂ©\\ÃÂµÃÂÃÂÃÂÃÂ\\ÃÂ¢ DÃÂ1ÃÂ \"\0ÃÂ²\0ÃÂ\0ÃÂ¼ÃÂ´h2ÃÂºyÃÂ¾ÃÂÃÂ ÃÂ<ÃÂ¾ÃÂÃÂÃÂ¾zÃÂÃÂÃÂ«ÃÂu}ÃÂ?ÃÂ®ÃÂm\Z4h5ÃÂ»t[ÃÂÃÂµÃÂAÃÂ²5ÃÂÃÂ¾ÃÂ¼ÃÂ²R1ÃÂÃÂAd	ÃÂ¶ÃÂC)#PNGSÃÂPÃÂÃÂ´)\\6R^fZbQÃÂ£VÃÂ¬ÃÂY \nÃÂ®ÃÂ,ÃÂFÃÂ®MÃÂÃÂ¾ÃÂ/iMÃÂÃÂ­	ÃÂÃÂ°VÃÂÃÂÃÂNTÃÂÃÂªÃÂÃÂÃÂÃÂ¬ÃÂª9ÃÂiÃÂº*jJÃÂ½ÃÂ~ÃÂfÃÂ¢ÃÂzÃÂ£I9ÃÂÃÂ¨(8ÃÂ¸ÃÂÃÂÃÂpwÃÂºÃÂ²iÃÂ¶YS5TÃÂ¤~vÃÂ¨ÃÂ¶ÃÂ¿eÃÂ·ÃÂdÃÂ«;)+wZÃÂµnWmAu#ÃÂ¦af#\\ÃÂµ?UÃÂÃÂÃÂÃÂ°ÃÂ¶ÃÂÃÂ«)ÃÂDÃÂÃÂÃÂÃÂfnÃÂ±ÃÂ³ÃÂ´ÃÂ»ÃÂ§	:`ÃÂ¡ÃÂ£7ÃÂ«ÃÂ·ÃÂÃÂ3ÃÂyÃÂ·+ÃÂp\"lÃÂ¥ÃÂÃÂ¸ÃÂÃÂ²ÃÂ°ÃÂÃÂ¤ÃÂ­ÃÂ}JÃÂÃÂÃÂ,ÃÂQGÃÂÃÂdÃÂÃÂÃÂ¼iQÃÂÃÂ¦ÃÂÃÂ©ÃÂÃÂ¢ÃÂ¡hÃÂÃÂ¨D)ÃÂ¯Qu,ÃÂgÃÂ°ÃÂªÃÂ½ÃÂÃÂµÃÂªBÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂ¼ÃÂ®ÃÂ ÃÂ«f4ÃÂÃÂºÃÂ¤ÃÂ¶ÃÂDÃÂ¹JÃÂÃÂ»n]HÃÂÃÂÃÂÃÂ­xZÃÂÃÂÃÂ´shÃÂÃÂÃÂxÃÂªÃÂwsÃÂ§ÃÂr*ÃÂ) ÃÂzbpÃÂÃÂ´ÃÂwKhl/gÃÂUE\\z=ÃÂÃÂ\rÃÂL#f)ÃÂ#CÃÂ¿ZNÃÂ´ÃÂ¨ÃÂ5ÃÂ»ÃÂ,%ÃÂÃÂ¶)ÃÂÃÂÃÂ!ÃÂÃÂ±HÃÂµ\ZÃÂ´ÃÂ¹ÃÂ\\ÃÂ¨ÃÂÃÂÃÂ®ÃÂÃÂ¨ÃÂÃÂ.ÃÂGÃÂÃÂÃÂ¢ÃÂ­ÃÂµÃÂ¦oSÃÂºÃÂ¾ÃÂ©ÃÂNÃÂjZÃÂÃÂ®cjÃÂ©zUÃÂYÃÂÃÂÃÂ¦ÃÂ¥a\"aÃÂ«ÃÂÃÂ¦ÃÂÃÂÃÂ¥jÃÂµ^SÃÂ ÃÂÃÂÃÂ,ÃÂ¡ÃÂ<ÃÂfLÃÂÃÂ¯uu%iihÃÂÃÂÃÂ¯ÃÂ¹ÃÂ¥ÃÂÃÂ¶ÃÂµÃÂ¶ÃÂÃÂªÃÂªÃÂ¢ÃÂXjiÃÂeÃÂ»ÃÂ¦ÃÂÃÂI[ÃÂQÃÂ2ÃÂ¨(ÃÂ«ÃÂ_SOÃÂªÃÂ§4ÃÂ¥*ÃÂ¡ÃÂGpÃÂµ4LÃÂiHÃÂMÃÂG}ÃÂ«ÃÂ¦.LÃÂÃÂ«hÃÂÃÂÃÂ·t=?gÃÂÃÂ§ÃÂrÃÂÃÂÃÂpÃÂ¢=FnÃÂi+ ÃÂÃÂ,ÃÂ£AÃÂÃÂ+ÃÂ	ÃÂ\nÃÂ¦\nÃÂ;jCTÃÂÃÂ·jÃÂÃÂÃÂÃÂºz6mmjv&ÃÂ½ÃÂ¿\0NÃÂ®w4ÃÂ¾ÃÂ±ky;ÃÂ²ÃÂ­,ÃÂ¼3hÃÂ´-ÃÂº|ÃÂ¥CkXB6ÃÂMÃÂ»ÃÂ¥j1ÃÂmLP/$ÃÂ³8ÃÂÃÂ·V@#ÃÂÃÂ±Q6ÃÂÃÂ¸ÃÂ£ÃÂÃÂ¬ÃÂ¢M.Y[ÃÂÃÂ¶ÃÂiÃÂÃÂZ~ÃÂÃÂtÃÂÃÂmÃÂÃÂÃÂÃÂBÃÂ7MÃÂcÃÂ­N5ÃÂd\nbÃÂÃÂ¨ÃÂ¤C,ÃÂS1ÃÂÃÂ¯ÃÂÃÂ]ÃÂÃÂ¹UÃÂÃÂ7m*ÃÂºÃÂzÃÂ¦ÃÂ¢ÃÂ¬mÃÂÃÂ¦iS2ÃÂ»WHQ4ÃÂ­EF)XÃÂCDÃÂ¹MÃÂ²nÃÂdÃÂ¾ÃÂ¨ÃÂÃÂÃÂ1^ÃÂº{ÃÂ.ÃÂ¨ÃÂ¤hfÃÂ­\nÃÂrÃÂªMÃÂÃÂ<_ÃÂ¾|ÃÂ¹ÃÂ§RÃÂªcÃÂµÃÂ«ÃÂÃÂ§O.ÃÂÃÂ¿<ÃÂª]3ÃÂ»ÃÂÃÂÃÂ¡ÃÂ¤!ÃÂ¤sÃÂtHÃÂÃÂ¿\0wÃÂFÃÂ§ÃÂ»EÃÂsÃÂ 8ÃÂÃÂÃÂÃÂXÃÂ¥(ÃÂ¦9$ÃÂÃÂ¶p\0ÃÂ·ÃÂÃÂ°ÃÂÃÂN?O?ÃÂu}ÃÂ?ÃÂ¦ÃÂ ~ÃÂ^CÃÂ¨ÃÂÃÂ®ÃÂ¹ÃÂ½thÃÂÃÂ¼eÃÂ·p8dp?ÃÂ|sÃÂ\0ÃÂ¦8\rjÃÂÃÂ©ÃÂÃÂ¦ÃÂÃÂ¶ÃÂ°ÃÂÃÂÃÂÃÂÃÂ¸+[BÃÂRÃÂª+ÃÂ°ÃÂÃÂ«#\\ÃÂÃÂRÃÂ¬XÃÂÃÂIÃÂÃÂ¢!ÃÂPQÃÂ²aÃÂÃÂ@\0GAÃÂ´ÃÂºÃÂ¤rÃÂyÃÂÃÂÃÂÃÂ´`ÃÂÃÂÃÂÃÂO,0ÃÂÃÂEÃÂ¸OJ7avÃÂGÃÂÃÂÃÂ~ÃÂ¦ÃÂÃÂdÃÂVÃÂÃÂ$\r4wÃÂÃÂlÃÂÃÂQÃÂÃÂÃÂÃÂ¢ÃÂ\0ÃÂ;rÃÂÃÂÃÂÃÂ¸ÃÂ«ÃÂ²ÃÂÃÂÃÂKwl,tJÃÂtÃÂÃÂÃÂ3ÃÂÃÂÃÂ¦EÃÂaÃÂªÃÂFÃÂÃÂ`ÃÂ:RÃÂ¢BÃÂÃÂ\0ÃÂAÃÂÃÂ®bnÃÂÃÂ3ÃÂÃÂÃÂÃÂ±ÃÂ}.ÃÂ½ÃÂ¤c\0ÃÂ¤DUtÃÂ¹fÃÂ¨1ÃÂÃÂ¥OÃÂ!I]ÃÂ¦LvIn*ÃÂÃÂ¹ÃÂÃÂÃÂ§&ÃÂ¬;ÃÂÃÂÃÂ¶ÃÂÃÂÃÂ¦ÃÂ§ÃÂ¯;ÃÂª*ÃÂCLÃÂ°EÃÂ²ÃÂ±LR7ÃÂ²BÃÂÃÂÃÂÃÂÃÂ¨ÃÂ©ÃÂ#ÃÂÃÂÃÂ»m6ÃÂ°ÃÂ±ÃÂÃÂ$ÃÂÃÂ«ÃÂ«ÃÂEMÃÂº~ÃÂÃÂ¼ÃÂÃÂªÃÂ³-yÃÂ¸-ÃÂ>ÃÂXÃÂ©ÃÂ«H[vÃÂÃÂBÃÂ¬ÃÂZ.z\rÃÂ¢$fÃÂDxD%ÃÂ¦ÃÂÃÂÃÂ{ÃÂ¾16ÃÂ/ÃÂÃÂ±ÃÂÃÂÃÂÃÂÃÂ(ÃÂÃÂÃÂ¯;ÃÂÃÂ¸ÃÂ±ÃÂ³-*ÃÂmÃÂSBÃÂ¹ÃÂ¨dÃÂO,ÃÂ²ÃÂ	ISÃÂ°ÃÂµltÃÂÃÂÃÂ¬ÃÂ¢4{ÃÂ]ÃÂÃÂÃÂÃÂ±ÃÂÃÂÃÂÃÂ WÃÂÃÂ¼ÃÂPÃÂÃÂ´}#UHÃÂÃÂJÃÂ¶ÃÂ¨eJNÃÂ£ ÃÂ¹ÃÂ¤ÃÂ­2ÃÂ~EÃÂ´ÃÂ²ÃÂ®ÃÂ¡[;ÃÂMÃÂÃÂ\"dÃÂÃÂ{ÃÂ!ÃÂ2ÃÂÃÂÃÂ&ÃÂ²DPÃÂ³6{r%ÃÂ¦AMÃÂÃÂÃÂ ÃÂ»GGvÃÂÃÂÃÂ¡jÃÂÃÂªÃÂÃÂlÃÂÃÂ,aÃÂÃÂ·gL!ÃÂÃÂ²ÃÂ1L,zÃÂ¸6rÃÂ­ÃÂ­ÃÂj>ÃÂÃÂ¼ÃÂÃÂ«ÃÂÃÂªÃÂÃÂÃÂºxÃÂ:ÃÂNÃÂ|ÃÂ¹ÃÂ\"ÃÂBÃÂ£ÃÂ¬ÃÂMeÃÂAÃÂÃÂ*ÃÂ»TLÃÂ¢ÃÂ¡SLGÃÂD7kÃÂ»ÃÂÃÂ½ÃÂ»nÃÂ¦ÃÂª[3ÃÂ½[ÃÂ¢ÃÂ´e[\"ÃÂBj\"ÃÂÃÂ¨%*JÃÂ®aÃÂÃÂUIÃÂÃÂ\naÃÂÃÂ¸ÃÂÃÂµÃÂÃÂ;ÃÂ¨ÃÂ¦+ÃÂÃÂ©ÃÂMÃÂWAÃÂpÃÂ«ÃÂ\"<ÃÂ0?ÃÂ¨ÃÂµÃÂ«ÃÂ¹ÃÂ³ÃÂÃÂ¡ÃÂ®xÃÂÃÂ·wÃÂµRÃÂ0ÃÂ§ZÃÂÃÂ«ÃÂ¯g^3ÃÂMÃÂ-ÃÂµÃÂ¢ÃÂ©ÃÂªÃÂºÃÂ¶ÃÂªHÃÂHPÃÂ¯ÃÂ©ÃÂ«\\ZNb%eSÃÂÃÂ¬ÃÂ¢ÃÂÃÂeÃÂ¢ÃÂªd\nRÃÂ»[ÃÂ²CÃÂ´ÃÂº3ÃÂ´ÃÂÃÂÃÂJÃÂÃÂ4eyfÃÂªÃÂ¸ÃÂ2ÃÂ¹ÃÂ;JÃÂÃÂ¨ÃÂTPFÃÂ©!\'ÃÂ©ÃÂOTÃÂ±-V`UÃÂ?ÃÂÃÂ¨ÃÂÃÂ.ÃÂÃÂFÃÂÃÂlÃÂ&ÃÂª@ÃÂ§5ÃÂ¢2.)idÃÂ¢ÃÂ*oÃÂÃÂP@ÃÂ¦PR\08ÃÂxCÃÂ|dqÃÂJbÃÂÃÂ¼FÃÂ¾ÃÂ¼ÃÂ¹ÃÂ$SÃÂ³:WÃÂ¸l	ÃÂÃÂ®ÃÂ·KÃÂÃÂ¤\0<gÃÂ¢7ÃÂ²!ÃÂ\"ÃÂÃÂ´h0ÃÂ¶ÃÂ§ÃÂ·#nÃÂ¶ÃÂejÃÂÃÂ¥tUÃÂ-)J-OÃÂ°3HÃÂÃÂ±<ÃÂÃÂ¬ÃÂ¥YQFRtÃÂ+ÃÂÃÂ½ÃÂÃÂlÃÂ¬ÃÂ¬ÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂnÃÂ¢ÃÂ²RÃÂÃÂÃÂ°jÃÂºÃÂCÃÂ»ÃÂÃÂqÃÂ_ÃÂ°UÃÂÃÂ,ÃÂÃÂWÃÂ§ÃÂ48ÃÂ¥&ÃÂÃÂ¸E^\nÃÂ±ÃÂÃÂ¦ ÃÂ·*ÃÂ¢ÃÂ!ÃÂ¼=G)ÃÂÃÂ«60ÃÂÃÂ´:ÃÂ ÃÂµTÃÂ°ÃÂ¨ÃÂ«AÃÂ¼\rÃÂ´[}ÃÂÃÂ­ÃÂ¾ÃÂ»ÃÂ°ÃÂ^!ÃÂ¤ÃÂYÃÂ¥ÃÂ²ÃÂ¤ÃÂÃÂ{\r-/NÃÂÃÂ±ÃÂ¨iÃÂÃÂÃÂ©6\"ÃÂÃÂ¤!&ÃÂ£ÃÂH7ÃÂvÃÂÃÂµ~ÃÂÃÂ5ÃÂ@ÃÂ­kÃÂ¯=yhÃÂ®dÃÂ¬ÃÂÃÂ¿\0ÃÂ®ÃÂ©uÃÂPÃÂªÃÂ²,ÃÂR*ÃÂ¤%0ÃÂ08%)i<ÃÂxGÃÂ½ÃÂ¯ÃÂ8ÃÂµÃÂt	ÃÂÃÂ¼;ÃÂ»ÃÂotM,ÃÂÃÂÃÂºÃÂÃÂÃÂÃÂ\\W:ÃÂÃÂ\'GÃÂ¯JÃÂ ÃÂÃÂÃÂ§ÃÂjÃÂÃÂ\"ÃÂ¢\0LV(ÃÂÃÂ1ÃÂ%ÃÂÃÂ^ÃÂºÃÂºÃÂ»oOTÃÂEÃÂ¼ÃÂ§%$U0ÃÂ­VÃÂÃÂÃÂÃÂ­+ÃÂÃÂ¢ÃÂ¡J\'ÃÂÃÂÃÂ®ÃÂ£(ÃÂsÃÂÃÂb ÃÂ2ÃÂÃÂ¨ ÃÂ§	C\ZtkÃÂ­ÃÂÃÂ¶ÃÂmÃÂ¨ÃÂÃÂ¿\0ÃÂ¹ÃÂ¸ÃÂ¬ÃÂ¸ÃÂ»ÃÂ¨ÃÂ©\nÃÂ®YÃÂ+&@ÃÂRÃÂ»ÃÂ¡DTQ@\0ÃÂ2ÃÂÃÂ\" \06KÃÂjÃÂ½ÃÂvÃÂ[ÃÂ¤cÃÂ¹]ÃÂÃÂÃÂ·ÃÂ\rÃÂ¸ÃÂÃÂ¯dÃÂYÃÂ^ÃÂ ÃÂ ÃÂªÃÂnÃÂ:ÃÂhQÃÂÃÂq^FÃÂ ÃÂ»ÃÂ!ÃÂvÃÂÃÂ¨ÃÂ¥3ÃÂ¿da5rÃÂ·ÃÂeÃÂ¦ÃÂ¢ÃÂTÃÂÃÂ¼ÃÂ§ÃÂ¶ÃÂ«SRuÃÂÃÂ¢ÃÂ ÃÂªÃÂÃÂ%E0ÃÂmÃÂÃÂÃÂ¢ÃÂ£]*-RÃÂ¦\0\'\0ÃÂ©IÃÂh~ÃÂÃÂgÃÂKÃÂr-MÃÂÃÂ¹EÃÂ¯ÃÂÃÂ©ÃÂªwÃÂ»ÃÂÃÂ®ÃÂAÃÂ°ÃÂ³HhjHÃÂ²t#ÃÂ³*Q\0BJ&,ÃÂÃÂ#ÃÂÃÂ \ZLÃÂºwtÃÂÃÂwvb\nÃÂ¢vsCÃÂUÃÂ±`zÃÂ´ÃÂÃÂÃÂ¡ÃÂ©XÃÂ¤ÃÂÃÂÃÂÃÂÃÂ%dz~\"yÃÂ¬ÃÂÃÂÃÂÃÂPPÃÂ°ÃÂ>!8ÃÂÃÂ©-ÃÂ­ÃÂ¦ÃÂ/ÃÂ¥ÃÂÃÂÃÂGmÃÂ@ÃÂJjÃÂÃÂ BÃÂ¨ÃÂªÃÂ¡ÃÂH2F8ÃÂÃÂ²	F	:ÃÂ°ÃÂ´ÃÂ2)!VÃÂ+ÃÂ¢%1ÃÂÃÂÃÂJbÃÂªÃÂ9\ZÃÂ»ÃÂ´ÃÂÃÂ¬ÃÂ­ÃÂµÃÂÃÂ£ÃÂ°ZÃÂÃÂ³fÃÂ?VÃÂÃÂªÃÂ®Y\"ÃÂ­MÃÂºfTÃÂÃÂ7EÃÂ¢(D9;BÃÂ ÃÂ¦ÃÂ sPÃÂÃÂÃÂ»ÃÂ¤~ÃÂ´GÃÂÃÂvÃÂÃÂ¶ÃÂn)(kÃÂ³ÃÂ¼ÃÂÃÂI=RqgÃÂ¶ÃÂÃÂ9$-TÃÂtÃÂ¥]LÃÂpÃÂ¿ÃÂ°\"ÃÂÃÂÃÂµmÃÂÃÂ¹ÃÂÃÂ°\rl]ÃÂ ÃÂ´ÃÂ·ÃÂ|ÃÂÃÂÃÂÃÂtXQpN15;ÃÂÃÂªÃÂÃÂÃÂ¤leÃÂ£ÃÂÃÂÃÂÃÂ¢ÃÂÃÂ¥ÃÂ	rÃÂyÃÂªÃÂ[MÃÂºz0ÃÂZÃÂ£	\ZÃÂºÃÂ«ÃÂ«=pHRYÃÂ\\ÃÂ²ÃÂÃÂ±PC1ÃÂ¥iÃÂ²A@$ <$ÃÂBHÃÂ¥ÃÂÃÂ·ÃÂcÃÂ1ÃÂºÃÂ$\rKR.ÃÂÃÂYÃÂºÃÂÃÂ²ÃÂÃÂnEW3ÃÂÃÂÃÂÃÂºÃÂ©$ÃÂÃÂ¨qw!M\ZjeÃÂÃÂPÃÂc)=QÃÂÃÂ¹1ÃÂ»ÃÂ(qiTldj.ÃÂ¨ÃÂÃÂD) ÃÂ²4KÃÂ³&SXÃÂ©ÃÂ-QjÃÂ¨ÃÂLÃÂ­-AÃÂ¦ÃÂ®iÃÂÃÂ¦ÃÂªJÃÂ8ÃÂKÃÂÃÂ¹ÃÂVOc[UÃÂÃÂ[HÃÂ]fhÃÂª}iÃÂÃÂÃÂ(8ÃÂ¿\0hÃÂwÃÂ¦jÃÂÃÂ«xÃÂ°PqÃÂÃÂÃÂªÃÂp|B<ÃÂlPAÃÂ¨ÃÂÃÂ»dRnÃÂeÃÂ¦ÃÂ	ÃÂHPÃÂ\nDÃÂ)(\0RÃÂÃÂÃÂ¥ÃÂ»kÃÂ´V,\r$ÃÂ|ÃÂ¶ÃÂ©ÃÂ¯5utÃÂ¤ÃÂRZBÃÂÃÂ£DÃÂ¶ÃÂ¾ÃÂUq\0:ÃÂÃÂ/ÃÂ»ÃÂªÃÂÃÂºg 9ÃÂÃÂ©ÃÂ*DÃÂÃÂÃÂ6ÃÂÃÂµÃÂÃÂ¾ÃÂ­ÃÂÃÂ·ÃÂµ[pÃÂµtÃÂÃÂ©ÃÂ¡ÃÂ|ÃÂ´ÃÂ«ÃÂ¨ÃÂºv5&ÃÂÃÂLÃÂ®ÃÂMÃÂOT2*\nÃÂ²ÃÂÃÂÃÂÃÂ·nÃÂ¤ÃÂ¬ÃÂÃÂÃÂ¯ÃÂÃÂ²ÃÂµ\"ÃÂjÃÂHÃÂaÃÂ¹{ÃÂÃÂAÃÂ³ÃÂ¾QÃÂ¼ÃÂºÃÂ£ÃÂ3ÃÂÃÂÃÂ¹ÃÂAÃÂnÃÂ¶ÃÂÃÂÃÂÃÂ=I|ÃÂ3ÃÂÃÂ 0c ÃÂÃÂCÃÂAÃÂº5ÃÂ® 4ÃÂ¨ÃÂ WkÃÂ¦@ÃÂÃÂÃÂ¥ÃÂÃÂ¼ÃÂ´h21ÃÂ dÃÂÃÂÃÂ`<ÃÂ<tÃÂ<3ÃÂ®ÃÂ«ÃÂ¯9ÃÂÃÂsÃÂTÃÂ¹ÃÂ»ÃÂÃÂÃÂ¼ÃÂÃÂ®ÃÂ\ZÃÂÃÂ¼lBÃÂ \"ÃÂ³vÃÂ¦ÃÂ!)DÃÂÃÂÃÂ§ÃÂ¿\0:jÃÂ{BÃÂÃÂÃÂµÃÂÃÂ¶\n	ÃÂ\'IÃÂ°ÃÂÃÂÃÂ¿w=\Z4ÃÂºkkVJÃÂ¢wÃÂ¶ÃÂÃÂ¥JIÃÂ»ÃÂ©ÃÂ«nb8uÃÂYQ+ÃÂÃÂÃÂ ;ÃÂg8ÃÂ§WDÃÂÃÂ¶tÃÂÃÂ¦xÃÂºbÃÂt\0TÃÂ\ZÃÂ£ÃÂÃÂ¡ÃÂÃÂÃÂ a(\0`\nRCÃÂ\0-\Z4-ÃÂ±!#JnÃÂtA0ÃÂ¤b&ÃÂ\0ÃÂ·ÃÂ\08ÃÂÃÂ-xVÃÂ¬ÃÂ ÃÂÃÂÃÂÃÂ<ÃÂÃÂÃÂ±\0ÃÂz|<4hÃÂ|ÃÂÃÂ®ÃÂÃÂpÃÂ¢]\rÃÂaa~#ÃÂÃÂÃÂ:ÃÂ¢[ÃÂ³AÃÂ®ÃÂ1ÃÂ¦ÃÂ¿\0ÃÂÃÂÃÂ?ÃÂ>?ÃÂ¦ÃÂ\Z\nÃÂ©ÃÂ*\rAÃÂÃÂqÃÂÃÂ´ÃÂ¦ÃÂ¢ÃÂÃÂ²ÃÂÃÂ:ÃÂ³}5ÃÂ¬VÃÂ¢ÃÂI .BÃÂ¢ÃÂUÃÂ±qÃÂWÃÂÃÂ2 nÃÂÃÂÃÂ°  \r\Z4ÃÂªÃÂ§ÃÂÃÂhÃÂÃÂ Jn=ÃÂÃÂ½Ma\"ep@)ÃÂHlÃÂ¤xyÃÂ0ÃÂ£fÃÂ\ZÃÂ¿ÃÂ',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg'),(17,'ejjeje','eaeae',0,_binary 'Ã¿ÃÃ¿Ã \0JFIF\0\0`\0`\0\0Ã¿Ã¾\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÃ¿Ã\0C\0\n\n\n\r\rÃ¿Ã\0C		\r\rÃ¿Ã\0\0h\0h\0Ã¿Ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÃ¿Ã\0A\0\r\0\0\0\0\0!\"1AQ	aÂ2BqbrÂ$ÂÃ°%3CRcsÂÂÂÂ¡Â±ÃÃÃ¿Ã\0\0\0\0\0\0\0\0\0\0\0\0\0Ã¿Ã\00\0\0\0\0\0\0\0!1AQ\"aqÂÂÂ¡Ã°#2RÃ¡BÂ±ÃÃ¿Ã\0\0\0?\0ÃªÂ\0P\0PJ\0Â +@@@@@@AÂ¯Â~Ã·^6Âb4Ã´\r9wÂeÂ½Ã/mÂÃÂ%l:a\nqÃ)+Â Ã ÃºÃgNÃÃÂ§\ZÃQn)ÃvÂ½TÂÂ¡.VÂ­ÂÂ¥-iRBÂ)Â¼/%$k@Ã=eeÂ¦Ã{Â¢ÃÃaÃ°Ã°Ã²Â¶Ã®zÃÂ´ÃÂµÂ©ÃµÃÃ¯Ã ÂÃ¶Â:Ã´Ã&ÂÃmÂ¬Â¿Ã©8Â§	UÃ®ÃÂ´ÃÃ­Ã¹Ã2HÃ¢Â´Â¡ÃÃaÂ¯Ã©ÂÂÂ½Â»ZÃ±rÃ¿\0%Ã¸{Ã¾2bUÂ´Â¯EuN/{Â¾ÃÃ¶ÃÃÂ½ÃZÃ;ÂfÂ1x	Â)Ã¯ÂÂOÂ°iÃ®*?`kÃ1Â(#@VÂ(Â(Â(Â(4|i7Ã¶Ã¶Ã»i= ÃÂ¥lÃ,Ã0Ã¢3Ã/ÃpÂÂÃ¾Ã­Â¦ÂÃÂRÃ¶XÃÃ«%ÃI[mÃi33jqÃrI=\0ÃÂ¹ÃOZÃ¹ÂÃ:=Ã;Â©ÃÃÃ&Ã°ÂÃOÂ¯MGÂº/vÂ±Â¼]cihÃªb2ÂÃÃ+h)iÃ¦ÃOÂ©SÃ«ÃÃ°{gÂ­YÃ´]\ZÂ¹ÂrÃ~Â|Ã¼Â¹+Â¿sÂ6Ã¯Ã¿\0d&ÃÂÃÃM\rI6sRÃÂ·Â°ÃºJzÂÂ§CÃ´ÃÂ´ÃPZÃ\\~ÂÂiÂ¥Â¶{Â£TÂ­k:PÃ«lÃÃ­m-ÃÃBÂÃ´ÃÂµÂ¹ÃÂÂ?ÃÃ²Ã¹Â¨Â§Ã¾ÃÂÂÃ®Ã±Â­Â³2Â¶Â«Ã£S~ÂÂÂ¯Â´LÃ\0	TÃ#ÃªÂÃ·ÃªZpÂ­Ã¾ÂM@&ÃÃ¼KÂ¶rÂ-/UÂ«JNpÂÂÂºÂÂdÃ¿\0Â¶MÃ¹Ã¨	/eÂ¿[uÃ§ZnnpÂDÂoÂ¥Ã¦ÃÃº)$ÂÃ¼Ã¨Ãº\0Â \n\0Â (|ÂÃ§;Â¶Ã®Ã¢YÃÂªÂ·3P!ÃÃ¼cxveÃºcÃ¡ÂÃ´!Â¬Ã½Ã¨N6ÃÂ£Ã¬ÃÂ®Â¥iÂ`ÂÃ»/Â½DÂÂ¨ÂÂÃÃ±!)\n\nH\'ÃyÃ½EsÂ¯SÃ©ÃÂ¼ÂÂ¸ÃªcÂ¦-tÃ½ZÃÂ¼Ã¨zFÂ£uEUÂ£EÃ2{?8ÃÃ£Ã¨K=UÂ®Ã§ÃÃ.ÃÂ¸Â°Â©ÂÂJÂÂÂ\nÂÂ¡$Ã´ÃÂ¸ÃÂÂJWÃ½%ÂÂ²ÂÂÂjÃÃ´kÂ­6ÃUk4Ã±Ã[Ã ÂÂ¹Â¹ÃunÂÂÂ¦ÂÃ¬EÃp-.Ã Ã°QÃqÂÂ¤Ã§Â¡Ã´5Ãt?NÃÂµÂ¯ÃÂ¬Â¬mÃ¾ÂKÂ©\\TÂ·ÂÂ·SÂºOÂ>ÃÂ«RÃ¢Â¾Ã«r2Â6Ã§vBzÃ¸ÂÃ«]\'K[ÃÂz^Ã¶v|;R	Ã¶Â¬ÃºÂ´Â¤ÃRÃ ÃÂYHÂ®Â­Ã¢Â²ÂÃ¡>ufÂc/Ã®D>Â|Â¶Ã¶}ÃVk}lÃ³Ã\ZÂ¶[Â¢Â·laÂ8Â¤2Ã«Ã®ÂkQ@<TRÂ\'Â©;ÃÃÂ­ÃÂ§Â,Â¾gXjÃ\n\0Â \nÂ½\ZÃ±Â­Â°ÃMeÂ«ÂXBlÂ¶ÂSÃUÃªÂ¶ÃRÂ>Ãª	zÃÃªÃ¥=)Ã§^|Â©ÃÃY[ÂRÂºÂ©DÃ¤ÂÃ·&Â©ÃÂ¿\rÂ¶%ÃÂ¢ÃÂÂ¹Â¶Â°WÃCÂÃPoÃ Ã£ÃÃÃ½Ã«Âj.jÃ¶Â¤Ãf}ÃÃ¨ÃºÂªzvÃÂqÂMqÃ^sÃ·{ÂÃ¥ÂQÂªFÂÂ¸0ÂÂeÃTFÂ¢>|E%=xÃ¿\0,`Ã½+XÂ·Ãk_j4Ã©[ÃÃ¸ÃÂºÂ²Â¶_s[Ãµ}ÂÂ§c(ÃÃ~~Â¸\Z+Â¾ÂÂÃ¤ÃÂÂ¹Ã±Â9Â!Â`8!\0d|gÂ©Ã¿\0Ã}Â¥Ã©Ã&ÃÃ0ÂY/rxÃÃ¥/Â¡Ã±Â½BÂµ=FÂ£Â¥Ã½HÂ¬.9XÃ¥.WÃjwNÃÃn$ÃZKÂ/ÂÃÂ¸(Ã§Â¡Ã¶>Â¸ÃºÃ/ÂªÂ´Â»[JÂ®Â­ÂÃÃ¼ÂÃ¾&ÂuÃÂ¨Â¸ÂµÃÂ¶Ã«ÂÃ²Â»dmÃÂÂ§ÃQV=Â°Â¢QÂ¸Ã¸zYÃ§ÃÂÂ«QÃÃ¸NÃ§pÂzÂÃ­T7Ã.ÂÃ¬ÂqÃ,Ã¯Ã§ÃÂiÂª~Ã:EÂ.wÃ*Ã¹0)8W\'Ã°[Ã´h6?Â`6ÃmÂÃ^I5P@PB@M\nÂ¾\'ÂÂ·o=ÂÂµ^ÂÂ°ÃÂÂuÂ¸Â¿,Â¦Ã¢eÃÃ~Ã½+tÂÂÂ$ÂÃ§Ãh=o~3ÂJÃÂ­ÂÂÂ¤ÃªÂ£q{Ã®/6Ã¿\0VÃeÃ¦Ã¡Â®kmÃI\0wÃÃ°Â§=@ÃºÃµÂ¯Ã¾ÃÂHÂ¹Ã´Ã¥ÂÂÃ~Â¥Â»Â·Â«9ÃQÂ¦Â±Ã½ÃÂwKÃ§Â¿qÃ Â¶>Ã«ÂI~+Ã¥Â°Ã0Â ÂÂÃ«Ã¶Â¬Â¯GÃÂ/s]rÂ±Â¿ÂÃ¬ÂÃÃªRÃ²ÃÂ¬Â­%Â\ZÃ®Â±ÂÃ¾Ã«eÃ¹4Ã·ÃÂ=ÂZÂÃªÂÂ¯\n	_ÂÃÃ¿\0ÃÂµÃÃ¨WÂ\nÃ®Â¤ÃPÂÃÂÃcÃ¤9UJÃ¥ÃÂ­.Â©IcÃÃ²Ã»p4ÃºÂQÂ·9RÃ Â§@ZÃ²FÂÃ²Â­sWÃ:ÃªÃ¿\0MbOÂÃÂ·8ÃÂ¤*(=Â¹BYÂÃ¥ÃÂ¶ÂÂ(Ã¤ÂjÃÂÂ±Â³Ã®bÃÂÂÂOÂÃÃmÂ¤ÂÂ»ÃÃÂ£4{yWÃ­ÂÂ«1ÂÃ¢3ÃÂ\\ÂWÃÂ´Â¬Ã5IÃµÃÂ£\"ÂµÂÂ¡KÃÂÃ¥Ã¡ÂmÃ°ÂÂ¶Ãb$VÂÃfKM6ÂÂÂ$a }\0Â¨<Ã\"ÂÂ³.dxÂÂ%Ã¶Ã£Ãhr[Â®Â¬%	Ã¤ÂÂÂaÂ·#Â¶NÂÃ\"Tk\"\\ÃÃ³ÃH.*1Ã¡ÂIKpÃ¾_Ã¡ÃÂÃ\"ÃÃ¨Ã¶ÂÃÂºÃµ+Â2Ã°-Ã±JÂÂ}Â­]Ã~]\\Ã_I8Ã¥*\'Â ZÂÂ23zÂ\nÂºYfÃÃ}ÃÃ4Ã«.ÂÂ¨Ã¸RÂÃ¸V\nÂ¸(\'\0ÂK5=(Â*k=Â½Âh}ÃXÃ¹Â¸ÃÂ¥ÃÃ¿\0\Z0	ÃºÂ¤!ÂÂÃ¤jÂ07rÂ¬Â¥SÂÃIÃ³Ã°Ã´PÃ»zÃ-&\\ÂISyÂÂ\rz\"Ãa2Ã²Ã¨K\\^}@Ã³Ã¿\0Âµ]Â·Â«Ãº;yBÂs,Â¶Â¾Ã§\\ÃÃ½]NÂµÃ%tÃ½Â¸(Ã´ÃÃ§ÃÃ­ÃµÃ§Â¡ÂÂ®#Â³JÃ¹E(	\0ÂºÂÂÂÃ§ÂÃ¥ÂÃµÂ´Â½NÂ­ÃJÂ¬Â°Ã³Â?sÃÃµÂÂkg_ÃÂ´YÃ«]IÃ§Â·|vÃ¹Ã½ÃÂÂ®\0(cÂ¦=ÃªÃ¥ZÃDÂÂ¹ÃÃ©Ã¬ÃºÂÂÃÃTÃ}Ã2Â ÂÂ¤Ã»ÃÂ)Â¬Ã£Â¤Ã¶(Â¤ÃÂ;Â¥Ã¹:)Ã°ÂÃA}ÃÃIÂ­ÂkÂ--mÃ¢Â¹ÂÂTÂ¯<}RÃÃ¿\0RÂ°\"ÂÃ¬ÃÃ\ZÂxÃÃÂ/ÃÃ¿\0Â¬uÂªÃphÃ»BÃ®ÃÂ£ÃÂSÂ¬ÂºoÃ¶Âw\\Ã^XÂsÂÃ	Ã±ÃºÂÃº@B=gÂºÃºÂpÃ¤ÂuÃ¡Ã¹Ã(ÂÂ7Ã¼-ÂÃ½zÂÂ­\0ÂÂºrkÂJ$6y2Ã«]AÃ·IÃ¿\0ÂCÃÃÃ¢Ã¢ÃÂÂÂÂ©(cÂVR<ÃpÂµdÂ\\$Ã Ã£Â ÂªÃÂ¼ÂÂÃ¦4Â¸iiDÂ¨6QÃ^Ã$ÂÂ¯ÂÃO.iÃ:UÂvZÂ\nÂ!AÂ¶ÃÂ·ÃQÃoÂÂ08g)mÃX8$yPÂÃÃ½Â¥!\\P_	-Â­AjDÂÂ¨Â°ÂÂÂÃ¨ÂÂ?ÃPÃ%;Ã®ÂÂ-nÂµÃ³QÃ*Â²RSÂ)\'ÂªAÃºÂÂzÂ£\r&ÃÂ!Ã°iÃ¢Ã³)ÃªNxÃ½@Ã´Ã»TCÃ ÂZÃ¤ÃÂÃxÃÃ¶\\ÂÂÂÂº_OcVÃT.BÃ©Ã ÂdÂ}+ÃÂ¶Â©JÂµTÂ®~ÃÂÂ¥ÂÂ£Ã¤PDÂ±ÂµÃ2Ã¹ÃÂ¬Ã¸Â<Â°U^ÂÂ§m\ZTÂZK	~Ã¾Â´Ã¨Ã¶ÃÂ«V3Â¨Ã¶O?ÂÂÃ¸;oÃ°ÃÃÃÂ·]Â,Â,Ã·WMVÃ»ÂÃ©ÂÂ9ÂÂ°ÂÃ´\r!Ã»ÃÂµdÂ°Â°kW5ÃÃiÃÂÃ¼ÂdÂ±Â©1ÂoÂ°ÃÂ\\iÃÃÃ«N$Â¡hXÃTB>`Ã»PS};\ZÂ·pnUÃ§oÃ¸ÃÂ|nYJÂ[YÃµ,(Ã´AÃ½ÃÃ¡Ã¶)Â !mÃÃ6ÃqÂÃ£Ã¨SXYmÃ¦$ Â¡Ã(z(Â Ã¾Â´Â¹r~Â´	Â&ÃT5Â£ÂÃ³Ã0Ãªy2Ã§Â¿$Ã»Ã½FÂ¾jSÃ4NÂ¼ÃÃ©-ÃBV$ÂÂÂÃÂÂ¬ÂÂ¥ÃªÃÃ¯ÂÂÂ­iÃ¤Â§Â7pÂµÂ©ÃÃ!ÂµÂ¼ÂµÂ©	m=NxÂ¡]BTÂ|Ã}GÃÂªpkÃm\\4Â³1Ã´%Ã¨ÃÃ©RÂÂ:>Ã ÃÂ$GÂd}Ã@MÂÂEÂ¡bJ Â¥Â¤Â­MÂ¨Â§%`ÂÂ®~EÂ«\nÃ\ZÃ«ÃÂ¨OIR~FÃºÃ»Â¤Â¦ÃJÂÂÃ½Ã£xÃÃ¼Â¹\'Ã¿\0Ã=E`Ã$Â¿Âµ;gyÃÃÃÃÂºJÃt^n1Ã­ÃZHi.Â¸Â¥@yÃ½*Ã§Â¹>ÂÂÃ­Ã Â¿NÂ½JIÂ¨KM~y=!ÃlÂ±4Ã¥ÂÃiÂÃbÃ­ÃÂÃÃ²ChHJGÃVÃ}\0P\0ÃÃ¯\'gÃ½/Â¼ÃÃ¢ÂÂ\'vmcÃÂ£$ÂÃ³ÃWÂ¢ÃÂÃÂ¯Â±Â­ÃMÃ¡Ã}MÂ²Ã^ÃªÃ·Â¿muXÂtÂ	ÂÃ·Â|ÃÂ¯ÃW_lÂÂ´UqÂÃ  y\nzÃ¢Ã©ZTÂ}\rÂWHaÂ´ÃÂÂ=Â$!ÂÂ©D.0Ã²*HIGÃ½zÂµR~H6Ã²W\ZÃ¤$ÃÂ!sÃÂ¦ÃÃLJÂ¸Â¼ÂÂ$	Ã \0Ã¼)\0ÂÂ¾~u_$#S~}Â>ÂÃ¡ÃÃ!axÂ¤ÂAaÂ£ÃÂÃ uÃµÂ§ÂÃ¾FÃ§d;3Ã®7j;Ã#iÃ»{ÂÂ&ÂBf]Â¥Â«ÂhGÂºÂÂÂºÂ¯dÂ«Â¯Â Ã«VÂÃ+cÂ­Â½Â;+Ã¨ÃÃ\Z`[Ã´Ã¼a*Ã¬Ã³iLÃ«ÃÃ­ÂÃ¼ÂaÃ¹Â|#Ã®TzÃ<Â@@Ã®ÃnÃÂÂ©6ÃÂ¬&.Ã¹(Ã®ÃÂ%Â°Â´->Ã\ZvÂÃ¬)rÂ°Â¢]Ã¿\0nPÃµÃÃ2Â·lJ%rXÂ½Ã?Ã§SÃ»Â§Ã=9PVÃ°ÃÂ®Â¶ÃªÃÂQBÃÂ´ÂÂ¤ÂpAÃÂÃ¨hÃÂ¥Ã ÂÃ©6Ã«ÃÂºEÂ¹ÃÂ ÃaÃ©Â¼WÃ¼ÂºÃ¿\0Â´ÂpÂ\0Â9ÂÃ¥ÂÃÂ­Â8Ã»4Ã¼8.ÂÃ\\]_Â¼k~4cÂÃÂ¥dHpÂ£Â¿?Ã¨ÂÃ»ÂÃÃ¯ÃÂÃÃÂ=Â§mÂRÃÃgÂÃnÂÂÃ1bÂ¶m\0{Ã¾\r@64@@@@GnÃÂ½ÂÃ´Â¦Ã¼GÂtÂÃMÃ«$Â¦Ã¨ÃynIIÂÂÃ¸ÃÂ§1Ã¢Ã¤PIÃ¶0ÃHÃÂ¼tÂ¼Ã½Ã¤Â29ÂÂ«ÃÃÂ­	ÃÂÃ®Ã¸Â¤Â¥cÃ·0WÂÃÂ@t{g;5YÂ¶Ã¡qnÃ·yÃ]TÃDÃ¹Ã0Â¹cÂbÂ´IÃ®Ã²\0dÂU`ÂO*\0Â \n\0Â \n\0Â \n\0Â \n\0Â \nÂÂ +@@@Ã¿Ã',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\portatillnovo.jpg'),(19,'1','',0,NULL,0,0,NULL),(20,'12121','121',888,_binary 'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0\n\n\Z \"\"\ZÿÛ\0C\r\rÿÀ\0\0h\0h\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0A\0\0\0\0\0\0!1Q\"Aaq2¡	$B#3±²Â%RSTdr¢³ÁáñÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\01\0\0\0\0\0\0\0!1AQaq\"2¡±ð#Ñ3BSáÁÿÚ\0\0\0?\0ßê\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 +Þ®õÍÑËK¥æ,¹)ùÃqÒJØW§V~9ãµ	Q´ßqDZÿ\0hLæa2¬ºª\"ý}Sù¥Üþ p·xÝèôàõêå?ï6¡@4[üUôräpÏP,è?ñ*[÷¶ÛÖ]ÂL\rq¦¥v\r]XQü·æisqNèãÈO«.¥cô4V~¿û@@@©þÐ{`Ðf¤mÉyñ>Iq¿óG¡Û¬­ö÷QlÚÐÀJÔ¦AóÏ¼HP=lÕ\'ÒFñá/iÌõ$½Þ¶<x,Ç+\'rüÄ«¼1úüjeuG9N\nÙâÍÙiØÊB¶ùÈ%ã´´¥_ÔÝ$Îú¬#ó\'êðG#¡ÓïåõY\\mjgÆå4YRrx<÷ì/tO±¥Í¥XøìsV¶µ7Ku^ËA\rÖT¨#ÏÃ=ë\'fôE½áÒé~×=k{»¦*î¹z\ZgÉ	-6×w!\\ñÎIïÇzÅ¥v¬êàì*J´@@ãÈ/Þµ}éBÚDy	R»\rîÍCt¬´ ç%»9¯k¹\"$£yñíRRÉ\nÁ·Ê¡ãSÖÍ,Qx¥\r6$¸³m²ãûVuÌÒ³	­µ83O:3íÄ¸ÝÐÊä¡\n[#zÀÜSÂxÈãæ§K]É¦Os\'õÓÃ_;Ðvdw\"\\ßSÊ(,RBAUê~áÚ¾rEã6=>\nR]Ä?QõEÍ}<¿B.KÈ}èm\'Ï@9kZ°­ ÿ\0>çñ±eQTzù±B#É\ZÒÉOvß´:ÿ\0\nBû>Ç¢r?Ìÿ\0+Ï½JI¾h£ªÕ&@@@xLáØ²ØjDgPãO -Iî\nO}h\nOYøAé6³.¸­6D·L3)þAÏâÔ^ï6-ý­PêFJc]Y-+éæ·\n\"cXt¬\Z·xÑòîÛ2a¶&µ·Ôò >©*Tg,0èB¶j9óÉÓ×;Øyp>ZÀ\nAä`Ücè\n1\\3¹ õ0µ··]lò-M6ãÈãO<©b-@¹É?*Ï6gÛ7Jr>MêýöhÃ¨¢á¢Úµ÷êp~I5zÏÐè}\r((((©(B¢N0>´\ZwMõNÈ.w­/Èó·*:ß@/;ð©@\'zp­¹8g©u·}©\\¹I¶Ü\'Û¥Ü§]óÂf6V¡¡¼oJ¸î@JødðÖ¾JüËº..®4Û+m*J[a°Hâ*RïÀO=è\r \n\0 \n\0 \n\"ïªì6\0MÚõm·ÜËÛ_â\"[·u§@]îÍZ jË\\©Ï­¡·@¡îþ´2\\uUÎ¥¦}âU£º^¨~æ¯µ÷Vtú?PB|isdÀË\nmJ	ÂvÜÐNuGéËd¨}×´!¶\r¶Â\\Û@YHX}Ò*bLÿ\0ñT-ÚVá#ÑO¼ÇèAc.ñ`ÔËbõLØ/2-Ç)ñåÉù6³{6F3Ae¿BBÀ»ß-~¶]®1-ñ7yÒÞKHÜ{\rÊ g¥¼ø¨éÅÙ,¹róÒ¢ Ôec)I^2qÝ ¥´W÷ïzn3²ZµÅCfJ#m¥!y_ÜR@?ó1È\ng_ø¬WQWjS¶rlðö·íf8ÇÚÜ¦ö)M Â±9ÁWlqù¤½Î¼<\\X¥.º\'·yqêöÃ2åLôSNG\rëvuÌX|+Atã;~\'¹=ªqdfãmrýyå\\É¶®õ¯ÓqXê^¬kë¬_´­Ñ­é%-Á}æ£Åj<w6´e_w±ìô#ÁIÛr7ö<ÜeÓ¯MEü_~¹^nªÔÖÖ#IdG&mÜ!ä8	J\\)O¾R®Üw­WéåZ«Tç©Ín+>­M¨ÜrÔP.·qÛä8fCÄ¸âTó¥i	\'b\\ÆNw(qÞ°Ë`¥m¾ºW±rdsåiyõK5\n<¶%qÞwÉB	ó9Ây ç Æ>µÈj¹­Çz±wmDIÛ)uââQ·i=Æ~<c=Úúîÿ\0¥-VHåWk¿¨`¬pâI=\n³è3F¨¬d¤Ú]¤ÄKÉÈ¤©ðÅXäsPj{P\Zeã]ÆlXôsö_´ã)&èêÐû(R7aµ({ªHQ9ÇjÅ\'ª£Rf^Ñ2í2lÝ,ÜÉ%)×W)8/ì).uIHîHìÅáO«÷9ð`X´RoÌùcZ]ã1Z-q£°ãoùQØÚJüÂÒÈ¬%	\'8	$wÍWúLOu~¬ïyÃåtuY{B#~ìúJÙ[Âw*XJNB>¦¯tQFËÏþÇùùêCNÕ*BÝ¾GÜÜ¦¤ù>Ðµ·F<¾WýåSÍk[Ë,åóI¾VÄ«õÅé·XsaÀ¶Èp{3 ¼¬6Ñ\'qä)A\\ú|ëÕà#>Ë+»¥]]³ÚNÂyæÚ.wr©)CiB§\0}Ï¥`¸<ê¯îõ2ÔV¬mtÄ´h9ÒfÍº¡ËÍÕç[|îºí£%)O+\'·Ò¶â1¼<4 ÷vß¿ðäÇ5mlçÜEÅµ\rØr\rÅÅ3n\r3jG9(·{Éõä×*Ã²öÓ3IN.ãù:íùæJXíV»©U¯÷ îXö¨9À	ç$ùãçTzbJ·eã®fïd»³b<:Zâ#K°Û[cÚ¢(Â|¸¤}r¡Qt¼NU\'âÎdv.8[PJ	$ü\0 9G×ÍdÏQºy¾7ìoÂyETÙq©-¶JDsÜPÌ¦ÊÑ¶c.K_ÔZW¹Äp©«Ú¬¾¿ì;ü{ªªLQÓQÃM(G³90¬y.eåcÿ\0Òó§¡¬|ëÐú\r£bho-ÊGñÂ²§1è>êGãQO¸Þ2ZÍûÒjÑ»+WjlICE-¸?²	Oùä×-ôò\"sNþ6ÿ\0<ËS§ñnÌëî*MÆkL©,3´:Û@½¸+Ð+Êãçôó®ÏÇï+õîF3Uâ0Z/±o		&Z#Â@Röµ¬$\'¾A%iãë\\ñáòKâ/Dëég,²EMc{Õ·\\f*(TxòRÛ%3+~]u[Õe^\'áÍs¦JLºM_*ÔFm»ôºF2íð [KgÝ ®U·?ñÍ®\'¯¿Rµ;ºût=ôÍ¦t{SáOÚ¯n§bd-eÂ=Ó»ê¦j)E.í}YHJw´´zz.¦Ùøg»G·u½ÉlÜ/3àYRIáa¢ÊNr¤2ø¶Aô5\\Ëãc³ÞoOzÈë µ­F¢Ò7»TIÏÀ6#·)î[JRH3ôÈúô-n2Yq¶¦Â[ª!EÈÞYËÜ²qxÚ=V¼X©¹üQUßzý¿ôøwDÜÆOl#çÇ÷¢¢¼\râ¨¸è{³ÑËhlJFHq)÷B#;~ \Zð4kiNèK¼§8Z´0©RZ@Q*m´ç¤ÈïüqU¤ÿ\0ÄéÇ\"Iöµ^,ô:6àÝÎl¥Á³8ËÈJgwº3éùÈVÑ´©:3ÈæÕ9§êNÜMîÓv«\"cÇ\rl©1K>[®=pv6ß8 gó]feiÃD_ÏÔÆnØºÌ]AÛómíÃUÅæF3í$7´çy\\yÈô¨ÅRcü7®ßç$ÚÜ×âÝõ_a½11×äGRo	\nNH8*\nVqüUåûãÑ^cý´²oZ­éÇÐÕã~wØÜ)1À´ ýâ@çéDòv|µ§Fñv¼îZ¥Þë¸Ã¥\"Ì·L9¶ÙQmhqïÝTÐ³08Íe,×qNÓpËW¿]záIÞïú¦Ï¨]ÓÍ\"ËhzSé½¨ÖòiHòû`­Á_ÁïûØ¬¤í¶uâ,WC}*¡@)\\:]£n¸ì­3k[®(©kÒ(IæÐÊý\0«2G÷*E:¢\ZN¦RZ²1/ÚÉûÁHïÎÑô©±H÷Ñ}3>nµóþ£[?Ãi¾ºs-µ¥6J±)ÔüÇ¼GéSbFÜüêt¼÷Ù÷ûKì/Úãk)ÏÂT3#VáO¨Ìå1io*n3üÉr±nááÏ©ðòU¥xYsüõ:\nb´îkø!Eí}\0wR!)cóH4ÐQ!Ój®¡j­[\'Z ·Ì6*ÛK\rçàåÁ#ãÉÀ¦èD÷GHàÂbÝCQØB[m´$%)H\0Àü*¥PX((((0( P\0PÿÙ',532.8,1,'D:\\DATOS\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\teclado-gamer-esca-gxt-853.jpg'),(21,'1','1',0,_binary 'ÿØÿà\0JFIF\0\0`\0`\0\0ÿþ\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿÛ\0C\0ÿÛ\0CÿÀ\0\0h\0h\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0=\0\0\0\0\0\0\0!1	Q\n\"Aaq2¡±ÁÑðá#RrB¢£ñÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0 \0\0\0\0\0\0\0\0\0\0\0\01Q!qÁðñÿÚ\0\0\0?\0)&Èrúü¿MKêåø}ö×£ùüúêQä>ì.ïøü9êíîú:(w(d@m@SHéÿ\0Ä?}U0ä:ä3òü:òåÏ]I¦Þïïòx¹:IÝ#þÐÿ\0´?}C¹K?p¸ÿ\0góýÅMU)J ÄÇóë¦Þïµ2u<7r¸÷õ(y{ÿ\0º°ªÚö×ÑØ´®k{,ãZÕu<<âIª$¥.ý¦ÝUMc\"\ngT6Áp)Jaà>ðô/\"ÂPö\0\0zæÃ¿Íÿ\0^½ÄïfûWÆ÷ÜºB®ä({`Ú®jhH&6îÞ¨zFkáäbfª´=Fõtâ$ºsXâÞAB·@ËmæÛõ2N$gFZªÝÔQ§ªº>w#PÂJ³pú÷YÈpãåÏêè<S[s×	çc¦0=@|C\\À£«ÎÕ7	#º½¬\\WáÅGÆ*éuÈR%¸7K<19õ§P«Ôö¥ï.¯Û5\ZÖ}yG1D«DÂ3E²ì¦Uõz!W*£EªtLg åQé4¬\"q0¦\0oxPñêÆ­¤­-\nÊ®y¯\nñÀÏ sÇN´ÞïF»p{¨Üu Ýc~.Mot-´Eú§l¤Íw(¼ìBãM8¨n1,ôªH+õHxÞ¼mº¯³P* .\\Õ¿¹-¶N6ÛÎ|î~RI7$óm¼¶Ê-º©!Y9S\0$êQ)ËÔ¾ã3Ðyû´k ^@Í¼©Æ1À¦>LèÔVQ\0©#ÓÏè=1sþ51úÏôRÐM!\0\0õø\0túøê<âí Gåúªè)p~?¶ª\0`\0Ý¨èÐ&wkÞçÇiÝ÷öâEÈ>·©i¿í%³?x¢n¯n©JF¾bdÄ¦TÜK¹ÊÃ >Â4êªpuËêáT\nÒí8íUyq¨8¶¨åCÁR3QU=CÏ¦«¤é¡ÒpCéÚvé	P]»´Ø9ú*ÖSïuÄhÑuMÞÖ5Êo)Ê1ã|÷bö©¥L\n\'ëVJäEBa6_·÷æO~.uä(Mv}î:ºp¨\"Ç¯~*iYS´Ù õ©Ù«<Û)èÓ»H@-×Uëæ4Ñ¤£®Ø6ZE¦\\ íg/KÔeJàJb¢àÍÁº@B3ûFâó×	O± §¦*ªæX¥TÆ:\\ÌÎÌzKÜÔYá¤Èªw$IAâPùZ«Ï9DADNð\ZªE?ÝEû8þà:Ë&¡@Dy5ÈôÎ³m¡»}òmoï}¡JÔ·¶ë pWþÕZÀþ¦tÉêS6óñôË84BTZà\"@ÊSü»!¶¶;=ìòÛU¢MlæBäÜà*\'EÉ®MÖ\\õåVÕð(¸^iµ*°\0V\r¦¥*ãü?}SÆzqdGaÈóÀgð\0\0\0Z]á[ú<cþ³||>½:hÕ+¼`-¿¨óïqÏÜé9@ñZ4Dýçú©j©úyþ¨ !Ì?çüéå >ðüó\rUÔ\0 À?Ôt¼2rbcJI»AtsG/¤9T¨7dÅ*9xíu DjÙ%WUC¦cà^í#ovì[í7³^öË6j®ò$ÆÀÒOP\ná®Q\\³¬¦Y4à­ËJµï®\nV¯ET*\"C÷¹÷9»=Æîª`ë=¨«zÎäÂ´v º·t\ZhDZtÂ~@¨xÈ@¬«åC9Ù]µG¶oÑ¤ßÝñ«\Zn.ôöå»+Õ*ýÁT+õè8«WZÒvÍ5Àå\nm£ê:í¡² t«T¼3T-Í¼{¹Ñ·öÓH3«wAyíõ¦T]%Æ&%ÔìJR²ÎHVl>m4ªHB»\\2Ý1>ºjïªµ{pìÜÕ²lÓVªÛì»³t»P*g*ÈZµ­}H	GRoBÅ YëàÉ9Z¶>Ej*0Rõ9c\"ËP9jª@«ëËôlpQè³Z\nf¬¹ûÏÝ9%RéÐ[t·Í\"ðôÃæI×5²åDòð¶ú0»Ñ,D*$#´ä§¡j)ã-/MDp\nROU(8gÜ\0\0dì`Õ/Ò\0\0§/(ôIQU½ÞJkå\\/íuÈ`Áº¶=US\nf8@qÂ%å¹Ô>_¨êMLn¾_O~:ó K ±®!HjeéT)NC\0ÈrrR¦)!È@À !È@CF©\\µÞ\\â D1Ì \"\0ò\0\0ü´h2úyþ <þÎ¾zÓÏëÈu}ß?®m\Z4h5ût[µA²5þ¼²R1ÔAd	öÍC)#PNGSPô)\\6R^fZbQ£V¬ÓY \nîÜ,F®Mþ/iMí	°VÅÎNTê¬ª9Èiº*jJ½~Õfâz£I9è(8¸Ûpwºòi¶YS5Tä~vèö¿e÷d«;)+wZµnWmAu#æaf#\\õ?UÒðö«)DÑfnñ³´»§	:`áã7ë·Ø3Úy·+p\"lå¸²ðäí}JÊÑÕ,QGÔdÕ¼iQ¦©¢áhÙ¨D)¯Qu,Ág°ªýõªBÓÑÛ½Þü®à«f4º¤¶ËD¹Jûn]HÙíxZÍÒôshÖÓÎxªËws§Ër*) zbpôwKhl/gUE\\z=Ê\rÐL#f)Ù#C¿ZN´¨Æ5ûÆ,%Õ¶)Ø!Ê±Hõ\Z´ù\\è®ÖèÃ.ÚG¢íõ¦oSºþéÃNÜjZ®cj©zUY¦¥a\"aëÐ¦Ò¥jµ^S ÐÒ,á×<fL¯uu%iihï¹¥Ó¶µ¶ÏªªâÞXjiÌe»¦ÛÛI[QÃ2¨(«Û_SOê§4å*áGpµ4LÛiHÊMG}«æ.L«h·t=?gÒ§rÊpâ=Fn×i+ Ê,£A+	\n¦\nÊ;jCTÉ÷jÖÊºz6mmjv&½ÿ\0N®w4¾ñky;²­,¼3hô-ú|¥CkXB6Mû¥j1mLP/$³8·V@#±Q6¸ã¬âM.Y[Í¶iZ~tÊmÜÁÁBÄ7MÜcíN5d\nbÙè¤C,S1ïÞ]Ø¹UÖ7m*úÖz¦¢¬mß¦iS2»WHQ4íEF)XÎCD¹M²nÔdþ¨1^º{Ý.èähfí\nrªM×È<_¾|ùçRêcõëçO.¿<ê]3»Ã¡ä!ästHÞÿ\0wÏF§»EÐsà8ÀÆX¥(¦9$¶p\0÷ÚðÎN?O?Ðu}ß?¦ ~^C¨îùýthÔ¼e÷p8dp?|s\0æ8\rjÕéÞæÒöðÍÃËÉ¸+[BRª+°«#\\ÌRìXÅIâ!ÂPQ²aÅÔ@\0GA´ú¤ry´`ÀO,0ÆE¸OJ7avÄGÚ~æÛdÑV$\r4wÈßlÉÄQÔâ\0;rÞø«òÈÆØKwl,tJÀt3Æ¦EÈaªFË`Æ:RâB\0AÐîbn3ÒÑ±É}.ý¤c\0äDUtùfè1åOÇ!I]æLvIn*¹ÔÖç&¬;ØÚ¶¦ç¯;ª*ÝCL°E²±LR7²B¨©#ÝÄ»m6ðñÚ$Ô«ëEMº~ÖüÔê³-y¸-Æ>Xé«H[vB¬Z.z\r¢$fÜDxD%¦Ã{¾16Ç/ÙñÛÆÞÔ(ÔÖï;¸±ó-*mSB¹¨dÙO,²Ò	IS°õltìâ4{Ô]ÂØñÀ WüÕPÕô}#UHÛJ¶¨eJN£ ù¤­2Î~E´ò®á[;MÌÌ\"dÜ{!Ü2Ý&òDP³6{r%æAMÅÐÉ »GGvÈ¡jªlÔÉ,a÷gL!Â²Å1L,z¸6rííÂj>¼ÖëØêÝØºx:ÂN|ù\"B£ìÔMeAÁÈ*»TLâ¡SLGD7kû½»n¦ê[3½[¢´e[\"ÎBj\"¨%*J®aUI\naÃ¸Øõ;è¦+©MÑWApë\"<0?¨õëùóÎ¡®xÏ·wµRÔ0§ZÜ«ïg^3M-õ¢©ªº¶ªHHPï©ë\\ZNb%eS¬¢e¢ªd\nR»[²C´ú3´ÆÒÜJÅ4eyfêø2¹Â;J¨TPF©!\'©OTñ-V`U?¨Ã.ÛFlÝ&ª@§5â2.)id¢*oÕP@æPR\08xC|dqÌJb¼F¾¼ù$S³:W¸l	®·KÝ¤\0<gâ7²!Ï\"×´h0öç÷#n¶ejËåtU-)J-O°3H±<¬åYQFRtÌ+É½l¬¬üËn¢òRÚ°jºÄCûÇÚqÚ_°UÎÒ,ÙW§48¥&ÞøE^\nñ¦ ÷*¢Ê!¼=G)ë60Í´: õT°èëA¼\r´[}Ýíþ»°^!äÅY¥²ä{\r-/NÌ±¨iÉÈ©6\"Í¤!&£H7vµ~ÑÓ5@ík¯=yhîdìÿ\0®©uPê²,ËR*¤%008%)i<xG½ï8µÌt	¼;»ÛotM,Ýº\\W:ÔÍ\'G¯JÒ §ÅjÜÌ\"¢\0LV(Â×1Ò%À^úú»oOTÕE¼§%$U0­VÞ­+Ðâ¡J\'®£(ÙsÂb 2Ê¨ §	C\ZtkíöÏmèÎÿ\0¹¸ìø»¨©\n®YÊ+&@ÉRûáDTQ@\02Ê\" \06Kj½Çv[¤c¹]Ñ·\r¸¯dÝYß^ àênØ:hQq^FàûÀ!vèå3¿da5r·ÛeæâÎTÜ¼§¶ëSRuâ ª%E0mâã]*-R¦\0\'\0éIÃh~gKÙr-M×¹Eï©ªwû®ÂA°óHhjH²t#³*Q\0BJ&,# \ZLúwtÝwvb\nâvsCÓU±`zôáéX¤Ã×ÊÙÊ%dz~\"y¬ÖPP°>!8é-­æÞ/åØGmÛ@Jj B¨ªáH2F8²	F	:°´Ý2)!VÄ+¢%1ßÉJbªÐ9\Z»ô¬íµÙã°Z³fÅ?Vª®Y\"­MºfT7E¢(D9;Bà¦àsPÄ»ä~ôGÍÉvÀön)(k³¼I=Rqg¶9$-TÏt¥]Lp¿°\"Áõm¹°\rl] ô÷Á|ÁÛtXQpN15;êÈ¤le£¢¥	ryª[Mºz0ÛZ£	\Zúë«=pHRYÊ\\²±PC1¥iòA@$ <$BH¥Ï·Þc1ú$\rKR.ÖÙYúÒò×ÒnEW3º©$¨qw!M\ZjeÒÇPÂc)=Q¹1»Ñ(qiTldj.èÅD) ²4Kó&SX©Ò-Qj¨L­-A¦îiÀ¦êJ8ÆK¹VOc[UÛÔ[H]fhª}i(8ÿ\0hÄw¦jÝ«xðPqÅÇêp|B<ÇlPA¨»dRne¦	HPÆ\nD)(\0R¥»kôV,\r$|öé¯5utäÄRZB£D¶þUq\0:/»ªúg 9©*DÅÓ6Ëµ¾íÛ·µ[pµtÍ©¡Ó|´«¨ºv5&ÍL®MÜOT2*\n²ÕÓ·n¤¬Û×ïÁ²µ\"ÄjHaù{ÀAóþQüºã3ÏùÓAn¶È=I|3à0c ËÄCAº5® 4èàWk¦@×å¼ôh21Ô dÀ`<<tÆ<3îë¯9ÐsÄTùûÍüÃ®\Z¼lBà\"³væÏ!)DË§ÿ\0:jÙ{BÑõö\n	\'IðÀ¿w=\Z4ºkkVJ¢wö¥JI»éënb8uYQ+Ãà;Ìg8çWD¶tÀ¦xúbt\0TÄ\Z£¡àa(\0`\nRC\0-\Z4-±!#JntA0äb&\0÷Ü\08Ç-xV¬ ÈÐ<ñ\0Îz|<4hÐ|®Üpâ]\raa~#ÇÇ:¢[³AîÔ1æÿ\0?>?¦\Z\néÝ*\rAÀÔqÉôæ¢ÀòÈ:ó}5ìVâÑI .B¢UñqW2 n°  \r\Z4ªçÝÊhÉ Jn=ÉýMa\"ep@)ÄHläxy0ãf\ZÿÙ',0,1,'D:\\DATOS\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg'),(22,'BEMBOTA','1',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\0h\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0=\0\0\0\0\0\0\0!1	Q�\n\"Aaq�2���\��\�#RrB�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\0\0\01Q�!q�����\�\0\0\0?\0��)�&ȏ�r���MK\�\��}�ף���\�Q\�>\�.�\���9\�\�\���:�(w(d@��m@SH\��\0\�?}U0\�:\�3��:�\�ϗ�]I�\�\�\��x�:I\�#�\��\0�?}C�K?p��\0�g��\�MU)J �\�\��\�\�\�2u<�7r�����(y{�\0����\��\�\�ش�k��{,��\�Z\�u<<\�I�$���.����\�U�Mc\"\ngT�6���p)Ja\�>��/��\"\�P���\0\0z\�ÿ\��\0^�\�\�f�W�\��ܺB���\�({`ڕ�jhH&6\�ިzF��k\�\�bf���=F�t\�$�sX\�\�AB�@\�m\�\��2N$�gFZ�\�ԀQ���>w�#P\�J��p���Y\�p\�\�ϐ\�\�<S��[s\�	\�c�0=@|C\\���\�՘7	#���\\W\��\�G\�*\�u\�R%�7K<1�9�����P��\���\�.�ە5\Z\�}yG1D�D\�3E�즖�U�z!W*�E�tL�g \�Q�\�4�\"��q0��\0ox�P�\�ƭ��-\n�ʮ�y�\n��\� s\�N��\�\�F�p{�\�u�ݕc~.Mot-�E���l�\�w(�\�B\�M8�n1,��H�+��Hx�޼m����P�*�.\\տ�-�N6ۛ\�|\�~RI7$��m��ʎ-���!Y��9S\0�$\�Q)\�Ծ\�3\�y��k ^@ͼ��\�1��>�L\�\�VQ\0����#\�\�\�=1��s�51�\��R\�M�!\0\0��\0t��\�<\��\���G\����\�)p�~?��\0`\0ݨ\�\�&wk\�\�\�iݟ��\�E\�>��i�\�%�?x�n�n��JF�bdĦT\�K�\�\� >\�4\�p�u\�\�\�T\nҔ\�8\�Uyq�8���\�C�R3QU=C�\����醋���ҘpC\�\��v\�	P]��\�9�*\�S\�u\�h\�uM\�\�5\�o)\�1\�|�b������L\n\'\�VJ\�EBa6_���\�O~�.u�\�(M�v}\�:�p�\"ǯ~*�iYS�\�������٫�<ۋ)\�Ӕ�H@-\�U\�\�4Ѥ���؈6ZE���\\�\�g/K\�eJ\�Jb�\�\���@B�3�F\��\�	O����*�懆X�T\�:�\\\�\�\�zK�\�\�Y\���Ȉ�w$IA\�P�Z��\�9DAD�N�\Z�E?�ݚE�8��\�:\�&�@Dy5\��Δ��m��}�mo\�}�J\���\� pW�\�Z���t\�\�S6���\�84�B�TZ\�\"@\�S��!��;=\��\�U���M�l\�B\�\�\�*\'EɮM\�\\�\�V\��(��^i�*��\0V�\r���*\��?}S\�z�qdGa\���g�\0\0\0Z��]\�[��<c���||>�:h\�+�`-���\�q\�\�\�9@�Z4D�\���j��y����!\�?\��\�堁>����\rU\�\0��?\�t�2rbc�JI�A�tsG/�9T�7dŚ*9x\�u� D�j\�%WUC��c\�^\�#ov\�[\�7�^�\�6�j��$\��\�OP\nᑮQ\\����Y4\�\�J�\�\nV�E�T*�\"C������9�=\�\�`\�=���z\�\�´v����t\ZhDZ�t\�~@��x�ȁ@���\�C��9\�]�G�oѤ\�\��\Zn.��\�+\�*��T+�\�8�WZ\�v\�5�\�\nm�\�:\��� t��T��3T-ͼ{�ѷ�\�H3��wAy\����T�]%\�&%\�\�JR�\�H��Vl>�m4��H�B�\\2\�1>�j流�{p\�\�ղl\�V�\�얻�t�P*g*\�Z��}�H	�GRoBŠ�Y\�\�Ɍ9Z�>Ej*��0�R�9c\"�\�P�9j���@��\�\���lp��Q\�Z\nf���\�\�9�%�R\�\�[t�\�\"���\�\�I\�5��\�D���0���\�,D�*$#���䧡j)\�-/M�Dp\nROU(8�g\�\0\0d\�`\�/\�\0\0���/(�IQU��\�Jk\�\\/\�u\�`�����=US\nf8�@q\�%\��\�>_�\�MLn�_O~:��K���!Hje\�T)NC\0\�r��r�R��)�!\�@� !\�@CF�\\��ޒ�\\\� D�1\� \"\0�\0�\0��h2�y����<��ξz\�\�\�\�u}\�?��m\Z4h5�t[���A�5����R1\��Ad	�\�C)#PNGS�P��)\\6R^fZbQ�V�\�Y \n\�\�,�F�M���/iM�\�	��V�\�\�NT�ꈄ���9\�i�*jJ��~\�f\�z�I9�\�(8���\�pw��i�YS5T\�~v\���e��d�;)+wZ�nWmAu#\�af#\\�?Uғ�����)�Dє��fn񳴻�	:`\�\�7뷁\�3\�y�+�p\"l勸���\�\�}J\�\�\�,�QG�\�d�ռiQ������\�h٨D)�Qu,�g������B\�ѓۍ��\���\�f4����\�D�J��n]H�ٛ\�xZ\�\��sh\�\�\�x�\�ws�\�r*�) �zbp��wKhl/g�UE\\z=�\�\r\�L#f)\�#C�ZN��\�5�\�,%ն)؊�!ʱH�\Z���\\聛�\�\�\�.\�G���\���oS��\�\�N\�jZ��cj�zU�Y����a\"a\�Ц\���j�^S��\�\�,\�\�<�fL��uu%iih��﹥Ӷ��Ϫ�\�\�Xji\�e��\�\�I[�Q\�2�(�\�_SO\�4\�*\�Gp�4L\�iH\�M�G}�\�.L��h���t=?gҧ�r�ʙp\�=Fn\�i+ \��,�A��+�	�\n�\n\�;jCT\��j\�ʆ�z6mmjv&��\0N�w4��ky;��,�3h�-�|�CkXB6�M��j1�mLP/$�8��V@#��Q6��㟬\�M.Y[Ͷ�i��Z~��t�\�m\����B\�7M\�c\�N5�d\nb\�\�C,�S1�\�ފ]عU�\�7m*�\�z���mߦiS2�WHQ4\�EF)X\�CD�M�n\�d�����1^�{\�.\�\�hf\�\n�r�M\�\�<_�|�\�R\�c�\�\�O.��<\�]3�Ê�\�!\�s�tH\��\0w\�F��E\�s\�8��\��X�(�9$��p\0�\��΍N?O?\�u}\�?��~�^C��\���thԼe�p8dp?�|s�\0\�8\rj\�\�\�\�\���\�\�\�ɸ+[B�R�+���#\\̐R\�XşI�\�!\�PQ�a\�\�@\0GA���r�y����`����O,0ƛE�OJ7av\�G\���~\�ەd\�V��$\r4w\�\�l\�\�Q��\�\��\0�;rޕ����\�\�\�Kwl,tJ�t���3�ƦE\�a��Fˀ`\�:R\�B��\0�A\�\�bn��3\�ѐ�\�}.��c\0\�DUt�f\�1�\�O\�!I]\�LvIn*��\�\�\�&�;\�ڶ���\�;�*\�CL�E��LR7�B�������#\�Ļm6��\�$\��\�EM�~\��\�\�-y�-\�>�X\�H[v��B��Z.z\r�$f\�DxD%��Å{�16\�/\��ێ\�\�\�(\�\�\�;����-*�m�SB��d\�O,�\�	IS��lt��\�\�4{\�]�\�\������W��\�P\��}#UHۈJ��eJN� ���2\�~E��\�[;�M\�\�\"dܘ{�!\�2��\�&�DP�6{r%\�AM\�\�\� �GGv�ȡj����l\�\�,a��gL!²\�1L,z�6r\�\�\�j>��\�\�\�\�\�غx�:\�N�|��\"�B�\�\�Me�A�\�*�TL\�SLG�D7k����n�\�[3�[��e[\"\�Bj\"��%*J�a��UI��\naø\����;\�+���M\�WA�p\�\"<�0?��\���Ρ�xϷw�R\�0�Zܫ\�g^3�M�-�������H�HP\�\�\\ZNb%eS�����e��d\nR�[�C��3�\�\�\�J�\�4eyf\���2�\�;J���TPF�!\'��OT�-V`U�?��Ö.ەF��l\�&�@�5\�2.)id��*o�\�P@\�PR\08�xC�|dq\�Jb��F����$S�:W�l	���Kݤ\0<g\�7�!\�\"\��h0�\��#n��ej\�\�tU�-)J-O�3H��<��\�YQFRt\�+ɽ��l���\��������n��R�ڰj�\�C�\�\�q\�_�U\�\�,�\�W��48�&\��E^\n� �*�\�!�=G)�\�60ʹ:� �T�\�\�A�\r�[}\�\�����^!\�\�Y��䌔{\r-/Ṉ�i\�ȩ6\"ͤ!&��H7�v��~\�\�5�@\�k�=yh\�d\��\0��u�P\�,\�R*�%0�08%)i<�xG�\�8�\�t	��;�\�otM,�ݺ����\\W:\�\�\'G�J\� ���\�j\�\�\"�\0LV(\�\�1\�%��^���oOT\�E��%$U0�Vޛ��+\�\�J\'����(\�s�\�b �2ʨ �	C\Ztk\��\�m\�\��\0��\�����\n�Y\�+&@\�R�\�DTQ@\0�2\��\" \06K�j�\�v�[�c�]�ѷ�\r���d\�Y\�^� \�\�n\�:�hQ��q^F\���!�v�\�\�3�da5r�\�e\�\�\�Tܼ��\�SRu�\����%E0�m��\�\�]*-R�\0\'\0\�I\�h~��g�K\�r-M׹E\����w���\�A��HhjH�t#�*Q\0BJ&,��#��\ZL�wtݞwvb\n\�vsC\�U�`z���\�\�X�\�\�\�\�\�%dz~\"y����\�PP��>!8�\�-�\�\�/\�؞�Gm\�@�Jj��B��\�H2F8��	F	:��\�2)!V\�+�%1߁\�Jb�\�9\Z��\��\�\�Z��f\�?V���Y\"�M�fT��7E�(D9;B\�\�sPğ�\�~�G\�\�v���n)(k����I=Rqg���9$-T\�t�]L�p��\"���m����\rl]����|���\�tXQpN15;�\�Ȥle��������	r�y��[M�z0\�Z�	\Z�\�=pHRY\�\\���PC1�i�A@$ <$�BH�Ϸ\�c�1��$\rKR.\�\�Y�\��\�\�nEW3�����$��qw!M\Zje\�\�P\�c)=Q��1�\�(qiTldj.\�œD) �4K�&SX�\�-Qj��L�-A�\�i��\�J�8\�K���VOc[U\�\�[H�]fh�}i���(8�\0h\�w�jݫx�Pq\�\�\�p|B<\�lPA���dRn�e��	�HP\�\nD�)(\0R����k�V,\r$�|�\�5ut\�\�RZB��D���Uq\0:��/����g 9���*D\�Ӕ6˵��\�۷�[p�tͩ�\�|����v5&�\�L��M\�OT2*\n�\�ӄ�n��\�\�\����\"\�j�H�a�{��A��Q��\�3�\��\�A�n���Ȏ=I|�3�\�0c \�\�C�A�5� 4\�\�Wk�@�\�厼�h21\� d���`<�<t\�<3\�\�9�\�s\�T��́�î�\Z��lB\�\"�v\�\�!)D�˧�\0:j\�{Bђ���\n	�\'I����w=\Z4�kkVJ�w���JI�\�\�nb8u�YQ+Ü\�;\�g8\�WD��t��x�b�t\0T\�\Z�����\�a(\0`\nRC�\0-\Z4-�!#Jn�tA0\�b&�\0�\�\08Ǘ-xV���ș\�<���\0\�z|<4h\�|���\�p\�]\r�aa~#�\�\�:�[�A\�\�1\��\0���?�>?��\Z\n\�\�*\rA�\�q\��\���\��:�}5\�V\�\�I .B��U�q�W��2 n���  \r\Z4�\�\�\�hɠJn=\��Ma\"ep@)\�Hl\�xy�0\�f�\Z�\�',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_factura`
--

DROP TABLE IF EXISTS `producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_factura` (
  `idproducto_factura` int NOT NULL AUTO_INCREMENT,
  `idproducto` int NOT NULL,
  `idfactura` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` float NOT NULL,
  `totalventas` float unsigned NOT NULL,
  PRIMARY KEY (`idproducto_factura`),
  KEY `idproducto_idx` (`idproducto`),
  KEY `idfactura_idx` (`idfactura`),
  CONSTRAINT `idfactura` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idproducto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `idsexo` int NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `tipodepersona` varchar(45) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idproveedor_sexo_idx` (`idsexo`),
  CONSTRAINT `idproveedor_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,2,'Cedula','camilo','123','5345435','ddsfdff','Juridica','2000-02-02',1),(2,1,'1','bembitarayito','1','1','1','1','1000-10-12',1),(3,2,'2','TESTING','2','2','2','2','0500-10-10',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `idsexo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idsexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1),(2,'Femenino',1),(3,'Otros',1);
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `idsexo` int NOT NULL,
  `idcargo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `login` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idusario_sexo_idx` (`idsexo`),
  KEY `idusuario_cargo_idx` (`idcargo`),
  CONSTRAINT `idusuario_cargo` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'1','1','1','1',1,'1','1','2005-12-12','1'),(2,1,3,'Geronimo','123123','Geronimo@gmail.com','Carrera 30 | 20-12',1,'123','123','2023-11-15','Cedula'),(2121,1,3,'1','1','sdsd@gmail.com','1',1,'11','1','2023-11-02','Cedula'),(2838,1,1,'jo','jo','jo','jo',1,'11','1','2023-11-16','Tarjeta de Identidad'),(19191,1,3,'19191','1','oofawe@gmail.com','bemba',1,'1','1','2023-11-08','Tarjeta de Identidad');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tienda_com'
--
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipodedoc varchar(45))
BEGIN
update cliente set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodedocumento = tipodedoc where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Factura_Compra`(in fact_compa int, in idprov int, in iduser int,in typeofpay varchar(45) )
BEGIN
update fact_comp set idProveedor = idprov, idusu = iduser,tipodepago = typeofpay where idfact_comp = fact_compa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Producto`(in idproduc int, in nombe varchar(45), in descripcin varchar(45), in image longblob, in route varchar(500))
BEGIN
update producto set nombre = nombe, descripcion = descripcin, imagen = image, ruta = route where idproducto = idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Provedor`(in idpro int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipoofperson varchar(45),in tipodedocu varchar(45))
BEGIN
update proveedor set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodepersona = tipoofperson,tipodedocumento = tipodedocu where idProveedor = idpro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Usuario`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date,in clav varchar(200), in sexo int, in cargo int)
BEGIN
update usuario set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, idcargo = cargo, clave = clav where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Venta`(in idfact int, in tipodepago varchar(45), in identificadorusuario int, in idcliente int)
BEGIN
update factura set tipopago = tipodepago, idusuario = identificadorusuario, cedula = idcliente where idfact = idfactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistroActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistroActualizar`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Cliente`(in idcli int)
BEGIN
select * from cliente where idcli = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Factura_Compra`(in idfactcom int)
BEGIN
select * from fact_comp where idfact_comp = idfactcom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Producto`(in valor int)
BEGIN
select * from producto where valor = idproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Provedor`(in idpro int)
BEGIN
select * from proveedor where idpro = idproveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Usuario`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Venta`(in idventa int)
BEGIN
select * from factura where idventa = idfactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Cliente`(in ced int)
BEGIN
update cliente set condicion = '0' where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Factura_Compra`(in idfactucom int)
BEGIN
update fact_comp set condicion = '0' where idfact_comp = idfactucom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Producto`(in idproduto int)
BEGIN
update producto set condicion = '0' where idproducto = idproduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Provedor`(in ced int)
BEGIN
update proveedor set condicion = '0' where idProveedor = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Usuario`(in ced int)
BEGIN
update usuario set condicion = '0' where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Cliente`(in valor varchar(45))
BEGIN
select * from mostrar_cliente where Cedula like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Factura_Compra`(in valor varchar(45))
BEGIN
select * from mostrar_factura_compra where Identificador like concat('%',valor,'%') || idProveedor like concat('%',valor,'%') || IdUsuario like concat('%',valor,'%') || Fecha like concat('%',valor,'%') || TotalCompra like concat('%',valor,'%') || Descuento like concat('%',valor,'%') || TipoDePago like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Producto`(in valor varchar(45))
BEGIN
select * from mostrar_producto where Identificador like concat('%',valor,'%') || NombreDelProducto like concat('%',valor,'%') || DescripcionDelProducto like concat('%',valor,'%') || Precio like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Provedor`(in valor varchar(50))
BEGIN
select * from mostrar_proveedor where Identificacion like concat('%',valor,'%') || Genero like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || TipoDePersona like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Usuario`(in valor varchar(45))
BEGIN
select * from mostrar_usuario where Identificador like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Cargo like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Cliente`(in cedulaID int, in idsex int, in persons_name varchar(45), in phone_number varchar(15), in gmail varchar(45), in direzion varchar(45), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into cliente values (cedulaID, idsex, persons_name, phone_number, gmail, direzion, '1', dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura`(in tipodepago varchar(45), in CC int, in iduser int, in numerocomprobante int)
BEGIN
insert into factura (fecha, tipopago, impuesto, totalfactura, cedula, idusuario, condicion, numerodecomprobante) values (current_date(),tipodepago, '0.19','1', CC, iduser, '1', numerocomprobante);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra`(in idProve int, in idusuario int, in typeofpayment varchar(45), in numerocomprobante int)
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion, numerodecomprobante) values (idProve, idusuario, current_date(), '0', '0.19', typeofpayment, '1', numerocomprobante);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra_Producto`(in idfactura_com int, in idprodu int, in cantidad_compr int, in precio_unitario int)
BEGIN
insert into fact_com_prod (idfact_com, idpro, cantidad_com, pre_uni, pre_total) values (idfactura_com, idprodu, cantidad_compr, precio_unitario, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto`(in namez varchar(45), in descr varchar(45), in image longblob, in route varchar(500))
BEGIN
insert into producto(nombre, descripcion, cantidad, imagen, precio, condicion, ruta) values (namez,descr,'0',image,'0','1', route);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto_Factura`(in producto_id int, in factura_id int, in stock int, in discount float)
BEGIN
insert into producto_factura (idproducto, idfactura, cantidad, descuento, totalventas) values (producto_id, factura_id, stock, discount, '0'); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Proveedor`(in idsex int, in typeofdocument varchar(45), in namez varchar(45), in gmail varchar(45), in phone_number varchar(45), in direction varchar(45), in typeofperson varchar(45), in dateofbirth date)
BEGIN
insert into proveedor (idsexo, tipodedocumento, nombre, correo, telefono, direccion, tipodepersona, fechadenacimiento, condicion) values (idsex, typeofdocument, namez, gmail, phone_number, direction, typeofperson, dateofbirth, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Usuario`(in iduser int, in idsex int, in idcarg int, in namez varchar(45), in phone varchar(45), in gmail varchar(45), in direction varchar(45), in loyin varchar(200), in contra varchar(200), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into usuario  values (iduser, idsex, idcarg, namez, phone, gmail, direction, "1", loyin, contra, dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in log varchar(200), in pass varchar(200))
BEGIN
select login, clave from usuario where login = log && clave = pass && condicion = '1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mostrar_cargo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cargo` AS select `cargo`.`idcargo` AS `idcargo`,`cargo`.`nombre` AS `nombre` from `cargo` where (`cargo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_cliente`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cliente` AS select `cliente`.`cedula` AS `Cedula`,`sexo`.`nombre` AS `Genero`,`cliente`.`nombre` AS `Nombre`,`cliente`.`telefono` AS `Telefono`,`cliente`.`correo` AS `Correo`,`cliente`.`direccion` AS `Direccion`,`cliente`.`fechadenacimiento` AS `FechaDeNacimiento`,`cliente`.`tipodedocumento` AS `TipoDeDocumento` from (`cliente` join `sexo` on((`cliente`.`idsexo` = `sexo`.`idsexo`))) where (`cliente`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_detalle_factura`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_detalle_factura` AS select `fact_comp`.`idfact_comp` AS `IdentificadorFacturaCompra`,`producto`.`nombre` AS `Producto`,`fact_com_prod`.`cantidad_com` AS `CantidadComprada`,`fact_com_prod`.`pre_uni` AS `PrecioUnitario`,`fact_com_prod`.`pre_uni` AS `PrecioTotal` from ((`fact_com_prod` join `producto` on((`fact_com_prod`.`idpro` = `producto`.`idproducto`))) join `fact_comp` on((`fact_com_prod`.`idfact_com` = `fact_comp`.`idfact_comp`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_factura_compra`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_factura_compra` AS select `fact_comp`.`idfact_comp` AS `Identificador`,`proveedor`.`nombre` AS `IdProveedor`,`usuario`.`nombre` AS `IdUsuario`,`fact_comp`.`fecha` AS `Fecha`,`fact_comp`.`total_comp` AS `TotalCompra`,`fact_comp`.`descuento` AS `Descuento`,`fact_comp`.`tipodepago` AS `TipoDePago`,`fact_comp`.`numerodecomprobante` AS `NumeroDeComprobante` from ((`fact_comp` join `proveedor` on((`proveedor`.`idProveedor` = `fact_comp`.`idProveedor`))) join `usuario` on((`fact_comp`.`idusu` = `usuario`.`idusuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_producto`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_producto` AS select `producto`.`idproducto` AS `Identificador`,`producto`.`nombre` AS `NombreDelProducto`,`producto`.`descripcion` AS `DescripcionDelProducto`,`producto`.`cantidad` AS `Existencias`,`producto`.`imagen` AS `ImagenDelProducto`,`producto`.`precio` AS `Precio` from `producto` where (`producto`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_proveedor` AS select `proveedor`.`idProveedor` AS `Identificacion`,`sexo`.`nombre` AS `Genero`,`proveedor`.`tipodedocumento` AS `TipoDeDocumento`,`proveedor`.`nombre` AS `Nombre`,`proveedor`.`correo` AS `Correo`,`proveedor`.`telefono` AS `Telefono`,`proveedor`.`direccion` AS `Direccion`,`proveedor`.`tipodepersona` AS `TipoDePersona`,`proveedor`.`fechadenacimiento` AS `FechaDeNacimiento` from (`proveedor` join `sexo` on((`proveedor`.`idsexo` = `sexo`.`idsexo`))) where (`proveedor`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_sexo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_sexo` AS select `sexo`.`idsexo` AS `idsexo`,`sexo`.`nombre` AS `nombre` from `sexo` where (`sexo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_usuario`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_usuario` AS select `usuario`.`idusuario` AS `Identificador`,`sexo`.`nombre` AS `Genero`,`cargo`.`nombre` AS `Cargo`,`usuario`.`nombre` AS `Nombre`,`usuario`.`telefono` AS `Telefono`,`usuario`.`correo` AS `Correo`,`usuario`.`direccion` AS `Direccion`,`usuario`.`fechadenacimiento` AS `FechaDeNacimiento`,`usuario`.`tipodedocumento` AS `TipoDeDocumento` from ((`usuario` join `sexo` on((`sexo`.`idsexo` = `usuario`.`idsexo`))) join `cargo` on((`usuario`.`idcargo` = `cargo`.`idcargo`))) where (`usuario`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_venta`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_venta` AS select `factura`.`idfactura` AS `Identificador`,`factura`.`fecha` AS `Fecha`,`factura`.`tipopago` AS `TipoDePago`,`factura`.`impuesto` AS `Impuesto`,`factura`.`totalfactura` AS `TotalFactura`,`cliente`.`nombre` AS `Cedula`,`usuario`.`nombre` AS `IDUsuario`,`factura`.`numerodecomprobante` AS `NumeroDeComprobante` from ((`factura` join `cliente` on((`factura`.`cedula` = `cliente`.`cedula`))) join `usuario` on((`factura`.`idusuario` = `usuario`.`idusuario`))) where (`factura`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 12:02:48
