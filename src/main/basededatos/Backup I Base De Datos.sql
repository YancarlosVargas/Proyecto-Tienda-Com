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
INSERT INTO `cliente` VALUES (123,1,'Johan','312020202020','johanvanegas@gmail.com','Quibdo',1,'2023-10-09',''),(322,1,'djwojwdo','1122121','1211','ewew',1,'2023-10-04','Nit'),(999,2,'joj','oj','ojo','ojoj',1,'2023-10-04','Tarjeta de Identidad'),(2334,3,'jajdwwdopj','oo','joj','fefee',1,'2023-10-10','Tarjeta de Identidad'),(21112,2,'1','1','121','232',1,'2023-10-04','Cedula'),(77474,2,'JOOOOOOOOOOOOOO','jawdpojowjpoawd','32332','1',0,'2023-10-03','Seleccionar:');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_com_prod`
--

LOCK TABLES `fact_com_prod` WRITE;
/*!40000 ALTER TABLE `fact_com_prod` DISABLE KEYS */;
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
  `descuento` float NOT NULL,
  `tipodepago` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idfact_comp`),
  KEY `idProveedor_idx` (`idProveedor`),
  KEY `idusuario_idx` (`idusu`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_comp`
--

LOCK TABLES `fact_comp` WRITE;
/*!40000 ALTER TABLE `fact_comp` DISABLE KEYS */;
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
  PRIMARY KEY (`idfactura`),
  KEY `cedula_idx` (`cedula`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `cliente` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Mouse','Funciona',74,NULL,24000,1,''),(2,'TV','nose',39,NULL,24000,1,''),(3,'PC','ei',20,NULL,90000,1,''),(4,'Laptop','membe',84,NULL,24000,1,''),(5,'Celular','bemba',30,NULL,2000,1,''),(6,'Bomba','idk',40,NULL,24000,0,''),(14,'1q3','123',0,NULL,0,1,NULL),(15,'BOMBANUCLEAR','BEMBARAYO',0,_binary 'ˇ\ÿˇ\‡\0JFIF\0\0`\0`\0\0ˇ˛\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nˇ\€\0C\0ˇ\€\0Cˇ¿\0\0h\0h\"\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nˇ\ƒ\0=\0\0\0\0\0\0\0!1	QÅ\n\"Aaqë2°±¡\—\·#RrBí¢£Òˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0 \0\0\0\0\0\0\0\0\0\0\0\01Që!qÅ¡Òˇ\⁄\0\0\0?\0ëë)å&»èàr˙¸øMK\Í\Â¯}ˆ◊£˘¸˙\ÍQ\‰>\Ïè.Å\Ô¯¸9\Í\Ì\Ó˙ô:û(w(d@üÜm@SH\Èˇ\0\ƒ?}U0\‰:\‰3Ú¸:Ú\Âœóü]I¶\ﬁ\Ô\ÔÚxπ:I\›#˛\–ˇ\0¥?}CπK?p∏ˇ\0àgÛ˝\≈MU)J è\ƒ\«Û\Î¶\ﬁ\Ôµ2u<è7ró∏Ö˜ı(y{ˇ\0ü∫∞™\⁄ˆ\◊\—ÿ¥Æköè{,ìÖ\„Z\’u<<\‚I™$ìï•.˝ëù¶\›UëMc\"\ngTÖ6¡úäp)Ja\‡>Ù/âá\"\¬Pˆçë\0\0z\Ê√ø\Õˇ\0^Ω\ƒ\Ôf˚Wñ\∆˜‹∫BÅêÆ\‰({`⁄ïÆjhH&6\Óﬁ®zFòïk\·\‰bf™ü¥=Fıt\‚$∫sX\‚\ﬁAB∑@\Àm\Ê\€ı2N$ügFZ™\›‘ÄQß™∫>wè#P\¬J≥åp˙É˜Y\»p\„\Âœê\Í\Ë<SÄî[s\◊	\Áåc¶0=@|C\\¿£´\Œ’ò7	#∫Ω¨\\W\·ã\≈G\∆*\Èu\»R%∏7K<1ñ9ÄÑıóßP´í\‘ˆ•\Ôû.Ø€ï5\Z\÷}yG1D´D\¬3E≤Ï¶ñáUız!W*£E™tLég \ÂQä\Èö4¨\"áÉq0à¶\0oxáPÒ\Í∆≠§≠-\nä ÆîyØ\nÒüå¿\œ s\«Nú¥\ﬁ\ÔFªp{®\‹u†›ïc~.Mot-¥E˙åßl§\Õw(º\ÏåB\„M8®n1,Ù™Hç+úıHxïﬁºm∫Øò≥PÖ*†.\\’øπ-∂N6€õ\Œ|\Ó~RI7$ñÛçmº∂ é-∫©Ñ!YÅÇ9S\0Ç$\ÍQ)\À‘æ\„î3\–y˚¥k ^@Õº©É\∆1¿¶>üL\Ë\‘VQ\0é©âä#\”\œ\Ë=1ûùs˛51˙\œÙR\–Mé!\0\0ı¯\0t˙¯\Í<\‚è\Ì†ùG\Â˙Ü™\Ë)pà~?∂™\0`\0›®\Ë\–&wk\ﬁ\Á\«i›ü˜ˆ\‚E\»>∑©iø\Ì%≥?x¢nØnò©JFæbdƒ¶T\‹Kπ\ \√ >\¬4\Í™pîu\À\Í\·T\n“î\Ì8\ÌÄUyq®8∂®Ä\ÂC¡R3QU=Cë\œ¶´§ÈÜã°Åã“òpC\È\⁄îv\È	P]ª¥\ÿ9˙*\÷S\Ôu\ƒh\—uM\ﬁ\÷5\ o)\ 1\„|˜bˆãå©•êL\n\'\ÎVJ\‰EBa6_∑Ü˜\ÊO~ó.uÅ\‰(MÅv}\Ó:∫p®\"«Ø~*õiYS¥\Ÿ†Åëıò©Ÿ´ç<€ã)\Ë”îªH@-\◊U\Î\Ê4—§£üÆÿà6ZEã¶é\\†\Ìg/K\‘eJ\‡Jb¢\‡\Õ¡∫@Bï3˚F\‚Û\◊	O±†ß¶*™ÊáÜX•T\∆:é\\\Ã\Œ\ÃzKî\‹\‘Y\·ò§í»à™w$IA\‚P˘Zç´\œ9DADïN\Z™E?å›öE˚8É˛\‡:\À&°@Dy5\»ÙŒî≥ìm°ª}Úmo\Ô}°J\‘∑∂\Î pW˛\’Z¿˛¶t\…\ÍÇS6ÛÒÙ\À84ÅBâTZ\‡\"@\ S¸ª!∂∂;=\ÏÚ\€U¢ìèMçl\ÊÜB\‰\‹\‡*\'E…ÆM\÷\\ı\ÂV\’(∏Ä^iµ*ô∞\0Vê\rí¶•*\„¸?}S\∆zàqdGa\»Û¿g\0\0\0ZÜÉ]\·[˙î<cá˛≥||>Ω:h\’+º`-ø®Û\Ôèq\œ\‹\Èõ9@ÒZ4D˝\Á˙©j©˙y˛É®†!\Ã?\Á¸\ÈÂ†Å>¸áÛ\rU\‘\0†¿?\‘tº2rbcüJIªAÑtsG/§9T®7d≈ö*9x\Ìué Dëj\Ÿ%WUCâ¶c\‡^\Ì#ov\Ï[\Ì7≥^ˆ\À6òjÆÚ$\∆¿\“OP\n·ëÆQ\\≥¨¶äY4\‡≠\ÀJµ\ÔÆ\nVØEÜT*ã\"CÉ˜õπï˜9ª=\∆\Ó™`\Î=Ö®´z\Œ\‰¬¥v†ü∫∑t\ZhDZöt\¬~@õ®xä»Å@¨´ë\ÂCéú9\Ÿ]µG∂o—§\ﬂ\›Ò´\Zn.Ùˆ\Âª+\’*˝¡T+ı\Ë8´WZ\“v\Õ5¿\Â\nm£\Í:\Ì°≤ t´ÅTºî3T-Õº{π—∑ˆ\”H3ì´wAy\Ìıà¶Tç]%\∆&%\‘\ÏJR≤\ŒHôÖVl>ôm4™éHâBª\\2\›1>∫jÔ™óµ{p\Ïï\‹’≤l\”V™\€Ïñª≥tªP*g*\»Zµ≠}ëH	ëGRoB≈†ÅY\Î\‡…å9Z∂>Ej*êã0äRı9c\"Ü\ÀPñ9j™úÄ@å´\Î\ÀÙélpéûQ\Ë≥Z\nf¨π˚\œ\›9Ö%üR\È\–[t∑\Õ\"úÙ\√\ÊI\◊5≤ú\ÂDÚë∂˙0ÇÅª\—,DÄ*$#Ä¥ö‰ß°j)\„-/MÑDp\nROU(8Åg\‹\0\0d\Ï`\’/\“\0\0ôßó/(ÙIQUΩÉ\ﬁJk\Â\\/\Ìu\»`¡à∫∂ñ=US\nf8ê@q\¬%\Âçπ\‘>_®\ÍMLnæ_O~:èÛ†K†±Æ!Hje\ÈT)NC\0\»rÅàrèRú¶)ä!\»@¿ !\»@CF©\\µäﬁíí\\\‚ Dí1\Ã \"\0Ú\0ê\0¸¥h2˙y˛É†ù<˛üŒæz\”\œ\Î\»u}\ﬂ?ÆÇm\Z4h5˚t[ôµõA≤5ù˛º≤R1\‘úAd	ˆ\ÕC)#PNGSêPîÙ)\\6R^fZbQ£V¨\”Y \n\Ó\‹,ÉFÆMÖ˛ë/iMí\Ì	ó∞Vä\≈\ŒNTñÍàÑü¨™9\»i∫*jJΩó~\’f\‚ûz£I9à\Ë(8∏ìï\€pw∫Úi∂YS5T\‰~v\Ëˆøe˜ãd´;)+wZµnWmAu#\Êaf#\\ı?U“ìçˆû´)ôD—îÅöfnÒ≥¥ªß	:`\·\„7Î∑Å\ÿ3\⁄y∑+óp\"lÂã∏ú≤ï\‰\Ìù}J\ \—\’,ùQGÅ\‘dî’ºiQû¶Å©ö¢\·hŸ®D)ØQu,¡g∞™˝òı™B\”—ì€çΩô\ﬁ¸Æ\‡´f4ï∫§∂\ÀDπJü˚n]HòŸõ\ÌxZ\Õ\“Ùsh\÷\”\Œx™\Àwsß\Àr*à) îzbpáÙÉwKhl/gïUE\\z=Ö\ \r\–L#f)\Ÿ#CøZN¥®\∆5˚\∆,%’∂)ÿäé! ±Hı\Z¥˘î\\ËÅõÆ\÷\Ëû\√.\⁄Gòê¢\Ìı¶oS∫˛\È\√N\‹jZêÆcj©zUåYäû¶•a\"a\Î–¶\“å•jµ^S†Ç\–\“,\·\◊<ÇfLöØuu%iihùàÔπ•”∂µ∂œ™™\‚\ﬁXji\Ãeª¶\€\€I[ïQ\√2®(´\€_SO\Íß4\Â*\·ìGpµ4L\€iH\ MöG}´\Ê.LÅ´híé∑t=?g“ßïrù ôp\‚=Fn\◊i+ \ ó,£Aëú+í	ä\n¶\n\ ;jCT\…˜j\÷ Ü∫z6mmjv&Ωˇ\0NÆw4æÒky;≤≠,º3hÙ-˙|•CkXB6ïM˚•j1ìmLP/$≥8í∑V@#õ±Q6û∏„ü¨\‚M.Y[Õ∂òiÑãZ~ùçtú\ m\‹¡¡ãB\ƒ7M\‹c\ÌN5îd\nb\Ÿ\Ë§C,ëS1Å\Ôﬁä]ÿπUû\÷7m*˙\÷z¶¢¨mﬂ¶iS2ªWHQ4\ÌEF)X\ŒCDπM≤n\‘d˛®îëó1^∫{\›.\Ë\‰hf\Ì\nìr™M\◊\»<_æ|˘\ÁR\Ícı\Îü\ÁO.úø<\Í]3ª√ä°\‰!\‰sútH\ﬁˇ\0w\œFßªE\–s\‡8ã¿\∆îX•(¶9$ü∂p\0˜\⁄ŒçN?O?\–u}\ﬂ?¶†~û^C®ì\Ó˘˝th‘ºe˜p8dp?Ä|sÄ\0\Ê8\rj\’\È\ﬁ\Ê\“ˆ\Õ\√\À…∏+[BãR™+∞í´#\\ÃêR\ÏX≈üIî\‚!\¬PQ≤a\≈\‘@\0GA¥˙§rêyòúá¥`ó¿ÄèO,0∆õE∏OJ7av\ƒG\⁄ãâ~\Ê€ïd\—Vüâ$\r4w\»\ﬂl\…\ƒQâé\‘\‚ê\0ê;rﬁïû¯´Ú\»\∆\ÿKwl,tJ¿tëïí3ä∆¶E\»a™ìFÀÄ`\∆:R\‚Büü\0ÜA\–\Óbnöí3\“—ê±\…}.˝§c\0\‰DUt˘f\Ë1ú\ÂO\«!I]\ÊLvIn*Äπ\‘\÷\Á&¨;\ÿ⁄∂èö¶\ÁØ;™*\›CL∞E≤±LR7≤BÇüåà®©ì#\›ƒªm6Òè\⁄$\‘´\ÎúEM∫~\÷¸\‘\Í≥-y∏-\∆>íX\È´H[vïÄB¨îZ.z\r¢$f\‹DxD%¶Å√Ö{æ16\«/\ŸÒ€é\∆\ﬁ\‘(\‘\÷\Ô;Ä∏±Û-*ömùSBπ®d\ŸO,≤\“	IS∞ıltäÇ\Ï\‚4{\‘]Å\¬\ÿÒ¿ôÜ†Wî¸\’P\’Ù}#UH€àJ∂®eJN£ ˘§≠2\Œ~E¥ÚÆ\·[;äM\Ã\Ã\"d‹ò{Ä!\‹2ïã\›&ÚDP≥6{r%\ÊAM\≈\–\… ªGGvä»°jî™äál\‘\…,aõ˜gL!¬≤\≈1L,z∏6r\Ì\Ì\¬j>òº\÷\Î\ÿ\Í\›ÿ∫xÉ:\¬Nî|˘í\"íB£\Ï\‘MeíA¡\»*ªTL\‚°SLGåD7k˚üΩªn¶\Í[3Ω[¢¥e[\"\ŒBj\"ï®%*JÆaÖöUIúÉ\na√∏\ÿıéâ;\Ë¶+ï©êM\—WAôp\Îä\"<Ñ0?®ı\Î˘ÛŒ°Æxœ∑wµR\‘0ßZ‹´\Ôg^3âMî-ı¢©™∫∂™HôHP\Ô©\Î\\ZNb%eSÖ¨¢äùe¢™d\nRª[≤C¥˙3¥\∆\“\‹Jç\≈4eyf\Í¯ä2π\¬;Jç®úTPF©!\'©ìOTÒ-V`Uõ?Ö®√ñ.€ïFííl\›&™@ß5\‚2.)id¢î*oå\’P@\ÊPR\08îxCå|dq\ÃJbáºFæº˘ê$S≥:W∏l	àÆ∑K›§\0<g\‚7≤!\œ\"\◊¥h0ˆ\Á˜#n∂ùej\À\ÂtUê-)J-O∞3Hí±<ú¨\ÂYQFRt\Ã+…Ωåäl¨¨¸\Àáëóìéàãn¢ÚRè⁄∞j∫\ƒC˚\«\⁄q\⁄_∞U\Œ\“,ñ\ŸWßù48•&\ﬁ¯E^\nÒö¶ ˜*¢\ !º=G)Ñ\Î60Õ¥:Ä ıT∞\Ë\ÎAº\r¥[}\›\Ì˛ª∞ó^!\‰\≈Y•≤‰åî{\r-/NÃ±®i\…»©6\"Õ§!&£ôH7ïvéµ~\—\”5ñ@\ÌkØ=yh\Ód\Ïçˇ\0Æ©uíP\Í≤,\ÀR*§%0ô08%)i<îxGΩ\Ôî8µ\Ãt	âº;ª\€otM,ç›∫õÅÅÄ\\W:\‘\Õ\'GØJ\“ Äàß\≈j\‹\Ã\"¢\0LV(\¬\◊1\“%í¿^˙˙ªoOT\’Eºß%$U0≠Vﬁõö≠+\–\‚°J\'ëíÆ£(\Ÿsò\¬b Ñ2 ® ß	C\Ztk\Ìâˆ\œm\Ë\Œˇ\0π∏\Ï¯ª®©\nÆY\ +&@\…R˚\·DTQ@\0ô2\ Ç\" \06KàjΩ\«vê[§cπ]ä—∑Ç\r∏òØd\›Y\ﬂ^ë \‡\Íön\ÿ:îhQáñq^F\‡˚¿!ává\Ë\Â3øda5r∑\€e\Ê\‚\ŒT‹ºß∂\ÎSRuõ\‚†™íï%E0ämÄÖ\‚\„]*-R¶\0\'\0\ÈI\√h~éógÅK\Ÿr-M◊πE\ÔÖ©™w˚ìÆ\¬A∞ÛHhjH≤t#≥*Q\0BJ&,àè#ú†\ZL˙wt›ûwvb\n\‚vsC\”U±`zÙëï\·\ÈX§\√\◊\ \Ÿ\ %dz~\"y¨Çáó\÷PP∞ù>!8à\È-≠\Ê\ﬁ/\ÂÿûñGm\€@íJjñ†B®™\·üH2F8ì≤	F	:∞¥\›2)!V\ƒ+¢%1ﬂÅ\…Jb™\–9\ZªÙç¨\Ìµ\Ÿ\„∞Zé≥f\≈?Vå™ÆY\"≠M∫fTÉÖ7E¢(D9;B\‡¶\‡sPƒüª\‰~ÙG\Õ\…v¿ˆän)(k≥ºòõI=Rqg∂ÖÖ9$-T\œt•]Lùpø∞\"â¡ımëπÅ∞\rl]†Ù˜¡|¡Éã\€tXQpN15;ì\Íê»§le£öñî¢õ•Å	rîy™Å[M∫z0\€Z£	\Z˙\Î´=pHRY\ \\≤ä±PC1•iÚA@$ <$ëBH•œ∑\ﬁcò1˙ù$\rKR.\÷\ŸY˙\“Ú\◊\“nEW3ãäÜ∫©$ù®qw!M\Zje\“\«P\¬c)=Qêπ1ª\—(qiTldj.\Ë≈ìD) ≤4KÛ&SX©\“-Qj®ÜL≠-A¶\Ói¿¶\ÍJí8\∆KòπÉVOc[U\€\‘[Hã]fh™}iêâô(8ˇ\0h\ƒw¶j›´xPq\≈\«\ÍÇp|B<\«lPA®ëªdRnÇe¶Ç	ëHP\∆\nDí)(\0RÄÅ•ªkÙV,\r$å|ˆ\ÈØ5ut\‰\ƒRZBì£D∂˛óUq\0:çú/ª™ù˙g 9ï©é*D\≈”î6Àµùæ\Ì€∑µ[pµtÕ©°\”|¥´®∫v5&ã\ÕLÆäM\‹OT2*\n≤\’”Ñ∑n§¨\€\◊\Ô¡≤µ\"\ƒjäHìa˘{¿üAÛ˛Q¸∫\„û3è\œ˘\”Aén∂Üù»é=I|Ü3ê\‡0c \À\ƒCüA∫5Æ 4\Ë\‡Wk¶@É\◊ÂéºÙh21\‘ dÜ¿à`<ó<t\∆<3\Ó\ÎØ9ä\–s\ƒT˘˚ÕÅ¸√Æç\ZûºlB\‡\"≥v\Ê\œ!)DóÀßˇ\0:j\Ÿ{B—íıòˆ\n	É\'I¿òøw=\Z4∫kkVJ¢wˆÑ•JIª\È\Înb8uÅYQ+√ú\‡;\Ãg8\ÁWDã∂t¿¶x˙bót\0T\ƒ\Z£í°Äò\‡a(\0`\nRCê\0-\Z4-±!#JnõtA0\‰b&Ä\0˜\‹\08«ó-xV¨†ë»ô\–<óêÒ\0\Œz|<4h\–|ÖÆÖ\‹p\‚]\rúaa~#ê\«\«:¢[≥A\Ó\‘1\Êˇ\0ãÑå?Ü>?¶ç\Z\n\È\›*\rA¿\‘q\…Ù\Ê¢¿Ú\»Ä:Û}5\ÏV\‚\—I .B¢àUÒqÑWáÑ2 nÄÅ∞  \r\Z4™\Á\›\ h…†Jn=\…˝Ma\"ep@)\ƒHl\‰xyá0\„fç\Zˇ\Ÿ',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg'),(16,'SAPO','BEMBARAYO',0,_binary 'ˇ\ÿˇ\‡\0JFIF\0\0`\0`\0\0ˇ˛\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nˇ\€\0C\0ˇ\€\0Cˇ¿\0\0h\0h\"\0ˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nˇ\ƒ\0=\0\0\0\0\0\0\0!1	QÅ\n\"Aaqë2°±¡\—\·#RrBí¢£Òˇ\ƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˇ\ƒ\0 \0\0\0\0\0\0\0\0\0\0\0\01Që!qÅ¡Òˇ\⁄\0\0\0?\0ëë)å&»èàr˙¸øMK\Í\Â¯}ˆ◊£˘¸˙\ÍQ\‰>\Ïè.Å\Ô¯¸9\Í\Ì\Ó˙ô:û(w(d@üÜm@SH\Èˇ\0\ƒ?}U0\‰:\‰3Ú¸:Ú\Âœóü]I¶\ﬁ\Ô\ÔÚxπ:I\›#˛\–ˇ\0¥?}CπK?p∏ˇ\0àgÛ˝\≈MU)J è\ƒ\«Û\Î¶\ﬁ\Ôµ2u<è7ró∏Ö˜ı(y{ˇ\0ü∫∞™\⁄ˆ\◊\—ÿ¥Æköè{,ìÖ\„Z\’u<<\‚I™$ìï•.˝ëù¶\›UëMc\"\ngTÖ6¡úäp)Ja\‡>Ù/âá\"\¬Pˆçë\0\0z\Ê√ø\Õˇ\0^Ω\ƒ\Ôf˚Wñ\∆˜‹∫BÅêÆ\‰({`⁄ïÆjhH&6\Óﬁ®zFòïk\·\‰bf™ü¥=Fıt\‚$∫sX\‚\ﬁAB∑@\Àm\Ê\€ı2N$ügFZ™\›‘ÄQß™∫>wè#P\¬J≥åp˙É˜Y\»p\„\Âœê\Í\Ë<SÄî[s\◊	\Áåc¶0=@|C\\¿£´\Œ’ò7	#∫Ω¨\\W\·ã\≈G\∆*\Èu\»R%∏7K<1ñ9ÄÑıóßP´í\‘ˆ•\Ôû.Ø€ï5\Z\÷}yG1D´D\¬3E≤Ï¶ñáUız!W*£E™tLég \ÂQä\Èö4¨\"áÉq0à¶\0oxáPÒ\Í∆≠§≠-\nä ÆîyØ\nÒüå¿\œ s\«Nú¥\ﬁ\ÔFªp{®\‹u†›ïc~.Mot-¥E˙åßl§\Õw(º\ÏåB\„M8®n1,Ù™Hç+úıHxïﬁºm∫Øò≥PÖ*†.\\’øπ-∂N6€õ\Œ|\Ó~RI7$ñÛçmº∂ é-∫©Ñ!YÅÇ9S\0Ç$\ÍQ)\À‘æ\„î3\–y˚¥k ^@Õº©É\∆1¿¶>üL\Ë\‘VQ\0é©âä#\”\œ\Ë=1ûùs˛51˙\œÙR\–Mé!\0\0ı¯\0t˙¯\Í<\‚è\Ì†ùG\Â˙Ü™\Ë)pà~?∂™\0`\0›®\Ë\–&wk\ﬁ\Á\«i›ü˜ˆ\‚E\»>∑©iø\Ì%≥?x¢nØnò©JFæbdƒ¶T\‹Kπ\ \√ >\¬4\Í™pîu\À\Í\·T\n“î\Ì8\ÌÄUyq®8∂®Ä\ÂC¡R3QU=Cë\œ¶´§ÈÜã°Åã“òpC\È\⁄îv\È	P]ª¥\ÿ9˙*\÷S\Ôu\ƒh\—uM\ﬁ\÷5\ o)\ 1\„|˜bˆãå©•êL\n\'\ÎVJ\‰EBa6_∑Ü˜\ÊO~ó.uÅ\‰(MÅv}\Ó:∫p®\"«Ø~*õiYS¥\Ÿ†Åëıò©Ÿ´ç<€ã)\Ë”îªH@-\◊U\Î\Ê4—§£üÆÿà6ZEã¶é\\†\Ìg/K\‘eJ\‡Jb¢\‡\Õ¡∫@Bï3˚F\‚Û\◊	O±†ß¶*™ÊáÜX•T\∆:é\\\Ã\Œ\ÃzKî\‹\‘Y\·ò§í»à™w$IA\‚P˘Zç´\œ9DADïN\Z™E?å›öE˚8É˛\‡:\À&°@Dy5\»ÙŒî≥ìm°ª}Úmo\Ô}°J\‘∑∂\Î pW˛\’Z¿˛¶t\…\ÍÇS6ÛÒÙ\À84ÅBâTZ\‡\"@\ S¸ª!∂∂;=\ÏÚ\€U¢ìèMçl\ÊÜB\‰\‹\‡*\'E…ÆM\÷\\ı\ÂV\’(∏Ä^iµ*ô∞\0Vê\rí¶•*\„¸?}S\∆zàqdGa\»Û¿g\0\0\0ZÜÉ]\·[˙î<cá˛≥||>Ω:h\’+º`-ø®Û\Ôèq\œ\‹\Èõ9@ÒZ4D˝\Á˙©j©˙y˛É®†!\Ã?\Á¸\ÈÂ†Å>¸áÛ\rU\‘\0†¿?\‘tº2rbcüJIªAÑtsG/§9T®7d≈ö*9x\Ìué Dëj\Ÿ%WUCâ¶c\‡^\Ì#ov\Ï[\Ì7≥^ˆ\À6òjÆÚ$\∆¿\“OP\n·ëÆQ\\≥¨¶äY4\‡≠\ÀJµ\ÔÆ\nVØEÜT*ã\"CÉ˜õπï˜9ª=\∆\Ó™`\Î=Ö®´z\Œ\‰¬¥v†ü∫∑t\ZhDZöt\¬~@õ®xä»Å@¨´ë\ÂCéú9\Ÿ]µG∂o—§\ﬂ\›Ò´\Zn.Ùˆ\Âª+\’*˝¡T+ı\Ë8´WZ\“v\Õ5¿\Â\nm£\Í:\Ì°≤ t´ÅTºî3T-Õº{π—∑ˆ\”H3ì´wAy\Ìıà¶Tç]%\∆&%\‘\ÏJR≤\ŒHôÖVl>ôm4™éHâBª\\2\›1>∫jÔ™óµ{p\Ïï\‹’≤l\”V™\€Ïñª≥tªP*g*\»Zµ≠}ëH	ëGRoB≈†ÅY\Î\‡…å9Z∂>Ej*êã0äRı9c\"Ü\ÀPñ9j™úÄ@å´\Î\ÀÙélpéûQ\Ë≥Z\nf¨π˚\œ\›9Ö%üR\È\–[t∑\Õ\"úÙ\√\ÊI\◊5≤ú\ÂDÚë∂˙0ÇÅª\—,DÄ*$#Ä¥ö‰ß°j)\„-/MÑDp\nROU(8Åg\‹\0\0d\Ï`\’/\“\0\0ôßó/(ÙIQUΩÉ\ﬁJk\Â\\/\Ìu\»`¡à∫∂ñ=US\nf8ê@q\¬%\Âçπ\‘>_®\ÍMLnæ_O~:èÛ†K†±Æ!Hje\ÈT)NC\0\»rÅàrèRú¶)ä!\»@¿ !\»@CF©\\µäﬁíí\\\‚ Dí1\Ã \"\0Ú\0ê\0¸¥h2˙y˛É†ù<˛üŒæz\”\œ\Î\»u}\ﬂ?ÆÇm\Z4h5˚t[ôµõA≤5ù˛º≤R1\‘úAd	ˆ\ÕC)#PNGSêPîÙ)\\6R^fZbQ£V¨\”Y \n\Ó\‹,ÉFÆMÖ˛ë/iMí\Ì	ó∞Vä\≈\ŒNTñÍàÑü¨™9\»i∫*jJΩó~\’f\‚ûz£I9à\Ë(8∏ìï\€pw∫Úi∂YS5T\‰~v\Ëˆøe˜ãd´;)+wZµnWmAu#\Êaf#\\ı?U“ìçˆû´)ôD—îÅöfnÒ≥¥ªß	:`\·\„7Î∑Å\ÿ3\⁄y∑+óp\"lÂã∏ú≤ï\‰\Ìù}J\ \—\’,ùQGÅ\‘dî’ºiQû¶Å©ö¢\·hŸ®D)ØQu,¡g∞™˝òı™B\”—ì€çΩô\ﬁ¸Æ\‡´f4ï∫§∂\ÀDπJü˚n]HòŸõ\ÌxZ\Õ\“Ùsh\÷\”\Œx™\Àwsß\Àr*à) îzbpáÙÉwKhl/gïUE\\z=Ö\ \r\–L#f)\Ÿ#CøZN¥®\∆5˚\∆,%’∂)ÿäé! ±Hı\Z¥˘î\\ËÅõÆ\÷\Ëû\√.\⁄Gòê¢\Ìı¶oS∫˛\È\√N\‹jZêÆcj©zUåYäû¶•a\"a\Î–¶\“å•jµ^S†Ç\–\“,\·\◊<ÇfLöØuu%iihùàÔπ•”∂µ∂œ™™\‚\ﬁXji\Ãeª¶\€\€I[ïQ\√2®(´\€_SO\Íß4\Â*\·ìGpµ4L\€iH\ MöG}´\Ê.LÅ´híé∑t=?g“ßïrù ôp\‚=Fn\◊i+ \ ó,£Aëú+í	ä\n¶\n\ ;jCT\…˜j\÷ Ü∫z6mmjv&Ωˇ\0NÆw4æÒky;≤≠,º3hÙ-˙|•CkXB6ïM˚•j1ìmLP/$≥8í∑V@#õ±Q6û∏„ü¨\‚M.Y[Õ∂òiÑãZ~ùçtú\ m\‹¡¡ãB\ƒ7M\‹c\ÌN5îd\nb\Ÿ\Ë§C,ëS1Å\Ôﬁä]ÿπUû\÷7m*˙\÷z¶¢¨mﬂ¶iS2ªWHQ4\ÌEF)X\ŒCDπM≤n\‘d˛®îëó1^∫{\›.\Ë\‰hf\Ì\nìr™M\◊\»<_æ|˘\ÁR\Ícı\Îü\ÁO.úø<\Í]3ª√ä°\‰!\‰sútH\ﬁˇ\0w\œFßªE\–s\‡8ã¿\∆îX•(¶9$ü∂p\0˜\⁄ŒçN?O?\–u}\ﬂ?¶†~û^C®ì\Ó˘˝th‘ºe˜p8dp?Ä|sÄ\0\Ê8\rj\’\È\ﬁ\Ê\“ˆ\Õ\√\À…∏+[BãR™+∞í´#\\ÃêR\ÏX≈üIî\‚!\¬PQ≤a\≈\‘@\0GA¥˙§rêyòúá¥`ó¿ÄèO,0∆õE∏OJ7av\ƒG\⁄ãâ~\Ê€ïd\—Vüâ$\r4w\»\ﬂl\…\ƒQâé\‘\‚ê\0ê;rﬁïû¯´Ú\»\∆\ÿKwl,tJ¿tëïí3ä∆¶E\»a™ìFÀÄ`\∆:R\‚Büü\0ÜA\–\Óbnöí3\“—ê±\…}.˝§c\0\‰DUt˘f\Ë1ú\ÂO\«!I]\ÊLvIn*Äπ\‘\÷\Á&¨;\ÿ⁄∂èö¶\ÁØ;™*\›CL∞E≤±LR7≤BÇüåà®©ì#\›ƒªm6Òè\⁄$\‘´\ÎúEM∫~\÷¸\‘\Í≥-y∏-\∆>íX\È´H[vïÄB¨îZ.z\r¢$f\‹DxD%¶Å√Ö{æ16\«/\ŸÒ€é\∆\ﬁ\‘(\‘\÷\Ô;Ä∏±Û-*ömùSBπ®d\ŸO,≤\“	IS∞ıltäÇ\Ï\‚4{\‘]Å\¬\ÿÒ¿ôÜ†Wî¸\’P\’Ù}#UH€àJ∂®eJN£ ˘§≠2\Œ~E¥ÚÆ\·[;äM\Ã\Ã\"d‹ò{Ä!\‹2ïã\›&ÚDP≥6{r%\ÊAM\≈\–\… ªGGvä»°jî™äál\‘\…,aõ˜gL!¬≤\≈1L,z∏6r\Ì\Ì\¬j>òº\÷\Î\ÿ\Í\›ÿ∫xÉ:\¬Nî|˘í\"íB£\Ï\‘MeíA¡\»*ªTL\‚°SLGåD7k˚üΩªn¶\Í[3Ω[¢¥e[\"\ŒBj\"ï®%*JÆaÖöUIúÉ\na√∏\ÿıéâ;\Ë¶+ï©êM\—WAôp\Îä\"<Ñ0?®ı\Î˘ÛŒ°Æxœ∑wµR\‘0ßZ‹´\Ôg^3âMî-ı¢©™∫∂™HôHP\Ô©\Î\\ZNb%eSÖ¨¢äùe¢™d\nRª[≤C¥˙3¥\∆\“\‹Jç\≈4eyf\Í¯ä2π\¬;Jç®úTPF©!\'©ìOTÒ-V`Uõ?Ö®√ñ.€ïFííl\›&™@ß5\‚2.)id¢î*oå\’P@\ÊPR\08îxCå|dq\ÃJbáºFæº˘ê$S≥:W∏l	àÆ∑K›§\0<g\‚7≤!\œ\"\◊¥h0ˆ\Á˜#n∂ùej\À\ÂtUê-)J-O∞3Hí±<ú¨\ÂYQFRt\Ã+…Ωåäl¨¨¸\Àáëóìéàãn¢ÚRè⁄∞j∫\ƒC˚\«\⁄q\⁄_∞U\Œ\“,ñ\ŸWßù48•&\ﬁ¯E^\nÒö¶ ˜*¢\ !º=G)Ñ\Î60Õ¥:Ä ıT∞\Ë\ÎAº\r¥[}\›\Ì˛ª∞ó^!\‰\≈Y•≤‰åî{\r-/NÃ±®i\…»©6\"Õ§!&£ôH7ïvéµ~\—\”5ñ@\ÌkØ=yh\Ód\Ïçˇ\0Æ©uíP\Í≤,\ÀR*§%0ô08%)i<îxGΩ\Ôî8µ\Ãt	âº;ª\€otM,ç›∫õÅÅÄ\\W:\‘\Õ\'GØJ\“ Äàß\≈j\‹\Ã\"¢\0LV(\¬\◊1\“%í¿^˙˙ªoOT\’Eºß%$U0≠Vﬁõö≠+\–\‚°J\'ëíÆ£(\Ÿsò\¬b Ñ2 ® ß	C\Ztk\Ìâˆ\œm\Ë\Œˇ\0π∏\Ï¯ª®©\nÆY\ +&@\…R˚\·DTQ@\0ô2\ Ç\" \06KàjΩ\«vê[§cπ]ä—∑Ç\r∏òØd\›Y\ﬂ^ë \‡\Íön\ÿ:îhQáñq^F\‡˚¿!ává\Ë\Â3øda5r∑\€e\Ê\‚\ŒT‹ºß∂\ÎSRuõ\‚†™íï%E0ämÄÖ\‚\„]*-R¶\0\'\0\ÈI\√h~éógÅK\Ÿr-M◊πE\ÔÖ©™w˚ìÆ\¬A∞ÛHhjH≤t#≥*Q\0BJ&,àè#ú†\ZL˙wt›ûwvb\n\‚vsC\”U±`zÙëï\·\ÈX§\√\◊\ \Ÿ\ %dz~\"y¨Çáó\÷PP∞ù>!8à\È-≠\Ê\ﬁ/\ÂÿûñGm\€@íJjñ†B®™\·üH2F8ì≤	F	:∞¥\›2)!V\ƒ+¢%1ﬂÅ\…Jb™\–9\ZªÙç¨\Ìµ\Ÿ\„∞Zé≥f\≈?Vå™ÆY\"≠M∫fTÉÖ7E¢(D9;B\‡¶\‡sPƒüª\‰~ÙG\Õ\…v¿ˆän)(k≥ºòõI=Rqg∂ÖÖ9$-T\œt•]Lùpø∞\"â¡ımëπÅ∞\rl]†Ù˜¡|¡Éã\€tXQpN15;ì\Íê»§le£öñî¢õ•Å	rîy™Å[M∫z0\€Z£	\Z˙\Î´=pHRY\ \\≤ä±PC1•iÚA@$ <$ëBH•œ∑\ﬁcò1˙ù$\rKR.\÷\ŸY˙\“Ú\◊\“nEW3ãäÜ∫©$ù®qw!M\Zje\“\«P\¬c)=Qêπ1ª\—(qiTldj.\Ë≈ìD) ≤4KÛ&SX©\“-Qj®ÜL≠-A¶\Ói¿¶\ÍJí8\∆KòπÉVOc[U\€\‘[Hã]fh™}iêâô(8ˇ\0h\ƒw¶j›´xPq\≈\«\ÍÇp|B<\«lPA®ëªdRnÇe¶Ç	ëHP\∆\nDí)(\0RÄÅ•ªkÙV,\r$å|ˆ\ÈØ5ut\‰\ƒRZBì£D∂˛óUq\0:çú/ª™ù˙g 9ï©é*D\≈”î6Àµùæ\Ì€∑µ[pµtÕ©°\”|¥´®∫v5&ã\ÕLÆäM\‹OT2*\n≤\’”Ñ∑n§¨\€\◊\Ô¡≤µ\"\ƒjäHìa˘{¿üAÛ˛Q¸∫\„û3è\œ˘\”Aén∂Üù»é=I|Ü3ê\‡0c \À\ƒCüA∫5Æ 4\Ë\‡Wk¶@É\◊ÂéºÙh21\‘ dÜ¿à`<ó<t\∆<3\Ó\ÎØ9ä\–s\ƒT˘˚ÕÅ¸√Æç\ZûºlB\‡\"≥v\Ê\œ!)DóÀßˇ\0:j\Ÿ{B—íıòˆ\n	É\'I¿òøw=\Z4∫kkVJ¢wˆÑ•JIª\È\Înb8uÅYQ+√ú\‡;\Ãg8\ÁWDã∂t¿¶x˙bót\0T\ƒ\Z£í°Äò\‡a(\0`\nRCê\0-\Z4-±!#JnõtA0\‰b&Ä\0˜\‹\08«ó-xV¨†ë»ô\–<óêÒ\0\Œz|<4h\–|ÖÆÖ\‹p\‚]\rúaa~#ê\«\«:¢[≥A\Ó\‘1\Êˇ\0ãÑå?Ü>?¶ç\Z\n\È\›*\rA¿\‘q\…Ù\Ê¢¿Ú\»Ä:Û}5\ÏV\‚\—I .B¢àUÒqÑWáÑ2 nÄÅ∞  \r\Z4™\Á\›\ h…†Jn=\…˝Ma\"ep@)\ƒHl\‰xyá0\„fç\Zˇ\Ÿ',0,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (7,1,'Cedula','123','123','123','123','Juridica','2023-10-18',0),(8,1,'Cedula','wendy','12121','12121','joejao','Natural','2023-10-09',0),(9,1,'Pasaporte','djaodjwoaw','12121','12121','joejao','Juridica','2023-10-09',0),(10,1,'bobo','CALLATEWE','o','22','o','21','2003-12-10',1),(11,1,'Cedula','hoihihio','cdcd','hihi','oohio','Natural','2023-10-11',1);
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
INSERT INTO `usuario` VALUES (1,1,1,'sas','as','asas','as',1,'123','123','2005-12-19',''),(3,2,3,'bemba','123','bembarayo@gmail.com','La Tierra',0,'123','123','2023-10-10','Pasaporte'),(12,1,3,'121','12121','21','121',1,'121','123','2023-10-11','Cedula'),(366,3,1,'JOJOJOJOJOJOJ','hiohihoiiohiohoiiohioh','iohiohiohiohhiddhofed','12333',1,'123','1233','2023-10-03','Tarjeta de Identidad'),(2902,1,1,'BEMBARAYO2.0','jwio','jijio','oadwaw',1,'adwaadwa','adwa','2023-10-17','Tarjeta de Identidad'),(12345,1,3,'12121','182109281','09281209180','2121',0,'12121','12123','2023-10-11','Cedula'),(98292,2,1,'BEMBA RAYO','3u091813','boladecarne','jojo',0,'23','3232','2023-10-31','Tarjeta de Identidad'),(123333,1,1,'JOEJOAJOE','12131','1213','12121',0,'123','123','2021-07-06','Cedula');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int)
BEGIN
update cliente set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo where cedula = ced;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Provedor`(in idpro int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipoofperson varchar(45))
BEGIN
update proveedor set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodepersona = tipoofperson where idProveedor = idpro;
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
select * from mostrar_provedor where Identificador like concat('%',valor,'%') || Genero like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || TipoDePersona like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%');
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
/*!50003 DROP PROCEDURE IF EXISTS `Insersion Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion Factura_Compra`(in idProve int, in idusuario int, in descuent float, in typeofpayment varchar(45))
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion) values (idProve, idusuario, current_date(), '0', descuent, typeofpayment, '1');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura`(in tipodepago varchar(45), in CC int, in iduser int)
BEGIN
insert into factura (fecha, tipopago, totalfactura, cedula, idusuario, condicion) values (current_date(),tipodepago, '1', CC, iduser);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra`(in idProve int, in idusuario int, in descuent float, in typeofpayment varchar(45))
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion) values (idProve, idusuario, current_date(), '0', descuent, typeofpayment, '1');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 11:59:14
