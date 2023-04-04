DDL_QUERY = '''
DROP TABLE IF EXISTS dim_adquisicion;

CREATE TABLE dim_adquisicion (
  Adquisicion_FK int NOT NULL AUTO_INCREMENT,
  Tipo_Adquisicion varchar(45) NOT NULL,
  timestamp datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Adquisicion_FK)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



LOCK TABLES `dim_adquisicion` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_date`;

CREATE TABLE `dim_date` (
  `Date_key` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Mes` varchar(45) DEFAULT NULL,
  `Año` int DEFAULT NULL,
  `Mes_Año` varchar(45) DEFAULT NULL,
  `Fecha +40d` date DEFAULT NULL,
  PRIMARY KEY (`Date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




LOCK TABLES `dim_date` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_divisas`;

CREATE TABLE `dim_divisas` (
  `Divisa_FK` int NOT NULL AUTO_INCREMENT,
  `Divisa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Divisa_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




LOCK TABLES `dim_divisas` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_entidad`;
CREATE TABLE `dim_entidad` (
  `Entidad_FK` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Sub_Tipo` varchar(45) DEFAULT NULL,
  `Unidad_Compradora` varchar(45) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Entidad_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




LOCK TABLES `dim_entidad` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_fuente`;
CREATE TABLE `dim_fuente` (
  `Fuente_FK` int NOT NULL AUTO_INCREMENT,
  `FuenteDatos` varchar(45) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Fuente_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


LOCK TABLES `dim_fuente` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_medida`;
CREATE TABLE `dim_medida` (
  `Medida_FK` int NOT NULL AUTO_INCREMENT,
  `UnidadMedida` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Medida_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




LOCK TABLES `dim_medida` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_productos`;

CREATE TABLE `dim_productos` (
  `Producto_FK` int NOT NULL AUTO_INCREMENT,
  `Cod_INE` varchar(45) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Especificaciones` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Producto_FK`),
  UNIQUE KEY `Cod_INE_UNIQUE` (`Cod_INE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='			';




LOCK TABLES `dim_productos` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_proveedor`;

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




LOCK TABLES `dim_proveedor` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `dim_rubro`;
CREATE TABLE `dim_rubro` (
  `Rubro_FK` int NOT NULL AUTO_INCREMENT,
  `Rubro` varchar(45) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Rubro_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




LOCK TABLES `dim_rubro` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `fact_evento`;
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



LOCK TABLES `fact_evento` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `fact_precio`;

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



LOCK TABLES `fact_precio` WRITE;
UNLOCK TABLES;

'''
