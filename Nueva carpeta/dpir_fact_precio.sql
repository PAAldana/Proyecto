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
-- Table structure for table `fact_precio`
--

DROP TABLE IF EXISTS `fact_precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_precio` (
  `Precio_ID` int NOT NULL AUTO_INCREMENT,
  `Producto_FK` int NOT NULL,
  `Proveedor_FK` int NOT NULL,
  `Fuente_FK` int NOT NULL,
  `Medida_FK` int NOT NULL,
  `Date_key` int NOT NULL,
  `Divisa_FK` int NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Marca` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `NOG` varchar(45) DEFAULT NULL,
  `Responsable` varchar(45) DEFAULT NULL,
  `Observaciones` text,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Precio_ID`,`Producto_FK`,`Proveedor_FK`,`Fuente_FK`,`Medida_FK`),
  KEY `ProductoPrecio_idx` (`Producto_FK`),
  KEY `ProveedorPrecio_idx` (`Proveedor_FK`),
  KEY `FuentePrecio_idx` (`Fuente_FK`),
  KEY `MedidaPrecio_idx` (`Medida_FK`),
  KEY `FechaPrecio_idx` (`Date_key`),
  KEY `DivisaPrecio_idx` (`Divisa_FK`),
  CONSTRAINT `DivisaPrecio` FOREIGN KEY (`Divisa_FK`) REFERENCES `dim_divisas` (`Divisa_FK`),
  CONSTRAINT `FechaPrecio` FOREIGN KEY (`Date_key`) REFERENCES `dim_date` (`Date_key`),
  CONSTRAINT `FuentePrecio` FOREIGN KEY (`Fuente_FK`) REFERENCES `dim_fuente` (`Fuente_FK`),
  CONSTRAINT `MedidaPrecio` FOREIGN KEY (`Medida_FK`) REFERENCES `dim_medida` (`Medida_FK`),
  CONSTRAINT `ProductoPrecio` FOREIGN KEY (`Producto_FK`) REFERENCES `dim_productos` (`Producto_FK`),
  CONSTRAINT `ProveedorPrecio` FOREIGN KEY (`Proveedor_FK`) REFERENCES `dim_proveedor` (`Proveedor_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_precio`
--

LOCK TABLES `fact_precio` WRITE;
/*!40000 ALTER TABLE `fact_precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_precio` ENABLE KEYS */;
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
