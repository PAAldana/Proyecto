-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dpir
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `fact_evento`
--

DROP TABLE IF EXISTS `fact_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_evento` (
  `Evento_ID` int NOT NULL,
  `NOG` int NOT NULL,
  `Producto_FK` int NOT NULL,
  `Rubro_FK` int NOT NULL,
  `Entidad_FK` int NOT NULL,
  `Medida_FK` int NOT NULL,
  `Adquisicion_FK` int NOT NULL,
  `date_key` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `Enlace` varchar(45) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Evento_ID`,`NOG`,`Producto_FK`,`Entidad_FK`,`Medida_FK`,`Adquisicion_FK`),
  KEY `EventoProducto_idx` (`Producto_FK`),
  KEY `EventoRubro_idx` (`Rubro_FK`),
  KEY `EventoEntidad_idx` (`Entidad_FK`),
  KEY `EventoMedida_idx` (`Medida_FK`),
  KEY `EventoAdquisicion_idx` (`Adquisicion_FK`),
  KEY `EventoFecha_idx` (`date_key`),
  CONSTRAINT `EventoAdquisicion` FOREIGN KEY (`Adquisicion_FK`) REFERENCES `dim_adquisicion` (`Adquisicion_FK`),
  CONSTRAINT `EventoEntidad` FOREIGN KEY (`Entidad_FK`) REFERENCES `dim_entidad` (`Entidad_FK`) ON UPDATE CASCADE,
  CONSTRAINT `EventoFecha` FOREIGN KEY (`date_key`) REFERENCES `dim_date` (`Date_key`),
  CONSTRAINT `EventoMedida` FOREIGN KEY (`Medida_FK`) REFERENCES `dim_medida` (`Medida_FK`) ON UPDATE CASCADE,
  CONSTRAINT `EventoProducto` FOREIGN KEY (`Producto_FK`) REFERENCES `dim_productos` (`Producto_FK`) ON UPDATE CASCADE,
  CONSTRAINT `EventoRubro` FOREIGN KEY (`Rubro_FK`) REFERENCES `dim_rubro` (`Rubro_FK`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_evento`
--

LOCK TABLES `fact_evento` WRITE;
/*!40000 ALTER TABLE `fact_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_evento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-31 15:09:25
