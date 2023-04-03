CREATE DATABASE  IF NOT EXISTS `dpir` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dpir`;
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
-- Table structure for table `dim_adquisicion`
--

DROP TABLE IF EXISTS `dim_adquisicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_adquisicion` (
  `Adquisicion_FK` int NOT NULL AUTO_INCREMENT,
  `Tipo_Adquisicion` varchar(45) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Adquisicion_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_adquisicion`
--

LOCK TABLES `dim_adquisicion` WRITE;
/*!40000 ALTER TABLE `dim_adquisicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_adquisicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_date`
--

DROP TABLE IF EXISTS `dim_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_date` (
  `Date_key` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Mes` varchar(45) DEFAULT NULL,
  `Año` int DEFAULT NULL,
  `Mes_Año` varchar(45) DEFAULT NULL,
  `Fecha +40d` date DEFAULT NULL,
  PRIMARY KEY (`Date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_date`
--

LOCK TABLES `dim_date` WRITE;
/*!40000 ALTER TABLE `dim_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_divisas`
--

DROP TABLE IF EXISTS `dim_divisas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_divisas` (
  `Divisa_FK` int NOT NULL AUTO_INCREMENT,
  `Divisa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Divisa_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_divisas`
--

LOCK TABLES `dim_divisas` WRITE;
/*!40000 ALTER TABLE `dim_divisas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_divisas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_entidad`
--

DROP TABLE IF EXISTS `dim_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_entidad` (
  `Entidad_FK` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Sub_Tipo` varchar(45) DEFAULT NULL,
  `Unidad_Compradora` varchar(45) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entidad_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_entidad`
--

LOCK TABLES `dim_entidad` WRITE;
/*!40000 ALTER TABLE `dim_entidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_fuente`
--

DROP TABLE IF EXISTS `dim_fuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_fuente` (
  `Fuente_FK` int NOT NULL AUTO_INCREMENT,
  `FuenteDatos` varchar(45) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fuente_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_fuente`
--

LOCK TABLES `dim_fuente` WRITE;
/*!40000 ALTER TABLE `dim_fuente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_fuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_medida`
--

DROP TABLE IF EXISTS `dim_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_medida` (
  `Medida_FK` int NOT NULL AUTO_INCREMENT,
  `UnidadMedida` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Medida_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_medida`
--

LOCK TABLES `dim_medida` WRITE;
/*!40000 ALTER TABLE `dim_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_productos`
--

DROP TABLE IF EXISTS `dim_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_productos` (
  `Producto_FK` int NOT NULL AUTO_INCREMENT,
  `Cod_INE` varchar(45) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Especificaciones` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Producto_FK`),
  UNIQUE KEY `Cod_INE_UNIQUE` (`Cod_INE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_productos`
--

LOCK TABLES `dim_productos` WRITE;
/*!40000 ALTER TABLE `dim_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_proveedor`
--

DROP TABLE IF EXISTS `dim_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_proveedor` (
  `Proveedor_FK` int NOT NULL AUTO_INCREMENT,
  `NIT` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Teléfono` varchar(45) DEFAULT NULL,
  `e-mail` varchar(45) DEFAULT NULL,
  `Comentarios` text,
  `Sector` varchar(45) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Proveedor_FK`),
  UNIQUE KEY `NIT_UNIQUE` (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_proveedor`
--

LOCK TABLES `dim_proveedor` WRITE;
/*!40000 ALTER TABLE `dim_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_rubro`
--

DROP TABLE IF EXISTS `dim_rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_rubro` (
  `Rubro_FK` int NOT NULL AUTO_INCREMENT,
  `Rubro` varchar(45) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Rubro_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_rubro`
--

LOCK TABLES `dim_rubro` WRITE;
/*!40000 ALTER TABLE `dim_rubro` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_rubro` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2023-03-31 15:22:15
