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
INSERT INTO `cliente` VALUES (1,1,'BembaRayo','1','1@gmail.com','1',1,'2023-12-05','Cedula');
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
  CONSTRAINT `idfact_comp` FOREIGN KEY (`idfact_com`) REFERENCES `fact_comp` (`idfact_comp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idpro` FOREIGN KEY (`idpro`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_com_prod`
--

LOCK TABLES `fact_com_prod` WRITE;
/*!40000 ALTER TABLE `fact_com_prod` DISABLE KEYS */;
INSERT INTO `fact_com_prod` VALUES (45,36,23,100,0,0),(46,36,23,2,20000,40000),(47,36,23,1,10000,10000),(48,36,23,0,0,0),(49,36,23,0,0,0),(50,36,23,0,0,0),(51,36,23,0,0,0),(52,36,23,2,10000,20000),(53,36,23,110,0,0),(54,36,23,99,40000,3960000);
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

set @suma := (select sum(pre_total) from fact_com_prod where idfact_com=new.idfact_com);

update fact_comp f set f.total_comp = @suma+(@suma*f.descuento) where f.idfact_comp=new.idfact_com;
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
  `descuento` float NOT NULL,
  `tipodepago` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  `impuesto` float NOT NULL,
  PRIMARY KEY (`idfact_comp`),
  KEY `idProveedor_idx` (`idProveedor`),
  KEY `idusuario_idx` (`idusu`) /*!80000 INVISIBLE */,
  KEY `idusuario` (`idusu`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_comp`
--

LOCK TABLES `fact_comp` WRITE;
/*!40000 ALTER TABLE `fact_comp` DISABLE KEYS */;
INSERT INTO `fact_comp` VALUES (36,31,1,'2023-12-13',4795700,0.19,'Tarjeta de Credito',1,1,0.19);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (17,'2023-12-13','Tarjeta de Credito',0.19,57834,1,1,1,1),(19,'2023-12-13','Efectivo',0.19,2301790,1,1,1,12),(20,'2023-12-13','Tarjeta de Credito',0.19,1,1,1,1,88);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (23,'Mouse','Pochoclo Nuclear 999',107,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\í/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B®7\020200721<\0124448+00008BIM%\0\0\0\0\0lD©.w@q&ô ò¼\'Ç8BIM:\0\0\0\0\0\ï\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\à\0\0\0\0\0\0\0\0\0Grn doub@o\à\0\0\0\0\0\0\0\0\0Bl  doub@o\à\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\Î\0\0\0\0\0\0 \0\0\0 \0\0\à\0,\0\0\0!²\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ù8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0\0 N\Ä\0,\Ä\ì\0¯‰\Ø\0(v\'\0¯‰\Ø\0(v\'\0\0±±;\0*‰\0±±;\0*‰\0±±;\0*‰\0\0º\ìN\09‰\0º\ìN\09‰\0º\ìN\09‰\0\0»Ø\09‰\0»Ø\09‰\0»Ø\09‰\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0\0¾\0\0\0;±;\0¾\0\0\0;±;\0¾\0\0\0;±;\0\0¾;\0=bv\0¾;\0=bv\0¾;\0=bv\0\0¿±\0>‰\0¿±\0>‰\0¿±\0>‰\0\0À\ìN\0?‰\0À\ìN\0?‰\0À\ìN\0?‰\0\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0\0ÁØ\0F\'b\0ÁØ\0F\'b\0ÁØ\0F\'b\0\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\0Å±;\0O±;\0Å±;\0O±;\0Å±;\0O±;\0\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\0\Æ;\0d‰\0\Æ;\0d‰\0\Æ;\0d‰\0\0\Æbv\0t‰\0\Æbv\0t‰\0\Æbv\0t‰\0\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\0«D\ì\0œI\Û\0¯‰\Ø\0¶;\0¯‰\Ø\0¶;\0\0°bv\0»\'b\0°bv\0»\'b\0°bv\0»\'b\0\0¯Ø\0¾\ìN\0­‰\0¿v\'\0­‰\0¿v\'\0\0Ø\0\ÇN\Ä\0—‰\Ø\0Ç‰\Ø\0—‰\Ø\0Ç‰\Ø\0\0ƒ±;\0\È\Ä\ì\0~‰\Ø\0Æ‰\0~‰\Ø\0Æ‰\0\0h\ìN\0\Ã\Ä\ì\0b;\0º;\0b;\0º;\0\0Xbv\0²‰\0T\0\0\0‰\0O‰\0Š‰\0\0VØ\0y‰\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0XØ\0u±\0XØ\0u±\0XØ\0u±\0\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0\0Xbv\0q‰\0Xbv\0q‰\0Xbv\0q‰\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h‰\Ø\0I‰\0v\0\0\0>\ìN\0v\0\0\0>\ìN\0\0x±\0>\0\0\0x±\0>\0\0\0x±\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿ\á%\ÔExif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô\0\0\0\0\0\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\ã\0\0\0\0\0\0\0\ë(\0\0\0\0\0\0\01\0\0\0\0\0\0\0ó2\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0\0\0\0ipp\0‡i\0\0\0\0\0\0(\0\0¼\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(‚š\0\0\0\0\0\0‚\0\0\0\0\0\0ˆ\"\0\0\0\0\0\0\0ˆ\'\0\0\0\0€\0\0\0\0\0\0\00210\0\0\0\0\0\0\0\0\0\0\0\02‘\0\0\0\0\0‘\0\0\0\0\0\0F’\0\n\0\0\0\0\0N’\0\0\0\0\0\0V’\0\n\0\0\0\0\0^’\0\n\0\0\0\0\0f’\0\0\0\0\0\0n’\0\0\0\0\0\0\0’\0\0\0\0\0ÿ\0\0’	\0\0\0\0\0\0\0\0’\n\0\0\0\0\0\0v’\0\0\0\0\0\0~’‘\0\0\0\0\0\0…’’\0\0\0\0\0\0Œ \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0  \0\0\0\0\0\0  \0\0\0\0\0\0œ¢\0\0\0\0\0\0\0£\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0“¤\0\0\0\0\0\Z\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤	\0\0\0\0\0\0\0\0¤\n\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0“‡\0;š\Ê\0\0\0\0´\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0\İ\0\0\'\0\0\0©\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0©\0\0\0d\0\0$\0\0\è354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!²\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\İ\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sğ\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñğ3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ı¸ZÚ¿ğD”ôi.J\Ïñ‘\Ñ\Zğ\ÖS{¿”C\0ÿ\0ÏV©úù\Ğ\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\İm\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECş*½wı.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯ş3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Şû­¯ı* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ı&\Ï\Ñ\Õú\ç2^\ë®õ\0e-\İmÑ¬o\Ñoª\ï\Í\Ş\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛ\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikİ\Ã÷9µ\İ]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½ş1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\İ\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\İ{ƒkiš\èfŒoş”³şêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ıÂ·1\ÃV´º;ğ?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ğ\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ĞS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\şqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉıŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4şšªı\"×‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ı`\éØ´\Ô:vef±¯Ä²\Ému\Öğc+;\Ûú-‘±¸ÿ\0Î¾\ïğI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™işß§\ÓşWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹Áş\Æfd»ù5S]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Ş\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœİ”\×ş†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wş	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\İ\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYşfıkÀ»#\ÑSœ30^2ñ-i÷‡05\ŞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\İBğF.4ò\Ó]C¿\Ïıÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ğ/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»ş\ëZ\ßğu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»ş¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôş‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îş\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êşc¶’—\å0\ÒHû3\\\\N\Ğ\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyıo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ĞWÿ\0^»üJwş£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadıg\êG­õzºn\â\á¼\×N\İ[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×²:?Mf	mYù\íô©\Ó\Ğ\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\İ¬ls\Âk\ŞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\İõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\İÿ\0A%<o\ÕN Şõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’J¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñğ\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\î\Ç>\ËK$ÿ\0„w\î=\Íı\ï\èô«\İc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïğ§şut?Rş«;§cı»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgı\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜIı\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElşQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØğZ\ÇX\ç82ª\Ú%\Ï{\Ê\ëcG\ç9\î\Ø\Å\ì¤\àıNú³eıE\ík\Øß´õ›\Ş\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kş5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsş…_Î —‰\ÂfWÖ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Ş}\Ö\ä?ùW]µŞŸıÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yş¾õ_­g\\,œ®\Øô\Ù`øµ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èşS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ğ§şšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzı:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Şv\ì\ì±\íşE–û?\ÒZ’œµ1˜\ìc9¿§xŸcHşd8…±®÷ş\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àı¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷ş\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Ş\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zş±ş\Ú\Ê\â’:f3‰ =Wı™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶ş\é{\ïs?ı\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çşúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúY\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦ş»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\İt §‡7\'m-ö6\Z\Ğtc=­u¯ü\İ\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwıcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\İ\0öˆğÑŸõ\Î\Æh·©c\à4\é‰_«güeğ\æÿ\0›Ê¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrİA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ĞûÛ²ŸıŸ\Õ\ë\İÿ\0½Efı]\è\Õt>‹‰\Ò\ë;ş\Í\\Xÿ\0ß±\ÇÔ¾\İ\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@İ¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿ~¶}S\ëı-\Öõ\Z·Qc¢¬\Êd\Ğd{+iúT9¿CÒ·ı\èıO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rı\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ıö\ê·û\ĞSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëW\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®İ«5ù¹on\Óaku\Ñÿ\0By\äø¡J{P98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ı3¾\Ñwúk?Eü\Ê\Ş\é8W\ç\ÜpºSM•Wı#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\İ-\İfŒ\\\Ò\ìzŸ\Õ3\ãP\Ğ>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»ó\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­şm ~\å\rİ»ù?\Ï[şk\á\ä\âecW~•İŒñ5\ÙQaOc™\í^[ş0óz\ÏY\êV\ã\áş±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñú¢\äºG\\\ê½ó‘Ò²\ç\Ò1º\Öò;dc¿ôo~¿\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\İNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlşÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\İ\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ŞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaş-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ı‡oş–Mÿ\0Œ_ùr\ïı‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½ş&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^;	tIq.w\Ò{\Şò\ç½\îX?Yºõ·\ä_\Ñ:s\ËûJö¯h±¢Ê±¨}~µn\İvgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\İs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-İ³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvM\"¼ê™º«Kˆ.±õ\×\ìµ\Îu\ë0\İÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘ş‘»›ÿ\0^\ĞıRšş\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ıfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ĞõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ğö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ùÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ğ\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤ş\0_.\0\Ï\0\í\Ì\0\0\\\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ğ\0\Õ\0\Û\0\à\0\å\0\ë\0ğ\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áğş\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\u§À\Ùó\r\r\r&\r@\rZ\rt\r\r©\r\Ã\r\Ş\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îğ4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\İ\Z\Z*\ZQ\Zw\Z\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ğ!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\İ#\n#8#f#”#\Â#ğ$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ğ**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/ş050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e44\Ø55M5‡5\Â5ı676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ŞF\"FgF«FğG5G{GÀHHKH‘H\×IIcI©IğJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\İP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbğcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qğrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰şŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿfÎ6nÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒ@®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ı§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ğ­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ğ·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ğ9Ğº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\İİ–\ŞŞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ğ\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌğXğ\åñrñÿòŒóó§ô4ô\ÂõPõ\Şömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ı)ıºşKş\Üÿmÿÿÿ\áŠhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa‘Br¡±Á\Ñ\áğÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AğQaq\"2‘¡±Á\ÑñB\ábÿ\Ú\0\0\0?\0\ßÆ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@\Z\0\Ğ€4 \r\0h@:‹\ÎÛ›\Û\î\Ø\ë¸\çüÃ±%xH±Ú¼»\Ù#\á\ÜJ\n¢²0Q*¨/,.ŠS\0Š,[¸W€\í\àt3n\êN\éåˆ¢\Úÿ\0…Rw\İ\ËYdb’“ikN+5\Èó.u–K–A$zq®…$\Ês¢Í¤“„ˆ±=THcu¤p\å/\â\n˜šú¦75z–~L\'³(À¦º\Ì\ÓQ£\\£™eZ»\'\0\r\İJV#¢#\ÓzA:~¢\0‰\ÌÀ%\r_£	dñš\ì\Úc¯ªWs\Ï=2\Æ64›»Q\Ù1­\Ê@¨\ÌR]TUnªG±d\×MtWEB*p:j\"r\0\åÿ\0•\Æu\ÏB­´şEªm\Ï\ê/¨\äGQ¬²¾%`¯A\'r•‹a=F)¨r”\î\r:\Ü\ÅU2€ˆ‰ ğ§‘ñ¬\å‚ÿ\0\Ñõ ¦·\È\Ğn!\ÎØ¯:V™Z±¥º.\ÅôN@I(Aº\Éª¦1T)D½\ä\à@Àa/d\ÓNš%4óC½¨$4 \r\0hs8nm¶#’3†E¬\ãŠtjj™I[ò £Õ’(\Ø\ÃG$u9&n\â4EeŒ&\0jKVJMèŒ•\ï·\êX·I¶°Uv[U&;«4E\Ù]\çL—\ÒF\Ü\å’7«!P¡/ê²­&)‚‚“‰o~\è@J!\İN\0+\Õzd‰¤µÏŸ379“0\Ù_¸Ê›‘³\Îdüırbß½\Êr\Ë[\ÜbZ»¦\å|Í´\Ñ\'(ƒœ \î9Dœ4\Ä,EA’È¢f¿\nß…ºÖºQ=¨ƒ,$-Æ¹\')o\ÖÆ­\Ï=)™O¸ª\Ümµ‡jÑ¬½n‰\ÒceY\0*‚ş?;•\Ò-\Ğná»•OO-‹(w/¬Pöù†p]Jf\Åó+°3lm\Óy^g¬i\Ì/‰J\×‰\ØcwN…_g ş9¤´\é›*ñ‹wmT,¡¢2m«¯k2ƒm¹”-÷\ë\ÆC<\\$\ÆAµ\Ë\Üg\ZW\Z:,%\çû\âG³N(7;\ÅTH0e\ÕXÜ¨©\ÄvRj÷Ô„¯AyJ\ÌS„|‚q•k…\Ñ\Êc¤\Ö51IU˜Â²E0O@´LoLJ\0 \" \Z²\Åk8‘(k{û±n %Ä™5¦KañZ(HFg¬ô°ñN\ÜJÁÄ„\ÔIˆ­y\Ğ	Nt\ÕY2¥)s\á\ÔO5\ï*o~sBª4\í<¹\ÍÎ€»i\Ï“\ë5öó›\ÊIIA#-fhf\Æei`TRYEöe˜#U›¬@E³\Äm{@«¢³@\Z\0\Ğ1\Õ\'ª0\é\ÛEaŠLo[½1Y|ŒRz™Uk\Ü\å¨]-i$§ªÊ®G\èÇ‚µQ4Œ>‘\ÃYbbt*_-ß‘„\İ\Â\îk>nòò\ï)nñ-n—p¢ªDE*¡Ò­\ÖY®s\nq\Õ\Ø4¸B5©\0¼‘2˜İ¾D =¡Ì¦\Û\ê•\Ûğ\å\ÍVU\Õ\Î|ˆow»\Âc¯ig–I‚«\ÒĞ–\"\Ç\Ép,¥œ@K°›kõ”Lá‹—,nº`2©82e(˜À\Z\ÚôQy·±o[;\ØV1\Üşs°f<¹ğmŠm\ä\Ë\ë¦ \Ù\\û‹\ì¹\Øb$S=\Ê\"f\\h„ú3\ÒDŒFB:	*ª¸•9\é„)Ù³-z²m¦’.~y©:‰bı°m.ör\ãˆ\Ë&B\Îu0¥Jô\älXú€\îq$\İë’H·nVµù+¶P.\Ô\"/¹d§\Êé‘“hşmº~\éguÙ•IAÀY“qV;­ã·²‰\Òö,’¬òˆ´¯B¤©Š.\ìŒ:ªUöe)\nR™Ë¤Çµ4\Û1l •ú¹U\Z·%ùööİ¥m\èÒ™YOt\Ù-¡}3Û­‰\ÊÀ`XI€«[X\æò¡SP9*\Ïÿ\0ŠXJF\ã\ÊM²rVÒµóœ,\Â÷˜ó4mj…\İ\îEÊ¶u\Û&F“ˆŒ+Ùµ–/)\"\Ú)$’ˆª1`G\ï^$\İ4›7ar$˜\0$AÑµ–¥=\é*N\Í\Ñ\í\Û`O·V8Ÿ!ÀD\ÜñK„ f¡\ìQ­]>\Ê\ÖÙ£,¤¬›ô\Ì%7\æ99UŞ»+ Q3\Æ%\Û\é.ŠL\Ó\å)d›\É¢ß¨\Ú\ŞroÓ¿6-µ9I›¾\İnÓ¶;\Æ\Îe®¯Jú\áˆl•HJ^6\ÅoEANÁ\î	û÷u§e\í1S3–G `)-	¦\ÒN\Ó!Å§\äkB.Eœ\Äl|´r\Åq&É¤ƒş…Ù½n›¦«Ï’™S0½­ˆ?v€ª®©ıS±7MŒN‹\ÇÄ¾\îşÁúX[‘ø¢¼Ë„DZ­w»¬\ÔEjö1vr{§@^Er„d`ÊŠ¨\Û9\ÍAx½F6ü{ù(e­\Íe\Ëvw\Î÷÷Ü~‘,”\ì\ëò•è¤z1°p1i£Wd	µn\0ƒF\è…(eUS‘·&\ÛvÙ²Ihyù\Õ\\\Å\ÔwÖ»[\Ä°j’ÀØ‡1J³\å\Ò \ĞH8\îK\Üb€ö÷”¹C¦C\Õ+\Ñ\\ŠªIµ©_\Ó%ºX\ìœm±jŒÃˆô\ß\Õ)J‘G(Tb%™™RIND¤˜Fğh¥TT­Š©\Ä5PÂº\Şğê”½šO\\Ä¢\åCr•\Õõ¾\Ñf…n\Â1\Õ\n\ák¯e8DA^\reö.c?˜n\èh‹YF-œ¤\Ä¢R$ &\í»•ªªûQk|µû\Ú[„\ÎqR¶	¸\ìÏ•XK\Ú\'$¬\Ög\ír\r­5\ì6I…½Ä¬ô\ÑBW²J]\Ê\Üe\Ö!”8¥v…-)v4\ÛQ‘ó®]\ÉlšE\äl©¯qq«{¨ø{]\Âvnƒ²”JWŒ\á^=3F\ï@x\\¨¥\0\"\Z”¶H£y;ô_±–IÓ‡\nš¨\çDCDD\æ0ø)@90\0\0<\Z\Ó\áK%zşù\êR¤\ë\Å\ZZ\Øf©\ìg~¢;‰ŠÌ¶\ê\Ê-ñ=M\à9‰*Í‰\Ê$¤Õ¡Š¸zl÷©ö\ìV2€P;:\ÔjN”\íD^†°”œ¥K¿9ß±tšWY\í\á\ÏøH^ö\r\Ò\åc#w\'sŸ³Gä›¥’õEœU\êŒ\ë1–R¤Y”k\r–1’r«”Lb R·gH%¦2™Ê›\Ë@“ª¬›²|uMª–hŸD–Š‹¥\\ªó‡¦\åC¦M\Ä\ã\ë\å\×]9* ¥@t\ÂO\ÃmÊ®\éóÈ†µï¯¯\Ø\Ò7L\à]\Åll9X\Êw½—ÆŒ e€L&1&¨ÏŸ\Ò%@\Ãû\İ|\ç/ßµRó\ç^‰˜\ào»r{C\Ú\à7\'[¤§‘g°ş;”·\ÅS\ÜH)”«¶\î±MYG\É$u†h/½\ëÒ¢_]F‘\Ë$\ÜJ±\È`¬ŸL[Ö‰J\ÚZY\Ì+%eŒÁºŒ\Ët\Ü~·=½d\Ëäˆ¾›šxI“&­\Ä\È\ÄV\ëqE0¥^©\Ç3oß„Z¢A\æ.ª\ë«\Å&\ä\í\çfµ¢¬¨\\5R™[¹Zœ:¹\nˆ™C˜\ÄMW‹˜‡2Lú‚\0£•=3|iC¬¨•4\Ì:&Ö‹/\É®Œo™ºË…³&RŠ“«\à‡“ÆŸˆ››¡klV¥%\æaú>\å¸ œ© VË®qVI\Ë`Ù²¢ETCH\ÒNŸ¼–d&_9\à{[\Íy%n\Ü5ú¯\\U\n\í:0Y\ÃK§\ns¬\è\Z\çw\'*\"BšÆ¿\"\rZ\íÙ‚\ÇAg+«\ê\Ñ\ZY½l¶¶¨dÁ‹xöˆ1dÜY4H¨ \Ù\"ğšIÀ?\Õ\Èò\"<ˆ˜D\Â\"#Î­vó\Éyó±5^&dG·õ|€‡\Ç\â<~ÿ\0ô\Õ\ÊOF7¯•1ŒnDD¢o°÷ùñ©jŸs7{—U\ÑW¦,\æşw!¦\â¸?\'x\Ì\ïLš‰·“Œ]Ê£M\Åh¹;e\ìòL\\{ )Fğ1r\ë6c‰Š£¾Z^F°‹ò\çĞ°\í\ã]\ãzo½¶\"\ÇK±u²MX\r\êZ5d\ØSò[”¯ZfY*\İ1læ¸™£”¬B˜ˆ¡70\İD‚E¨[\èK»×º\æ\ä­]\ä—9Ø»ŒeI;:\Ú:¾\Í1¬V\ãQ…Œ\ÍHƒu\â\ë€#!.TS)J‘^Í¬¢\é„Ú¸A\0\0M¹\n9?$I:\ìÛ™U6eŒ\Ú<\0üÕ“q}E>\Óö„š\ÊH_¬*z%0€\0%UL\Èvœ\ç\ÖşÎ®JüJOL×‘y\ßN\é\Î=*pJGS\Õö¶\Ì\àĞŠr&\Ão/~\0\r\Üx\ã8\×y‘`»ı¬´¸lsx5\ÇÉ•VÒ›f\Íè˜†\à\ïO\Ø] n>\âUÛ¤`ûòP\ãUp—“%jn”\ÌVİŒ;›=‘\Óx\Z\Ä$g\ãÒ¯¿–Õ‹Q\"«,¨ğ›“‰H™@\ÇUC‘\"”9J<®öu\é\Ï¶\í½\\º«nQ:<sIš¶\Ñ0\ãÖ¯2‹qU£‰\ä·ªÆš\Ù\ê!\Ú6™\Ïj\'x±D\Â\Â=˜ƒü¦‚\æ\Íô+Ğ‹nÖ&÷%µ \í%V™ƒP.4c\é¸\ËJÀ\Ã<ºY\â\ã\Ãò\ÕZ1\ëeÁ‹4R]\ä’EDÇ·;‚¨.Tn’ø\ÅËª\Ó-F#,’©\Ï\Ï\ÏO\'	]­–rbB`+\Õ\Â\ÃUaEÚ€‹,¢P*€š%1Î¨•0:\Ê(±¡µ·–wC-ß‘&\ä8yò\Ü<‡Ÿ<ùÿ\0¾¬šo<‘\"Y^\Ş~€\0>x|}¼‡üõªw™I=+[˜—\Èd[3d\Òju˜·tˆ.¦1\\81€\É4?¯ıjqşÁxñ\Ş\Z\ÏB7»&8jMW\Ø\Ù\ÖĞ²’¸[¡¶ığV!3<w»\Û\ÓZM~ÁY7±»\åI-Ú½¬Wq|\Ä#ó\ÇopJ¬º«EQôQ‰&8ü@\Ù28X˜\ÆP“Sz«¬÷òòNõø‘iFQ•V[ó\Ï\ì{;?\Út6¢Qğ.‘…“4W°™³r–Á)8V“¶\"\İ`\"Átš\ã9Q†A&\"a9\ÍG)K\\\Ù,»;…3PPNQ\âgm‡ew›J\ÊG6	€8{ `¬ˆ‚	H\Ê%L\àWi\ÓU¾hªiï¡Î¿´Î².\ß11İ˜§ƒ¸\å»\"\'Pyn3\'L¬’óÁTöQV\å‹\ÏÁ\ä<:\ëöuu±œŞ†\×:\âK&\Z\éO³\Úå½¢¬l–j®X‘f¹5š¡™n6<Ÿ\ÙrrG®Z!@7S¸5\ÚP—û\éŸk[\Ù\Ş\å»PI\Ş¼Wˆc¤;¶C¯Ubˆ\ãÀ\ï&P!yù\ê“iBM\éD¥m#š.\é\î¤\É\Ôi“\Ñ\Ø#[”¥),G¨û¬!Y²u`h\ĞS¿¨@£%‹a\'%w)$\n´©”\ÉaÒ•e¡g\'t\ÖD\è\è\×\Õ+k¸/\Ø0.\\¢-Š™Rd\ìFù’ˆ\Ù\Õ\Õ+xÉ•Y4\ÖÊ´\Ó¯R´¸3r³k%²\ÍDj\ÕX´LX7+½K\ÇL—;üŠ\Ä\ß^ó¯›\â\ÎRùBÎ›ˆ\n|YWñF:>»*$®AT\Û,d\Ç\ÓykX‰<›zP\0p\ìJ‚\\3f\Í2UE,‰\×.\ä+TK\Ú!ñÀŸ¿\Ï!\ã\íÿ\0­X›²+J öãøó\Ç\ä\ÛWŠ\Ò÷Yóû)&ò°\ÒV™–°Ñ©z®*}4SUuD?¥\'\Üc\Ø\Ç\Ï\Z»j	Y\å,\Ş~\Î\í[V*LZ®qm\í\áÙ¬õä“ƒ&™)$+=‘p©‡µ \íõcˆö¦‘|ˆ5\æ\âM\Îmı\Ì5³Ó›£M\Ú&.\×\\\Å[Qªuùb\Ñkp0mœE¡uaJ1­IU\\_\ç\ZI\Û\'PL¨¤x\ÊúdM\ë\Â¢ºR[­yú\"Y\Ê\ë>v®}u/²<a*‹\È\Ù\ÕH§?Q²-†v\Üx»\Ät@H4ZR\Æö\Ï%Z1@ˆšVX®™5X\Å$|C’¡î¾OSm¥]\Õı7õ\ËÖy\ëQ\\ó\Ñü3RÁ\Ë\êr§¶\ä™\ÕI¼§s‘ym»\Ë;vqE\"Œ\ÄÛ€,s^N\0TY Í²dşR¦˜58‹®W<^oÄˆ¦–”b\Z\'n\Ò}Z:\Å\Õ\éQöS˜\Ş÷—§¢,HC92\ÏjW\Û;\Ä!.¶7ªòdY¡6n˜10	Šyl„9\Z\èÀUJ´Ì¤£Y÷:ƒ\ÅÆ±‡aÉ´llc6±ññÌ‘I³6Y ›flZ7D D\"\Ù$“L…\0)H\0\0\0k¨ ‰\Ë8£g<ms\ÄYV²\Ê\ã2\êÍ¶· £¤”ˆ‘HS]2<`\á\'1\Ïn\Å[»j².š8E7\r–Id\Èr\ÃIªj\Ó\0º\Éı/ÛŠ\Ç%™ºt>\Ì8Rƒ\ì\é\í£Ü¨–n¢¢¸û<\Õ.Uó\ÏC6\Å\Û(\å\âG3+\"‡ô“A¤\ê\âuu^”¶¾sÄœl\ËV-\Ç\îhĞ”:ª\Ù\ì \Õ\Ü\è\n‡9¢‰…v¦\äx;”TT\Ê;8ù÷\"(€ö7?4\ßUt¬—×Ÿ\"t\İ\ß9ò®¤™3(™\Ëö-y\ãõ9zÑ°U`<ö\ÕT$Õ¼šÛŒ³“Uyµó\Î\îu4ù)­0…0r¤z<ƒD\Ôô\çR¡*\íù\æ\ä9]m^¿a6ò\ãM)•±€\Ì(µƒ²»şO¶(…T\Ãö\07Ÿ°\ëEL²\Éú\Ë\ê,(—²@5u%\nC{¥CX¬\ÓUx\Ïf‰„À™|ùE\Ò(ö‰”M4W˜œ—¬\â\å•\ÒĞ˜\É->¿\Øó\ÒwIf—\ÉT\Ü@\êF™;\í“1v”ª<T\æU~UÖ¾\î~]š+¿…	\ãÒE«F\ä‘Ie™Ş’Š\Ù\Ë\Ù\Ôc)¥\ï-?­K\Çõ(º£T;ÚeÎ³±Jx\é[\"­i\ÉW[W%+\n!pO\ïgA$ñ³/\Ê90\é\îFGJš	8t\è˜\á\á\Ï\Ôv\Õö\çcI\Ê1\×\\‹—\Ü^\èºjô{’\ÄT]\ÇXm¹‹-dG\è‹x\èv·\Ë›w@\ã(Xq\ÓyDÑ®Ñ‚X7D¥9 e\×R5\"±zdû\á-:Ÿ‰\Í,I;¯u>\Å\Â\íó8\ísu˜Ñ†HÛ¥\ë\å\ìm$@²´³CÈ³`\äJ‹1š‘\Õbm2‰}Xù&­\"\"\0£r\ëZ]Šs·Œ‡\çl–ŒM„10³\\\"\Û\ìXó\Z\Ò\éS–¢ ¨®lrÕ¨F«Í”‹˜\ê¨ \ê\à\â&Ò’\ÑP-H\r\0\0ü€>|€òıù\0ÿ\0MB›òúu6¾ìŒ–Y˜C\"\à±\àÕ‰›şÓ©U+s\Ğpõ\ãK5®“#NzÁı¤®^œ|.ıÈ“\ã.)¦¡(\áÛª²m÷2«¹o£\Û4\Ûb\ç\ÛVm\Û\Æu¢:YØ²uuRcd	&b™ªS0\ÊB\Ï\Å\È(tT\n\ì\å“)”@\æˆ\Å(Y* ˆn>”\î³Hˆ‚Xó:\àGk¸Êše?\ØLs—\0û€`Ò¾@òúUzÏ˜DG\áõ„GCrğ\ÜüqÇªpñÿ\0+\Ô)}*\İf\Ë\È\á\î@y)‡q\Ø\Ø@\0D;T\ã\çöù\ÔşA/v©ô õT‹\Ê8\ß\"\Ü\î[_Á‘\ï5ko»•¿L\å;¯\Í4“;†5Š¥XÙ‡¥M°Š-\ÜÊ ‚ŠUS/&\n\Ê.Qq\Õ>\ä§M=h\İDŒßºZmf6BE4\ä\rX‚Ad\\\äŒ÷š,L\Ş\ÌJHJJ9\äd\í’c+%+$\àE¼\\TJ\êSaƒ`£pÀ‡d¾¯ö\Í!cN®·o²üø-Y½\çmz?Y^ó›²ô\Z1¹Ÿ 9üRóA]8‚S!  Q‡¨WùE±\×cb\Z0lƒY6\åxôTq\"£¦k.¡‹\ÃşN7òu_ºÿ\0\×oİ?Ã…J=÷\ßÔ¬¨m}ûl\êo…¶ó´¯8†g¹<¥],s˜u\Ô3xœ\n[[c[§3\ÕVXª±¯·«²|¸°šNM«¡|Ä±¦Q\ë\æH›·b¦Ò¦²g.&\Ãi]§§‘Ô´œñ\çÇ“qöı=\Ã\Û\à~·\Z\Ø\Ìú\Ğ€4 \r\0h@\Z\0\Ğ»}[À}Bğ\Ûl5š[\Ú4€´°¿\ã\Ë\æ9·IÑ²F-È±1òq1Wº5’8LF\ÓhFMK!\è½lö=tŸœY«ÁCVš\î\n¬t\åê•·œ¥\Ñ6%\İ\Æ¹/*l{¼\éwq\ÆE\Ãò\ärW{¤\Ä\Çp¢9Et£ô\ìd Tri7ÑP‘+d\Ü¸ñ}–-§†º]\é·üªõ7†<£jN\Õzš2\Û\ÓqN\ÖiõºTR2öÕ’|\îó•ç˜±s‘²Mu\ÛyKMš\ÙcôEË…_Ë¶n°3*\ŞÉšLš5j‰hˆ§ÃŠŒtF2“”œ¬“º¹ \r\0h@\Z\0\Ğ€4 \r\0pÀˆ!ğ?·\Û\Ç\í\ã@\Z\0\Ğ€ÿ\Ù',48000,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\mauseinalam.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
INSERT INTO `producto_factura` VALUES (6,23,17,1,0.19,0),(7,23,17,2,0.19,0),(8,23,17,5,0.19,48600),(9,23,19,100,0.19,972000),(10,23,19,99,0.19,962280);
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `producto_factura_BEFORE_INSERT` BEFORE INSERT ON `producto_factura` FOR EACH ROW BEGIN
set @precio :=(select precio from producto where New.idproducto=idproducto), NEW.totalventas= New.cantidad*@precio-New.cantidad*@precio*NEW.descuento;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `producto_factura_AFTER_INSERT` AFTER INSERT ON `producto_factura` FOR EACH ROW BEGIN
update producto as p set cantidad =cantidad - NEW.cantidad where NEW.idproducto=p.idproducto;
set @suma :=(select sum(totalventas)from producto_factura where idfactura=new.idfactura);
update factura set totalfactura=@suma+(@suma*impuesto)where idfactura=new.idfactura;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (31,1,'Cedula','Bomba','1@gmail.com','1','1','Natural','2023-12-07',1);
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
INSERT INTO `usuario` VALUES (1,1,3,'Jean','123','1@gmail.com','1',1,'1','1','2023-12-14','Tarjeta de Identidad');
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
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion, numerodecomprobante, impuesto) values (idProve, idusuario, current_date(), '0', '0.19', typeofpayment, '1', numerocomprobante, '0.19');
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
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_ProductoFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_ProductoFactura`(in idpro int, in idfact int, in canti int)
BEGIN
insert into producto_factura (idproducto, idfactura, cantidad, descuento, totalventas) values (idpro, idfact, canti, '0.19', '0');
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
/*!50003 DROP PROCEDURE IF EXISTS `Ver_Detalle_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver_Detalle_Factura`(in valor int)
BEGIN
select fact_comp.idfact_comp 'Identificador', proveedor.nombre 'Proveedor', usuario.nombre 'Usuario', fact_comp.tipodepago 'Tipo_De_Pago', fact_comp.numerodecomprobante 'Numero_De_Comprobante', fact_comp.fecha 'Fecha',  fact_comp.total_comp 'Total_Compra', fact_comp.impuesto 'Impuesto', producto.idproducto 'IDProducto', producto.nombre 'Nombre_Del_Producto', producto.descripcion 'Descripcion_Del_Producto', producto.cantidad 'Cantidad_Del_Producto', fact_com_prod.pre_uni 'Precio_Unitario', fact_com_prod.pre_total 'Precio_Total' from fact_comp inner join proveedor on fact_comp.idproveedor = proveedor.idproveedor inner join usuario on fact_comp.idusu = usuario.idusuario inner join fact_com_prod on fact_com_prod.idfact_com = fact_comp.idfact_comp inner join producto on fact_com_prod.idpro = producto.idproducto where fact_comp.idfact_comp = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ver_Detalle_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver_Detalle_Venta`(in valor int)
BEGIN
select factura.idfactura 'Identificador', cliente.nombre 'Cliente', usuario.nombre 'Usuario', factura.tipopago 'Tipo_De_Pago', factura.numerodecomprobante 'Numero_De_Comprobante', factura.fecha 'Fecha',  factura.totalfactura 'Total_Factura', factura.impuesto 'Impuesto', producto.idproducto 'IDProducto', producto.nombre 'Nombre_Del_Producto', producto.descripcion 'Descripcion_Del_Producto', producto.cantidad 'Cantidad_Del_Producto', producto_factura.descuento 'Descuento', producto_factura.cantidad 'Cantidad_Factura', producto_factura.totalventas 'Total_Ventas' from factura inner join cliente on factura.cedula = cliente.cedula inner join usuario on factura.idusuario = usuario.idusuario inner join producto_factura on producto_factura.idfactura = factura.idfactura inner join producto on producto_factura.idproducto = producto.idproducto where factura.idfactura = valor;
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

-- Dump completed on 2023-12-13 14:33:21
